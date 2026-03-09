import '../../domain/entities/auth_role.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/auth_tokens.dart';
import '../../domain/entities/auth_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_api_client.dart';
import '../dtos/auth_dtos.dart';
import '../storage/token_store.dart';

/// [AuthRepository]의 기본 구현.
///
/// 역할:
/// 1. API DTO를 도메인 엔티티로 변환
/// 2. 토큰 영속화/갱신
/// 3. 인증 관련 예외를 상위 계층으로 전달
final class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthApiClient apiClient,
    required TokenStore tokenStore,
  }) : _apiClient = apiClient,
       _tokenStore = tokenStore;

  final AuthApiClient _apiClient;
  final TokenStore _tokenStore;

  @override
  Future<AuthSession> login({
    required String username,
    required String password,
  }) async {
    final response = await _apiClient.login(
      LoginRequestDto(username: username, password: password),
    );

    // 로그인 성공 시 서버 토큰을 즉시 저장해 후속 요청에서 재사용한다.
    final tokens = AuthTokens(
      accessToken: response.accessToken,
      refreshToken: response.refreshToken,
      expiresIn: response.expiresIn,
      tokenType: response.tokenType,
    );
    await _tokenStore.save(tokens);

    return AuthSession(user: response.user.toDomain(), tokens: tokens);
  }

  @override
  Future<String> refresh() async {
    final current = await _tokenStore.read();
    final refreshToken = current?.refreshToken;
    // 재발급은 refresh token이 없으면 수행할 수 없다.
    if (refreshToken == null || refreshToken.isEmpty) {
      throw AuthApiException('Refresh token is missing. Please log in again.');
    }

    final response = await _apiClient.refresh(
      RefreshRequestDto(refreshToken: refreshToken),
    );

    // refresh API가 새 refresh token을 주지 않으므로 기존 값을 유지한다.
    final nextTokens = AuthTokens(
      accessToken: response.accessToken,
      refreshToken: refreshToken,
      expiresIn: response.expiresIn,
      tokenType: current?.tokenType,
    );
    await _tokenStore.save(nextTokens);

    return nextTokens.accessToken;
  }

  @override
  Future<void> logout() async {
    final current = await _tokenStore.read();
    final refreshToken = current?.refreshToken;
    try {
      if (refreshToken != null && refreshToken.isNotEmpty) {
        await _apiClient.logout(LogoutRequestDto(refreshToken: refreshToken));
      }
    } finally {
      // 서버 로그아웃 실패 여부와 무관하게 마지막에 로컬 토큰은 항상 정리한다.
      await _tokenStore.clear();
    }
  }

  @override
  Future<AuthUser> me() async {
    final accessToken = await _requireAccessToken();
    final response = await _apiClient.me(accessToken: accessToken);
    return response.toDomain();
  }

  /// 인증이 필요한 API 호출 전에 access token 존재 여부를 보장한다.
  Future<String> _requireAccessToken() async {
    final tokens = await _tokenStore.read();
    if (tokens == null || tokens.accessToken.isEmpty) {
      throw AuthApiException('Access token is missing. Please log in again.');
    }
    return tokens.accessToken;
  }
}

extension on LoginUserDto {
  /// 로그인 응답 사용자 DTO -> 도메인 엔티티 변환.
  AuthUser toDomain() {
    return AuthUser(id: id, username: username, role: _mapRole(role));
  }
}

extension on MeResponseDto {
  /// 내 정보 응답 DTO -> 도메인 엔티티 변환.
  AuthUser toDomain() {
    return AuthUser(id: id, username: username, role: _mapRole(role));
  }
}

/// API role enum을 도메인 role enum으로 변환한다.
AuthRole _mapRole(AuthRoleDto role) {
  return switch (role) {
    AuthRoleDto.user => AuthRole.user,
    AuthRoleDto.organizer => AuthRole.organizer,
    AuthRoleDto.admin => AuthRole.admin,
  };
}
