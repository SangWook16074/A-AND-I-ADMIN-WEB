import 'package:freezed_annotation/freezed_annotation.dart';

import 'auth_tokens.dart';
import 'auth_user.dart';

part 'auth_session.freezed.dart';
part 'auth_session.g.dart';

/// 로그인 이후 클라이언트가 보유하는 인증 세션.
///
/// 사용자 정보와 토큰 묶음을 함께 다뤄 화면/비즈니스 로직에서
/// 인증 상태를 단일 객체로 취급할 수 있게 한다.
@freezed
abstract class AuthSession with _$AuthSession {
  /// [user] 현재 인증된 사용자.
  /// [tokens] 현재 유효한 토큰 세트.
  const factory AuthSession({
    required AuthUser user,
    required AuthTokens tokens,
  }) = _AuthSession;

  /// JSON 역직렬화.
  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionFromJson(json);
}
