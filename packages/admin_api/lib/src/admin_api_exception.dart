/// `admin_api` 패키지에서 공통으로 사용하는 예외 타입입니다.
///
/// 서버 에러 응답과 클라이언트 파싱 실패를 동일한 타입으로 전달해
/// 상위 레이어(UI/UseCase)에서 한 번에 처리할 수 있도록 합니다.
class AdminApiException implements Exception {
  AdminApiException(this.message, {this.statusCode, this.code, this.alert});

  /// 사용자에게 보여줄 수 있는 에러 메시지입니다.
  final String message;

  /// HTTP 상태 코드입니다. 네트워크/파싱 단계에서 실패하면 `null`일 수 있습니다.
  final int? statusCode;

  /// 서버가 내려준 도메인 에러 코드입니다.
  final String? code;
  final String? alert;

  @override
  String toString() {
    return 'AdminApiException(statusCode: $statusCode, code: $code, message: $message)';
  }
}
