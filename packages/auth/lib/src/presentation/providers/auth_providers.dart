import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/datasources/auth_api_client.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/storage/token_store.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/auth_usecases.dart';

part 'auth_providers.g.dart';

const _apiBaseUrlFromEnv = String.fromEnvironment(
  'API_URL',
  defaultValue: 'https://api.aandiclub.com',
);

/// 인증 API 베이스 URL provider.
///
/// 빌드 타임 `--dart-define=API_URL=...`로 오버라이드할 수 있다.
@Riverpod(keepAlive: true)
String authBaseUrl(Ref ref) => _apiBaseUrlFromEnv;

/// 토큰 저장소 provider.
///
/// 기본 구현은 인메모리 저장소이며, 앱 레벨에서 override해
/// secure storage 기반 구현으로 교체 가능하다.
@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) => InMemoryTokenStore();

/// 인증 API 클라이언트 provider.
@riverpod
AuthApiClient authApiClient(Ref ref) {
  return AuthApiClient(baseUrl: ref.watch(authBaseUrlProvider));
}

/// 인증 리포지토리 provider.
@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    apiClient: ref.watch(authApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

/// 로그인 유스케이스 provider.
@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

/// 토큰 재발급 유스케이스 provider.
@riverpod
RefreshUseCase refreshUseCase(Ref ref) {
  return RefreshUseCase(ref.watch(authRepositoryProvider));
}

/// 로그아웃 유스케이스 provider.
@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
}

/// 내 정보 조회 유스케이스 provider.
@riverpod
MeUseCase meUseCase(Ref ref) {
  return MeUseCase(ref.watch(authRepositoryProvider));
}
