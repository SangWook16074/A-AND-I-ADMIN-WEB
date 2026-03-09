import '../entities/auth_session.dart';
import '../entities/auth_user.dart';
import '../repositories/auth_repository.dart';

/// 로그인 유스케이스.
///
/// 프레젠테이션 계층에서 호출하는 단일 진입점 역할을 하며,
/// 실제 동작은 [AuthRepository]에 위임한다.
final class LoginUseCase {
  const LoginUseCase(this._repository);

  final AuthRepository _repository;

  /// 사용자 자격 증명을 사용해 세션을 생성한다.
  Future<AuthSession> call({
    required String username,
    required String password,
  }) {
    return _repository.login(username: username, password: password);
  }
}

/// access token 재발급 유스케이스.
final class RefreshUseCase {
  const RefreshUseCase(this._repository);

  final AuthRepository _repository;

  /// 저장된 refresh token으로 새 access token을 요청한다.
  Future<String> call() => _repository.refresh();
}

/// 로그아웃 유스케이스.
final class LogoutUseCase {
  const LogoutUseCase(this._repository);

  final AuthRepository _repository;

  /// 서버 로그아웃 후 로컬 토큰도 정리한다.
  Future<void> call() => _repository.logout();
}

/// 현재 로그인 사용자 조회 유스케이스.
final class MeUseCase {
  const MeUseCase(this._repository);

  final AuthRepository _repository;

  /// 토큰 기반으로 내 사용자 프로필을 가져온다.
  Future<AuthUser> call() => _repository.me();
}
