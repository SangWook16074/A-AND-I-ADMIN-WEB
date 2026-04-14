class OjApiException implements Exception {
  OjApiException(this.message, {this.statusCode, this.code, this.alert});

  final String message;
  final int? statusCode;
  final String? code;
  final String? alert;

  @override
  String toString() {
    return 'OjApiException: $message (statusCode: $statusCode, code: $code)';
  }
}
