import '../../domain/entities/auth_tokens.dart';

/// 토큰 저장소 추상화.
///
/// 플랫폼별 구현(메모리/secure storage 등)을 바꿔도
/// 상위 계층 코드가 영향받지 않도록 인터페이스로 분리한다.
abstract interface class TokenStore {
  /// 토큰을 저장/갱신한다.
  Future<void> save(AuthTokens tokens);

  /// 현재 저장된 토큰을 읽는다.
  Future<AuthTokens?> read();

  /// 저장된 토큰을 모두 삭제한다.
  Future<void> clear();
}

/// 테스트/개발용 인메모리 토큰 저장소 구현.
///
/// 앱 재시작 시 데이터가 유지되지 않는다.
final class InMemoryTokenStore implements TokenStore {
  AuthTokens? _tokens;

  @override
  Future<void> save(AuthTokens tokens) async {
    _tokens = tokens;
  }

  @override
  Future<AuthTokens?> read() async => _tokens;

  @override
  Future<void> clear() async {
    _tokens = null;
  }
}
