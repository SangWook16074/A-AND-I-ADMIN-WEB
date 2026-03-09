# aandi_admin_api

A&I 관리자 사용자 관리 API 클라이언트 패키지입니다.  
`/v1/admin/users` 엔드포인트를 대상으로 사용자 조회/생성/수정/삭제 기능을 제공합니다.

## 개요

- 패키지명: `aandi_admin_api`
- 런타임: Dart `^3.10.4`
- 주요 의존성
  - `dio`: HTTP 통신
  - `aandi_auth`: `AuthRole` 타입 및 role 변환

공개 진입점:

```dart
import 'package:aandi_admin_api/aandi_admin_api.dart';
```

## 제공 기능

`AdminApiClient`가 아래 기능을 제공합니다.

- `getUsers`: 관리자 사용자 목록 조회
- `createUser`: 관리자 사용자 생성
- `updateUser`: 사용자 role/트랙/기수/닉네임 수정
- `deleteUser`: 사용자 삭제

`getUsers`는 현재 pagination/filter 인자 없이 전체 목록 조회만 지원합니다.

`updateUser`는 PATCH 엔드포인트를 사용하지만, 현재 클라이언트 메서드 시그니처 기준으로
`role`, `userTrack`, `cohort`, `nickname`을 모두 전달해야 합니다.
이 패키지는 현재 백엔드 계약을 기준으로 PATCH를 "전체 프로필 값 전달" 방식으로 사용합니다.
부분 업데이트가 필요하면 클라이언트 시그니처와 서버 계약을 함께 변경해야 합니다.

## 빠른 시작

```dart
import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';

final client = AdminApiClient(
  baseUrl: 'https://api.example.com', // trailing slash 없이 권장
);

// 1) 사용자 목록 조회
final List<AdminUserSummary> users = await client.getUsers(
  accessToken: accessToken,
);

// 2) 사용자 생성
final CreateAdminUserResponse created = await client.createUser(
  accessToken: accessToken,
  role: AuthRole.organizer,
  provisionType: AdminUserProvisionType.invite,
  cohort: 7,
);

// 3) 사용자 수정
await client.updateUser(
  accessToken: accessToken,
  userId: created.id,
  role: AuthRole.admin,
  userTrack: 'AI',
  cohort: 7,
  nickname: 'Aandi Admin',
);

// 4) 사용자 삭제
await client.deleteUser(
  accessToken: accessToken,
  userId: created.id,
);
```

## API 계약(응답 형식)

이 패키지는 서버 응답이 아래 공통 형태를 따른다고 가정합니다.

```json
{
  "success": true,
  "data": {},
  "error": {
    "message": "...",
    "code": "..."
  }
}
```

동작 규칙:

- HTTP 2xx + `success == true`이면 성공으로 처리
- 그 외는 `AdminApiException`으로 변환
- `deleteUser`, `updateUser`는 **2xx + 빈 응답 바디**를 성공으로 허용
- `deleteUser`, `updateUser`의 `userId`는 path parameter가 아니라 request body로 전달

## 주요 타입

### `AdminUserSummary`

사용자 목록 조회 결과 모델입니다.

주요 필드:

- `id`, `username`, `role`
- `nickname`
- `publicCode`, `userTrack`, `cohort`, `cohortOrder`
- `forcePasswordChange`, `inviteLink`, `inviteExpiresAt`, `active`

### `CreateAdminUserResponse`

사용자 생성 결과 모델입니다.

주요 필드:

- `id`, `username`, `role`
- `nickname`
- `provisionType` (`invite` 또는 `password`)
- `publicCode`, `userTrack`, `cohort`, `cohortOrder`
- `temporaryPassword` (비밀번호 발급 방식일 때)
- `inviteLink`, `expiresAt` (초대 링크 방식일 때)

### `AdminUserProvisionType`

- `invite`: 초대 링크 기반 계정 전달
- `password`: 임시 비밀번호 발급 방식

## 예외 처리

요청 실패/응답 파싱 실패는 `AdminApiException`으로 전달됩니다.

```dart
try {
  await client.getUsers(accessToken: accessToken);
} on AdminApiException catch (e) {
  // e.message: 사용자 노출 가능한 메시지
  // e.statusCode: HTTP 상태 코드 (네트워크/파싱 에러 시 null 가능)
  // e.code: 서버 도메인 에러 코드 (없으면 null)
}
```

## 테스트

패키지 루트에서:

```bash
flutter test test/admin_api_client_test.dart
```

워크스페이스 루트에서:

```bash
flutter test packages/admin_api/test/admin_api_client_test.dart
```

## 개발 메모

- `AdminApiClient` 생성자에 `Dio`를 주입할 수 있어 테스트/인터셉터 구성에 유리합니다.
- 모든 메서드가 `accessToken`을 파라미터로 직접 받으므로, 주입한 `Dio`는 인증 토큰 자동 주입보다 로깅/타임아웃/재시도 설정 용도로 사용하는 것을 권장합니다.
- 모델 파싱 시 key 변형(camelCase/snake_case)과 숫자 타입 편차(`int`/`num`/`String`)를 흡수하도록 구현되어 있습니다.
