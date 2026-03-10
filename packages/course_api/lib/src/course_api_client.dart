import 'dart:convert';
import 'package:dio/dio.dart';
import 'course_models.dart';

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

class CourseApiClient {
  CourseApiClient({required this.baseUrl, Dio? dio}) : dio = dio ?? Dio();

  static const _coursesPath = '/v1/admin/courses';

  final String baseUrl;
  final Dio dio;

  Future<List<CourseSummary>> getCourses({required String accessToken}) async {
    final response = await _requestJson(
      method: 'GET',
      accessToken: accessToken,
    );

    final listData = _readListData(response.body, statusCode: response.statusCode);
    return listData.whereType<Map<String, dynamic>>().map(_mapCourseJson).map(CourseSummary.fromJson).toList();
  }

  Future<CourseSummary> createCourse({
    required String accessToken,
    required CreateCourseRequest request,
  }) async {
    final response = await _requestJson(
      method: 'POST',
      accessToken: accessToken,
      data: {
        'slug': request.slug,
        'fieldTag': request.targetTrack, // Mapping targetTrack to fieldTag
        'metadata': {
          'title': request.title,
          'description': request.description,
          'phase': request.phase,
        }
      },
    );

    final mapData = _readMapData(response.body, statusCode: response.statusCode);
    return CourseSummary.fromJson(_mapCourseJson(mapData));
  }

  Map<String, dynamic> _mapCourseJson(Map<String, dynamic> json) {
    return {
      'id': json['id'],
      'slug': json['slug'],
      'targetTrack': json['fieldTag'],
      'status': json['status'],
      'createdAt': json['createdAt'],
      'updatedAt': json['updatedAt'],
      'title': json['metadata']?['title'],
      'description': json['metadata']?['description'],
      'phase': json['metadata']?['phase'],
    };
  }

  Future<({int statusCode, Map<String, dynamic> body})> _requestJson({
    required String method,
    required String accessToken,
    Object? data,
    bool allowEmptySuccessBody = false,
  }) async {
    final response = await dio.requestUri<dynamic>(
      Uri.parse('$baseUrl$_coursesPath'),
      data: data,
      options: Options(
        method: method,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
          if (data != null) 'Content-Type': 'application/json',
        },
        responseType: ResponseType.plain,
        validateStatus: (_) => true,
      ),
    );

    final statusCode = response.statusCode ?? 0;
    final decoded = _decodeResponseMap(
      response.data,
      statusCode: statusCode,
      allowEmptySuccessBody: allowEmptySuccessBody,
    );
    if (decoded == null) {
      return (statusCode: statusCode, body: const <String, dynamic>{});
    }

    _throwIfRequestFailed(statusCode: statusCode, decoded: decoded);
    return (statusCode: statusCode, body: decoded);
  }

  List _readListData(Map<String, dynamic> decoded, {required int statusCode}) {
    final data = decoded['data'];
    if (data is! List) {
      throw CourseApiException('Response data is missing', statusCode: statusCode);
    }
    return data;
  }

  Map<String, dynamic> _readMapData(Map<String, dynamic> decoded, {required int statusCode}) {
    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw CourseApiException('Response data is missing', statusCode: statusCode);
    }
    return data;
  }

  Map<String, dynamic>? _decodeResponseMap(
    dynamic responseData, {
    required int statusCode,
    required bool allowEmptySuccessBody,
  }) {
    if (_isEmptyBody(responseData)) {
      if (allowEmptySuccessBody && _isSuccessfulStatus(statusCode)) {
        return null;
      }
      throw CourseApiException('요청에 실패했습니다.', statusCode: statusCode);
    }

    final decoded = switch (responseData) {
      Map<String, dynamic> value => value,
      Map value => value.map((key, value) => MapEntry(key.toString(), value)),
      String value => _decodeJsonString(value, statusCode: statusCode),
      _ => throw CourseApiException('Invalid response shape', statusCode: statusCode),
    };

    return decoded;
  }

  Map<String, dynamic> _decodeJsonString(String value, {required int statusCode}) {
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) return decoded;
      if (decoded is Map) return decoded.map((key, value) => MapEntry(key.toString(), value));
      throw CourseApiException('Invalid response shape', statusCode: statusCode);
    } on FormatException {
      throw CourseApiException('Invalid response shape', statusCode: statusCode);
    }
  }

  bool _isEmptyBody(dynamic responseData) {
    return responseData == null || (responseData is String && responseData.trim().isEmpty);
  }

  bool _isSuccessfulStatus(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  void _throwIfRequestFailed({required int statusCode, required Map<String, dynamic> decoded}) {
    final success = decoded['success'] == true;
    final error = decoded['error'];
    if (_isSuccessfulStatus(statusCode) && success) return;

    final message = error is Map<String, dynamic> ? (error['message']?.toString() ?? '요청에 실패했습니다.') : '요청에 실패했습니다.';
    final code = error is Map<String, dynamic> ? error['code']?.toString() : null;
    throw CourseApiException(message, statusCode: statusCode, code: code);
  }
}
