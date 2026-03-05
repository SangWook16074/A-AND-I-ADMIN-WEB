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

@Riverpod(keepAlive: true)
String authBaseUrl(Ref ref) => _apiBaseUrlFromEnv;

@Riverpod(keepAlive: true)
TokenStore tokenStore(Ref ref) => InMemoryTokenStore();

@riverpod
AuthApiClient authApiClient(Ref ref) {
  return AuthApiClient(baseUrl: ref.watch(authBaseUrlProvider));
}

@riverpod
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    apiClient: ref.watch(authApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
RefreshUseCase refreshUseCase(Ref ref) {
  return RefreshUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
LogoutUseCase logoutUseCase(Ref ref) {
  return LogoutUseCase(ref.watch(authRepositoryProvider));
}

@riverpod
MeUseCase meUseCase(Ref ref) {
  return MeUseCase(ref.watch(authRepositoryProvider));
}
