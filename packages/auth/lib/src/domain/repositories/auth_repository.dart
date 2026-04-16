import '../entities/auth_session.dart';
import '../entities/auth_user.dart';

/// 인증 도메인의 비즈니스 동작 계약.
///
/// UI/UseCase 계층은 구현체 세부사항(API, 저장소 등)을 몰라도 되도록
/// 이 인터페이스만 의존한다.
abstract interface class AuthRepository {
  /// 아이디/비밀번호로 로그인하고 사용자 정보 + 발급 토큰을 반환한다.
  Future<AuthSession> login({
    required String username,
    required String password,
  });

  /// 현재 저장된 refresh token으로 access token을 재발급한다.
  ///
  /// 반환값은 새 access token 문자열이다.
  Future<String> refresh();

  /// 서버 로그아웃 처리 후 로컬 인증 정보를 삭제한다.
  Future<void> logout();

  /// 현재 access token 기준으로 내 사용자 정보를 조회한다.
  Future<AuthUser> me();
}
