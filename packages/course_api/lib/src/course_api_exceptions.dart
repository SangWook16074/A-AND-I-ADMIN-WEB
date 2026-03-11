class CourseApiException implements Exception {
  CourseApiException(this.message, {this.statusCode, this.code});

  final String message;
  final int? statusCode;
  final String? code;

  @override
  String toString() {
    return 'CourseApiException: $message (statusCode: $statusCode, code: $code)';
  }
}
