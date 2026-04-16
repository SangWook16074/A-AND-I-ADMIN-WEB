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
│  └─ oj_api/              # OJ API 패키지 (aandi_oj_api)
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

## 8. 배포 (Firebase Hosting)

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

## 9. 팀 개발 규칙

- 관리자 API 변경 시 `packages/admin_api`부터 수정
- 기능 추가 시 관련 테스트 같이 업데이트
- 라우트 추가 시 웹 딥링크(새로고침 진입) 동작 확인
- 배포 관련 ID 변경 시 아래 파일을 함께 수정

1. `.github/workflows/firebase-hosting-deploy.yml`
2. `firebase.json`
3. `.firebaserc`

## 10. 트러블슈팅

### 배포 실패: Firebase project 조회 오류

- workflow의 `projectId`와 실제 Firebase 프로젝트 ID가 다를 수 있습니다.
- `FIREBASE_SERVICE_ACCOUNT`가 다른 프로젝트 키일 수 있습니다.

### 배포 실패: `sites/<site-id>/versions 404`

- `firebase.json`의 `hosting.site`를 확인하세요.
- 서비스 계정의 Hosting 권한을 확인하세요.

### 로컬 API CORS 오류

- 프론트에서 해결할 수 없습니다.
- API 서버에서 허용 도메인(CORS allowlist)을 설정해야 합니다.
