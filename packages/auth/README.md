# aandi_auth

A&I 관리자 서비스의 인증 도메인/데이터 로직을 제공하는 패키지입니다.  
로그인, 토큰 재발급, 로그아웃, 내 정보 조회 기능을 제공합니다.

## 개요

- 패키지명: `aandi_auth`
- 런타임: Dart `^3.10.4`
- 주요 의존성
  - `http`: 인증 API 통신
  - `freezed_annotation`, `json_annotation`: 모델/DTO 직렬화
  - `riverpod`, `riverpod_annotation`: DI 및 상태 주입

공개 진입점:

```dart
import 'package:aandi_auth/aandi_auth.dart';
```

## 제공 기능

### 도메인 계층

- `AuthUser`, `AuthTokens`, `AuthSession`, `AuthRole`
- `AuthRepository` 인터페이스
- 유스케이스
  - `LoginUseCase`
  - `RefreshUseCase`
  - `LogoutUseCase`
  - `MeUseCase`

### 데이터 계층

- `AuthApiClient`: `/v1/auth/*`, `/v1/me` 호출
- `AuthRepositoryImpl`: DTO -> 도메인 변환 + 토큰 저장소 연동
- `TokenStore` 추상화
  - 기본 구현: `InMemoryTokenStore`

### 프레젠테이션/DI

- Riverpod provider 세트 (`auth_providers.dart`)
  - `authBaseUrlProvider`
  - `tokenStoreProvider`
  - `authApiClientProvider`
  - `authRepositoryProvider`
  - 각 유스케이스 provider

## 빠른 시작

### 1) Repository 직접 사용

```dart
import 'package:aandi_auth/aandi_auth.dart';

final repository = AuthRepositoryImpl(
  apiClient: AuthApiClient(baseUrl: 'https://api.example.com'),
  tokenStore: InMemoryTokenStore(),
);

final session = await repository.login(
  username: 'admin',
  password: 'password',
);

final me = await repository.me();
final newAccessToken = await repository.refresh();
await repository.logout();
```

### 2) Riverpod으로 사용

```dart
import 'package:aandi_auth/aandi_auth.dart';
import 'package:riverpod/riverpod.dart';

final container = ProviderContainer();

final login = container.read(loginUseCaseProvider);
final me = container.read(meUseCaseProvider);
final refresh = container.read(refreshUseCaseProvider);
final logout = container.read(logoutUseCaseProvider);

await login(username: 'admin', password: 'password');
await me();
await refresh();
await logout();
```

## API 계약(응답 형식)

이 패키지는 서버 응답이 아래 공통 envelope 형태를 따른다고 가정합니다.

```json
{
  "success": true,
  "data": {},
  "error": {
    "message": "...",
    "code": "..."
  },
  "timestamp": "2026-03-09T12:00:00Z"
}
```

동작 규칙:

- HTTP 2xx + `success == true`이면 성공으로 처리
- 그 외는 `AuthApiException`으로 변환
- `data`가 객체가 아니거나 누락되면 파싱 오류로 `AuthApiException` 발생

## 엔드포인트

- `POST /v1/auth/login`
- `POST /v1/auth/refresh`
- `POST /v1/auth/logout`
- `GET /v1/me`

요청/응답 DTO는 `auth_dtos.dart`에 정의되어 있습니다.

## 토큰 저장 전략

기본 `tokenStoreProvider`는 `InMemoryTokenStore`를 반환합니다.

- 장점: 간단하고 테스트하기 쉬움
- 제한: 앱 재시작 시 토큰 유지 불가

실서비스에서는 앱 레이어에서 `TokenStore`를 override해
secure storage 기반 구현으로 교체하는 것을 권장합니다.

## 환경 변수

`authBaseUrlProvider`는 아래 값을 사용합니다.

- `--dart-define=API_URL=...` 전달 시 해당 값
- 미전달 시 기본값: `https://api.aandiclub.com`

## 예외 처리

요청 실패/응답 파싱 실패는 `AuthApiException`으로 전달됩니다.

```dart
try {
  await repository.me();
} on AuthApiException catch (e) {
  // e.message: 사용자 노출 가능한 메시지
  // e.statusCode: HTTP 상태 코드 (파싱 실패 시에도 값이 있을 수 있음)
  // e.code: 서버 도메인 에러 코드 (없으면 null)
}
```

## 개발 메모

- `AuthRepositoryImpl.logout()`은 서버 로그아웃 실패 여부와 무관하게
  로컬 토큰을 항상 정리합니다.
- `refresh()`는 새 refresh token을 받지 않는 계약을 가정하고,
  기존 refresh token을 유지한 채 access token만 갱신합니다.
