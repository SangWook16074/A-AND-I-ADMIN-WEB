#!/usr/bin/env python3
"""Create or update a GitHub PR right after git push."""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
import urllib.error
import urllib.parse
import urllib.request
from dataclasses import dataclass
from typing import Iterable


TEMPLATE_CHECKLIST = """## 체크리스트
- [ ] PR 목적이 하나입니다 (한 PR = 한 목적)
- [ ] 변경 범위를 최소화했습니다
- [ ] 문서/가이드가 필요하면 함께 업데이트했습니다
- [ ] (선택) 스크린샷/로그/요청·응답 예시를 첨부했습니다

## 참고 (선택)
- 관련 이슈:
- 기타 공유할 내용:
"""


class GitHubApiError(RuntimeError):
    def __init__(self, status: int, body: str):
        super().__init__(f"GitHub API error ({status}): {body}")
        self.status = status
        self.body = body


@dataclass(frozen=True)
class Repo:
    owner: str
    name: str


def _run_git(*args: str) -> str:
    completed = subprocess.run(
        ["git", *args],
        check=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    return completed.stdout.strip()


def _run_git_or_none(*args: str) -> str | None:
    try:
        return _run_git(*args)
    except subprocess.CalledProcessError:
        return None


def _parse_repo_from_remote_url(url: str) -> Repo | None:
    cleaned = url.strip()
    if cleaned.startswith("git@github.com:"):
        path = cleaned.split(":", 1)[1]
    elif cleaned.startswith("https://github.com/"):
        path = cleaned.removeprefix("https://github.com/")
    elif cleaned.startswith("ssh://git@github.com/"):
        path = cleaned.removeprefix("ssh://git@github.com/")
    else:
        return None

    if path.endswith(".git"):
        path = path[:-4]
    parts = path.split("/")
    if len(parts) != 2 or not parts[0] or not parts[1]:
        return None
    return Repo(owner=parts[0], name=parts[1])


def _request_github(
    token: str,
    method: str,
    path: str,
    *,
    query: dict[str, str] | None = None,
    payload: dict | None = None,
) -> dict | list:
    url = f"https://api.github.com{path}"
    if query:
        url = f"{url}?{urllib.parse.urlencode(query)}"

    data = None
    headers = {
        "Accept": "application/vnd.github+json",
        "Authorization": f"Bearer {token}",
        "X-GitHub-Api-Version": "2022-11-28",
        "User-Agent": "auto-create-pr-on-push-script",
    }
    if payload is not None:
        data = json.dumps(payload).encode("utf-8")
        headers["Content-Type"] = "application/json"

    request = urllib.request.Request(url, data=data, headers=headers, method=method)

    try:
        with urllib.request.urlopen(request) as response:
            body = response.read().decode("utf-8")
            if not body:
                return {}
            return json.loads(body)
    except urllib.error.HTTPError as error:
        error_body = error.read().decode("utf-8", errors="replace")
        raise GitHubApiError(error.code, error_body) from error


def _parse_pushed_branches(lines: Iterable[str]) -> list[str]:
    branches: list[str] = []
    for raw_line in lines:
        line = raw_line.strip()
        if not line:
            continue
        fields = line.split()
        if len(fields) != 4:
            continue
        local_ref, local_sha, remote_ref, _remote_sha = fields
        if local_sha == "0000000000000000000000000000000000000000":
            continue
        if not local_ref.startswith("refs/heads/"):
            continue
        if not remote_ref.startswith("refs/heads/"):
            continue
        branch = local_ref.removeprefix("refs/heads/")
        branches.append(branch)
    return branches


def _find_base_ref(remote_name: str, default_branch: str) -> str | None:
    candidates = [
        f"refs/remotes/{remote_name}/{default_branch}",
        f"refs/remotes/origin/{default_branch}",
        f"refs/heads/{default_branch}",
    ]
    for candidate in candidates:
        if _run_git_or_none("rev-parse", "--verify", candidate) is not None:
            return candidate
    return None


def _collect_commit_subjects(branch_ref: str, base_ref: str | None) -> list[str]:
    if base_ref:
        merge_base = _run_git_or_none("merge-base", branch_ref, base_ref)
        if merge_base:
            history = _run_git_or_none(
                "log",
                "--no-merges",
                "--pretty=%s",
                f"{merge_base}..{branch_ref}",
            )
            if history:
                return [line for line in history.splitlines() if line][:5]

    latest = _run_git_or_none("log", "-1", "--pretty=%s", branch_ref)
    return [latest] if latest else []


def _collect_changed_files(branch_ref: str, base_ref: str | None) -> list[str]:
    if not base_ref:
        return []
    merge_base = _run_git_or_none("merge-base", branch_ref, base_ref)
    if not merge_base:
        return []
    names = _run_git_or_none("diff", "--name-only", f"{merge_base}..{branch_ref}")
    if not names:
        return []
    return [line for line in names.splitlines() if line][:12]


def _build_pr_body(
    *,
    commits: list[str],
    changed_files: list[str],
) -> str:
    what_lines = commits or ["(작성 필요)"]

    if changed_files:
        what_lines = [*what_lines, "", "변경 파일:", *[f"`{path}`" for path in changed_files]]

    body_lines = [
        "## 변경 내용 (What)",
        *[f"- {line}" for line in what_lines],
        "",
        "## 확인 방법 (How to check)",
        "- ",
        "",
        TEMPLATE_CHECKLIST.strip(),
    ]
    return "\n".join(body_lines).strip() + "\n"


def _upsert_pr_for_branch(
    *,
    token: str,
    repo: Repo,
    remote_name: str,
    branch: str,
) -> None:
    repo_info = _request_github(token, "GET", f"/repos/{repo.owner}/{repo.name}")
    if not isinstance(repo_info, dict):
        raise RuntimeError("Unexpected repo info response type.")
    default_branch = str(repo_info.get("default_branch") or "main")
    if branch == default_branch:
        print(f"[auto-pr] Skip default branch push: {branch}")
        return

    branch_ref = f"refs/heads/{branch}"
    if _run_git_or_none("rev-parse", "--verify", branch_ref) is None:
        print(f"[auto-pr] Skip: local ref not found for branch `{branch}`.")
        return

    base_ref = _find_base_ref(remote_name, default_branch)
    commits = _collect_commit_subjects(branch_ref, base_ref)
    changed_files = _collect_changed_files(branch_ref, base_ref)
    title = commits[0] if commits else f"chore: update {branch}"
    body = _build_pr_body(commits=commits, changed_files=changed_files)

    open_pulls = _request_github(
        token,
        "GET",
        f"/repos/{repo.owner}/{repo.name}/pulls",
        query={"state": "open", "head": f"{repo.owner}:{branch}", "base": default_branch},
    )
    if not isinstance(open_pulls, list):
        raise RuntimeError("Unexpected pull list response type.")

    if open_pulls:
        pr = open_pulls[0]
        number = pr["number"]
        updated = _request_github(
            token,
            "PATCH",
            f"/repos/{repo.owner}/{repo.name}/pulls/{number}",
            payload={"title": title, "body": body},
        )
        url = updated.get("html_url", "")
        print(f"[auto-pr] Updated PR #{number}: {url}")
        return

    created = _request_github(
        token,
        "POST",
        f"/repos/{repo.owner}/{repo.name}/pulls",
        payload={
            "title": title,
            "head": branch,
            "base": default_branch,
            "body": body,
            "maintainer_can_modify": True,
        },
    )
    url = created.get("html_url", "")
    print(f"[auto-pr] Created PR: {url}")


def _guess_default_branch(remote_name: str) -> str:
    remote_head = _run_git_or_none("symbolic-ref", f"refs/remotes/{remote_name}/HEAD")
    if remote_head and remote_head.startswith(f"refs/remotes/{remote_name}/"):
        return remote_head.removeprefix(f"refs/remotes/{remote_name}/")

    for candidate in ("main", "master"):
        if _find_base_ref(remote_name, candidate):
            return candidate
    return "main"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--remote-name", required=True)
    parser.add_argument("--remote-url", required=True)
    parser.add_argument("--dry-run", action="store_true")
    args = parser.parse_args()

    repo = _parse_repo_from_remote_url(args.remote_url)
    if repo is None:
        print("[auto-pr] Skip: non-GitHub remote.")
        return 0

    branches = _parse_pushed_branches(sys.stdin.readlines())
    if not branches:
        print("[auto-pr] Skip: no pushed branch refs detected.")
        return 0

    unique_branches = []
    seen: set[str] = set()
    for branch in branches:
        if branch not in seen:
            seen.add(branch)
            unique_branches.append(branch)

    if args.dry_run:
        default_branch = _guess_default_branch(args.remote_name)
        for branch in unique_branches:
            if branch == default_branch:
                print(f"[auto-pr] [dry-run] Skip default branch push: {branch}")
                continue
            branch_ref = f"refs/heads/{branch}"
            base_ref = _find_base_ref(args.remote_name, default_branch)
            commits = _collect_commit_subjects(branch_ref, base_ref)
            changed_files = _collect_changed_files(branch_ref, base_ref)
            title = commits[0] if commits else f"chore: update {branch}"
            body = _build_pr_body(commits=commits, changed_files=changed_files)
            print(f"[auto-pr] [dry-run] Branch: {branch}")
            print(f"[auto-pr] [dry-run] Base: {default_branch}")
            print(f"[auto-pr] [dry-run] Title: {title}")
            print("[auto-pr] [dry-run] Body preview:")
            print(body)
        return 0

    token = os.getenv("GITHUB_TOKEN") or os.getenv("GH_TOKEN")
    if not token:
        print("[auto-pr] Skip: set GITHUB_TOKEN or GH_TOKEN to enable auto PR.")
        return 0

    for branch in unique_branches:
        try:
            _upsert_pr_for_branch(
                token=token,
                repo=repo,
                remote_name=args.remote_name,
                branch=branch,
            )
        except GitHubApiError as error:
            print(f"[auto-pr] GitHub API failure on `{branch}`: {error}")
        except Exception as error:  # pragma: no cover - defensive path
            print(f"[auto-pr] Failure on `{branch}`: {error}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
