class OjApiException implements Exception {
  OjApiException(this.message, {this.statusCode, this.code});

  final String message;
  final int? statusCode;
  final String? code;

  @override
  String toString() {
    return 'OjApiException: $message (statusCode: $statusCode, code: $code)';
  }
}
