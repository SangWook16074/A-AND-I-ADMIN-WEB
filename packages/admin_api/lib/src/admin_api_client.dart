import 'dart:convert';

import 'package:aandi_auth/aandi_auth.dart';
import 'package:http/http.dart' as http;

import 'admin_api_exception.dart';
import 'admin_user_provision_type.dart';
import 'admin_user_summary.dart';
import 'course_models.dart';
import 'create_admin_user_response.dart';

class AdminApiClient {
  AdminApiClient({required this.baseUrl, http.Client? client})
    : client = client ?? http.Client();

  final String baseUrl;
  final http.Client client;

  Future<List<AdminUserSummary>> getUsers({required String accessToken}) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
      },
    );

    final decoded = _handleResponse(response);
    final data = decoded['data'];
    if (data is! List) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return data
        .whereType<Map<String, dynamic>>()
        .map(AdminUserSummary.fromJson)
        .toList();
  }

  Future<CreateAdminUserResponse> createUser({
    required String accessToken,
    required AuthRole role,
    required AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'role': role.toApi(),
        'provisionType': provisionType.toApi(),
        'cohort': cohort,
      }),
    );

    final decoded = _handleResponse(response);
    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return CreateAdminUserResponse.fromJson(data);
  }

  Future<void> updateUser({
    required String accessToken,
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await client.patch(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userId': userId,
        'role': role.toApi(),
        'userTrack': userTrack,
        'cohort': cohort,
        'nickname': nickname,
      }),
    );

    _handleResponse(response);
  }

  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await client.delete(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'userId': userId}),
    );

    _handleResponse(response);
  }

  Future<List<CourseSummary>> getCourses({required String accessToken}) async {
    final uri = Uri.parse('$baseUrl/v1/admin/courses');
    final response = await client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
      },
    );

    final decoded = _handleResponse(response);
    final data = decoded['data'];
    if (data is! List) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return data
        .whereType<Map<String, dynamic>>()
        .map(CourseSummary.fromJson)
        .toList();
  }

  Future<CourseSummary> createCourse({
    required String accessToken,
    required CreateCourseRequest request,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/admin/courses');
    final response = await client.post(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(request.toJson()),
    );

    final decoded = _handleResponse(response);
    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return CourseSummary.fromJson(data);
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    final body = response.body.trim();
    if (body.isEmpty) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return {'success': true};
      }
      throw AdminApiException(
        '서버 응답이 비어 있습니다.',
        statusCode: response.statusCode,
      );
    }

    dynamic decoded;
    try {
      decoded = jsonDecode(body);
    } catch (e) {
      final bodyPreview = body.length > 50
          ? '${body.substring(0, 50)}...'
          : body;
      throw AdminApiException(
        'JSON 파싱 실패 (상태: ${response.statusCode}, 본문: $bodyPreview)',
        statusCode: response.statusCode,
      );
    }

    if (decoded is! Map<String, dynamic>) {
      throw AdminApiException('잘못된 응답 형식입니다.', statusCode: response.statusCode);
    }

    final success = decoded['success'] == true;
    if (response.statusCode < 200 || response.statusCode >= 300 || !success) {
      final error = decoded['error'];
      final message = error is Map<String, dynamic>
          ? (error['message']?.toString() ?? '요청 실패')
          : '요청 실패';
      throw AdminApiException(message, statusCode: response.statusCode);
    }

    return decoded;
  }
}
