# A&I Admin Web Service

Flutter Web 기반의 A&I 관리자 콘솔입니다.

## 1. 이 프로젝트에서 하는 일

- 관리자 로그인/세션 처리
- 사용자 목록 조회
- 사용자 생성(초대 방식)
- 사용자 상세 확인 및 초대 링크 복사
- Firebase Hosting 배포

## 2. 빠른 시작 (로컬 실행)

### 요구 사항

- Flutter SDK 3.x
- Dart `^3.10.4` (Flutter에 포함)
- Chrome (웹 실행용)

### 설치 및 실행

```bash
flutter --version
flutter pub get
flutter run -d chrome
```

로컬 디버그 빌드는 아래 명령어로 실행합니다.

```bash
flutter run -d chrome --web-browser-flag "--disable-web-security" --dart-define=API_URL=https://api.aandiclub.com
```

기본 API URL은 `http://localhost:8080`입니다.

다른 API를 사용하려면:

```bash
flutter run -d chrome --dart-define=API_URL=https://api.aandiclub.com
```

## 2-1. Monorepo 관리 (melos)

이 저장소는 `packages/*` 아래 로컬 패키지를 함께 관리하는 monorepo 구조입니다.

설치:

```bash
dart pub get
dart run melos --help
```

주요 명령:

```bash
dart run melos run pub:get
dart run melos run analyze
dart run melos run format
dart run melos run test
dart run melos run build
```

참고:

- `melos`는 `packages/*` 워크스페이스 관리용입니다.
- 루트 앱 실행/테스트는 기존처럼 `flutter run`, `flutter test`를 사용합니다.

## 3. URL에서 `#` 제거 (Hash URL 비활성화)

이 프로젝트는 `Path URL strategy`를 사용합니다.

- 적용 위치: `lib/main.dart`
- 핵심 코드: `usePathUrlStrategy()`

배포 환경에서도 동작하려면 SPA rewrite가 필요합니다. 이 프로젝트는 이미 `firebase.json`에 아래가 설정되어 있습니다.

- `"source": "**"`
- `"destination": "/index.html"`

즉, `/#/dashboard` 대신 `/dashboard` 경로를 사용합니다.

## 4. 기술 스택

- Flutter / Dart
- Riverpod
- go_router
- http
- Firebase Hosting
- GitHub Actions

## 5. 폴더 구조

```text
.
├─ lib/
│  ├─ app/                 # 앱 엔트리, 라우팅, 환경 변수
│  └─ features/
│     ├─ auth/             # 인증 상태 관리
│     ├─ login/            # 로그인 화면
│     ├─ dashboard/        # 대시보드 레이아웃/탭
│     ├─ users-manage/     # 사용자 관리
│     └─ my-info/          # 내 정보 화면
├─ packages/
│  ├─ api_protocol/        # 공통 통신 규약 패키지 (aandi_api_protocol)
│  ├─ auth/                # 공통 인증 패키지 (aandi_auth)
│  ├─ admin_api/           # 관리자 API 패키지 (aandi_admin_api)
│  ├─ course_api/          # 코스 API 패키지 (aandi_course_api)
│  ├─ oj_api/              # OJ API 패키지 (aandi_oj_api)
│  └─ tech_blog/           # 기술 블로그 API 패키지 (aandi_tech_blog)
├─ test/
├─ firebase.json
└─ .github/workflows/firebase-hosting-deploy.yml
```

## 6. 패키지 경계 (중요)

### `packages/auth` (`aandi_auth`)

- 로그인/토큰/세션/권한(AuthRole)
- 여러 클라이언트에서 재사용 가능한 인증 도메인

### `packages/admin_api` (`aandi_admin_api`)

- `/v2/admin/*` 사용자 관리 API 클라이언트
- 관리자 기능 스펙 분리

### `packages/course_api` (`aandi_course_api`)

- `/v2/admin/courses/*` 코스/수강/과제 API 클라이언트

### `packages/oj_api` (`aandi_oj_api`)

- `/v2/admin/testcases`, `/v2/admin/submissions` API 클라이언트

### `packages/api_protocol` (`aandi_api_protocol`)

- A&I 공통 헤더 규약 처리
- `Authenticate`, `deviceOS`, `timestamp` 주입

원칙:

- 인증 공통 로직은 `packages/auth`
- 관리자 API 호출/DTO는 `packages/admin_api`

## 7. 테스트

전체 테스트:

```bash
flutter test
```

주요 테스트 파일:

- `test/features/users_manage/data/datasources/users_management_api_client_test.dart`
- `test/features/users_manage/presentation/bloc/users_management_bloc_test.dart`
- `test/features/users_manage/views/users_management_table_view_test.dart`
- `test/widget_test.dart`

## 8. Melos 버전 관리 (모노레포)

이 레포는 `melos` + Dart workspace 기반으로 버전 관리를 수행합니다.

워크스페이스 패키지:

- `packages/auth` (`aandi_auth`)
- `packages/admin_api` (`aandi_admin_api`)
- `packages/tech_blog` (`aandi_tech_blog`)

각 패키지는 자체 `CHANGELOG.md`를 유지합니다.

- `packages/auth/CHANGELOG.md`
- `packages/admin_api/CHANGELOG.md`
- `packages/tech_blog/CHANGELOG.md`

초기 1회(마이그레이션 시점) 기준 태그 생성:

```bash
git tag aandi_auth-v0.1.0
git tag aandi_admin_api-v0.1.0
git tag aandi_tech_blog-v0.1.0
git push origin aandi_auth-v0.1.0 aandi_admin_api-v0.1.0 aandi_tech_blog-v0.1.0
```

일반 릴리즈(버전/체인지로그/태그):

