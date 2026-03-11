#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "${ROOT_DIR}"

DRY_RUN=false
REQUIRE_ALL=false
CONFIG_FILE="${PACKAGE_REPOS_CONFIG:-${ROOT_DIR}/scripts/package_repos.env}"
TARGET_BRANCH="${TARGET_BRANCH:-main}"
PACKAGE_REPO_TOKEN="${PACKAGE_REPO_TOKEN:-${GITHUB_TOKEN:-}}"

print_usage() {
  cat <<'USAGE'
Usage: bash scripts/sync_package_repos.sh [options]

Options:
  --dry-run            Print commands without pushing
  --require-all        Fail if any package repository URL is missing
  --config <path>      Load env file (default: scripts/package_repos.env)
  --branch <name>      Target branch for split push (default: main)
  -h, --help           Show help

Environment variables:
  AUTH_REPO_URL        Target repository for packages/auth
  ADMIN_API_REPO_URL   Target repository for packages/admin_api
  TECH_BLOG_REPO_URL   Target repository for packages/tech_blog
  PACKAGE_REPO_TOKEN   Optional token for owner/repo shorthand
USAGE
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
    --require-all)
      REQUIRE_ALL=true
      shift
      ;;
    --config)
      CONFIG_FILE="$2"
      shift 2
      ;;
    --branch)
      TARGET_BRANCH="$2"
      shift 2
      ;;
    -h|--help)
      print_usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      print_usage
      exit 1
      ;;
  esac
done

if [[ -f "${CONFIG_FILE}" ]]; then
  # shellcheck disable=SC1090
  source "${CONFIG_FILE}"
fi

normalize_remote() {
  local raw="$1"
  local cleaned="${raw#https://github.com/}"
  cleaned="${cleaned#ssh://git@github.com/}"
  cleaned="${cleaned#git@github.com:}"
  cleaned="${cleaned#github.com/}"
  cleaned="${cleaned%.git}"

  if [[ "${raw}" == *"://"* || "${raw}" == git@github.com:* ]]; then
    echo "${raw}"
    return
  fi

  if [[ "${cleaned}" == */* ]]; then
    if [[ -n "${PACKAGE_REPO_TOKEN}" ]]; then
      echo "https://x-access-token:${PACKAGE_REPO_TOKEN}@github.com/${cleaned}.git"
    else
      echo "https://github.com/${cleaned}.git"
    fi
    return
  fi

  echo "${raw}"
}

push_or_echo() {
  if [[ "${DRY_RUN}" == "true" ]]; then
    printf "[dry-run]"
    for arg in "$@"; do
      printf " %q" "${arg}"
    done
    printf "\n"
    return
  fi

  "$@"
}

sync_branch() {
  local package_name="$1"
  local package_path="$2"
  local remote_url="$3"

  local split_commit
  split_commit="$(git subtree split --prefix="${package_path}" HEAD)"
  echo "Sync branch ${TARGET_BRANCH}: ${package_name} -> ${split_commit}"
  push_or_echo git push "${remote_url}" "${split_commit}:refs/heads/${TARGET_BRANCH}"
}

sync_tags() {
  local package_name="$1"
  local package_path="$2"
  local remote_url="$3"
  local mono_tag

  while IFS= read -r mono_tag; do
    [[ -z "${mono_tag}" ]] && continue

    local simple_tag="${mono_tag#${package_name}-}"
    local tag_commit split_tag_commit remote_tag_hash
    tag_commit="$(git rev-list -n 1 "${mono_tag}")"
    split_tag_commit="$(git subtree split --prefix="${package_path}" "${tag_commit}")"

    if [[ "${DRY_RUN}" == "true" ]]; then
      echo "[dry-run] git push \"${remote_url}\" \"${split_tag_commit}:refs/tags/${simple_tag}\""
      continue
    fi

    remote_tag_hash="$(git ls-remote --tags "${remote_url}" "refs/tags/${simple_tag}" | awk '{print $1}' | head -n 1)"
    if [[ -z "${remote_tag_hash}" ]]; then
      echo "Push tag ${simple_tag} (${mono_tag})"
      git push "${remote_url}" "${split_tag_commit}:refs/tags/${simple_tag}"
      continue
    fi

    if [[ "${remote_tag_hash}" == "${split_tag_commit}" ]]; then
      echo "Tag already synced: ${simple_tag}"
      continue
    fi

    echo "Tag mismatch on ${package_name}: ${simple_tag}" >&2
    echo "Remote=${remote_tag_hash}, LocalSplit=${split_tag_commit}" >&2
    echo "Resolve the remote tag conflict manually, then retry." >&2
    exit 1
  done < <(git tag --list "${package_name}-v*")
}

declare -a PACKAGE_NAMES=("aandi_auth" "aandi_admin_api" "aandi_tech_blog")
declare -a PACKAGE_PATHS=("packages/auth" "packages/admin_api" "packages/tech_blog")
declare -a PACKAGE_REMOTE_KEYS=("AUTH_REPO_URL" "ADMIN_API_REPO_URL" "TECH_BLOG_REPO_URL")

missing_count=0
for i in "${!PACKAGE_NAMES[@]}"; do
  package_name="${PACKAGE_NAMES[$i]}"
  package_path="${PACKAGE_PATHS[$i]}"
  remote_key="${PACKAGE_REMOTE_KEYS[$i]}"
  remote_raw="${!remote_key:-}"

  if [[ -z "${remote_raw}" ]]; then
    echo "Skip ${package_name}: ${remote_key} is not set"
    missing_count=$((missing_count + 1))
    continue
  fi

  remote_url="$(normalize_remote "${remote_raw}")"
  echo "Start sync: ${package_name} (${package_path})"
  sync_branch "${package_name}" "${package_path}" "${remote_url}"
  sync_tags "${package_name}" "${package_path}" "${remote_url}"
done

if [[ "${REQUIRE_ALL}" == "true" && "${missing_count}" -gt 0 ]]; then
  echo "Missing repository URLs for ${missing_count} package(s)." >&2
  exit 1
fi

echo "Package sync completed."
