class AdminApiException implements Exception {
  AdminApiException(this.message, {this.statusCode, this.code, this.alert});

  final String message;
  final int? statusCode;
  final String? code;
  final String? alert;

  @override
  String toString() {
    return 'AdminApiException(statusCode: $statusCode, code: $code, message: $message)';
  }
}
