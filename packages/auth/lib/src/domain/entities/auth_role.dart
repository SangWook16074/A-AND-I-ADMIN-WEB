import 'package:freezed_annotation/freezed_annotation.dart';

/// 애플리케이션 권한 모델.
///
/// 서버/클라이언트 간 문자열 값을 안전하게 매핑하기 위해 enum으로 관리한다.
enum AuthRole {
  @JsonValue('USER')
  user,
  @JsonValue('ORGANIZER')
  organizer,
  @JsonValue('ADMIN')
  admin;

  /// API 응답 문자열을 도메인 enum으로 변환한다.
  ///
  /// 알 수 없는 값은 최소 권한인 [AuthRole.user]로 처리한다.
  static AuthRole fromApi(String role) {
    return switch (role.toUpperCase()) {
      'USER' => AuthRole.user,
      'ORGANIZER' => AuthRole.organizer,
      'ADMIN' => AuthRole.admin,
      _ => AuthRole.user,
    };
  }

  /// 도메인 enum을 API 요청용 문자열로 변환한다.
  String toApi() {
    return switch (this) {
      AuthRole.user => 'USER',
      AuthRole.organizer => 'ORGANIZER',
      AuthRole.admin => 'ADMIN',
    };
  }
}
