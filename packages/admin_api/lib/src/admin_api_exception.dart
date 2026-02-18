class AdminApiException implements Exception {
  AdminApiException(this.message, {this.statusCode, this.code});

  final String message;
  final int? statusCode;
  final String? code;

  @override
  String toString() {
    return 'AdminApiException(statusCode: $statusCode, code: $code, message: $message)';
  }
}
