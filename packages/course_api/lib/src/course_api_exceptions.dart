class CourseApiException implements Exception {
  CourseApiException(this.message, {this.statusCode, this.code, this.alert});

  final String message;
  final int? statusCode;
  final String? code;
  final String? alert;

  @override
  String toString() {
    return 'CourseApiException: $message (statusCode: $statusCode, code: $code)';
  }
}