```bash
dart pub get
dart run melos bootstrap
dart run melos version --all
git push
git push --tags
```

Conventional Commits 기준:

- `feat:` -> minor bump
- `fix:`/`refactor:` 등 -> patch bump
- `feat!:` 또는 `BREAKING CHANGE:` -> major bump

`melos version --all` 실행 시:

- 패키지별 `pubspec.yaml` version 업데이트
- 패키지별 `CHANGELOG.md` 및 워크스페이스 changelog 갱신
- release 커밋/태그(`{package}-v{version}`) 생성

### 8.1 패키지별 GitHub 저장소 분리 푸시

사전 조건:

- 로컬에 `git subtree` 명령 사용 가능해야 함

1) 설정 파일 생성:

```bash
cp scripts/package_repos.example.env scripts/package_repos.env
```

2) `scripts/package_repos.env`에 저장소 설정:

```bash
TARGET_BRANCH=main
AUTH_REPO_URL=<org>/<auth-repo>
ADMIN_API_REPO_URL=<org>/<admin-api-repo>
TECH_BLOG_REPO_URL=<org>/<tech-blog-repo>
```

3) 분리 푸시 실행:

```bash
bash scripts/sync_package_repos.sh --require-all
```

또는 melos 스크립트로 실행:

```bash
dart run melos run sync_packages
```

릴리즈 + 분리 푸시를 한 번에 실행:

```bash
dart run melos run release_and_sync_packages
```

동작 원리:

- `git subtree split`으로 패키지별 커밋 히스토리 분리
- 각 패키지 저장소 `main` 브랜치로 푸시
- 모노레포 태그 `aandi_auth-vX.Y.Z`를 패키지 저장소 태그 `vX.Y.Z`로 동기화

### 8.2 GitHub Actions 자동 동기화

워크플로:

- `.github/workflows/sync-package-repos.yml`

필요 시크릿:

- `AUTH_REPO_URL`
- `ADMIN_API_REPO_URL`
- `TECH_BLOG_REPO_URL`
- `PACKAGE_REPO_TOKEN` (선택, `<org>/<repo>` 형식 URL 사용 시 권장)

워크플로 트리거:

- `main` 브랜치 push
- `aandi_*-v*` 태그 push
- `workflow_dispatch`

### 8.3 패키지 최신화 운영 방법

기준 원칙:

- 소스 오브 트루스는 모노레포(`A-AND-I-ADMIN-WEB`)입니다.
- 개별 패키지 저장소(`A-AND-I-AUTH-API` 등)는 분리 미러입니다.

전체 패키지 최신화(권장 루틴):

```bash
git checkout main
git pull origin main
dart pub get
dart run melos bootstrap
dart run melos test
dart run melos version --all
git push origin main
git push --tags
bash scripts/sync_package_repos.sh --require-all
```

특정 패키지만 코드 변경한 경우:

- 위 루틴을 그대로 실행해도 됩니다. 변경 없는 패키지는 `Everything up-to-date`로 처리됩니다.
- 또는 빠르게 동기화만 하려면 `bash scripts/sync_package_repos.sh`를 실행하세요.

최신화 확인 방법:

- 모노레포에서 `git log --oneline -n 1 -- packages/<package>`
- 패키지 저장소에서 `main` 최신 커밋 확인 (`git ls-remote --heads <repo-url>`)

주의:

- 개별 패키지 저장소에서 직접 개발하면 모노레포와 이력 분기가 생길 수 있습니다.
- 가능하면 모노레포에서만 변경하고, 분리 푸시는 `sync_package_repos.sh`로만 수행하세요.

## 9. 배포 (Firebase Hosting)

워크플로:

- `.github/workflows/firebase-hosting-deploy.yml`

트리거:

- `v*.*.*` 태그 push
- 또는 `workflow_dispatch`

배포 순서:

1. Flutter setup
2. `flutter pub get`
3. `flutter build web --release --dart-define=API_URL=...`
4. Firebase Hosting deploy

필요 시크릿:

- `FIREBASE_SERVICE_ACCOUNT` (필수)
- `API_URL` (선택)

현재 설정값:

- Firebase project: `aandi-report-web`
- Hosting site: `admin-aandi-web`

## 10. 팀 개발 규칙

- 관리자 API 변경 시 `packages/admin_api`부터 수정
- 기능 추가 시 관련 테스트 같이 업데이트
- 라우트 추가 시 웹 딥링크(새로고침 진입) 동작 확인
- 배포 관련 ID 변경 시 아래 파일을 함께 수정

1. `.github/workflows/firebase-hosting-deploy.yml`
2. `firebase.json`
3. `.firebaserc`

## 11. 트러블슈팅

### 배포 실패: Firebase project 조회 오류

- workflow의 `projectId`와 실제 Firebase 프로젝트 ID가 다를 수 있습니다.
- `FIREBASE_SERVICE_ACCOUNT`가 다른 프로젝트 키일 수 있습니다.

### 배포 실패: `sites/<site-id>/versions 404`

- `firebase.json`의 `hosting.site`를 확인하세요.
- 서비스 계정의 Hosting 권한을 확인하세요.

### 로컬 API CORS 오류

- 프론트에서 해결할 수 없습니다.
- API 서버에서 허용 도메인(CORS allowlist)을 설정해야 합니다.

### 패키지 분리 푸시 실패

- `scripts/package_repos.env`의 저장소 URL(`*_REPO_URL`) 설정을 확인하세요.
- 대상 저장소에 push 권한이 있는 토큰인지 확인하세요 (`PACKAGE_REPO_TOKEN`).
- 동일 버전 태그가 다른 커밋을 가리키면 동기화가 중단됩니다. 원격 태그 정합성을 먼저 맞춘 뒤 재시도하세요.
