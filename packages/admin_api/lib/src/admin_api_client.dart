import 'dart:convert';

import 'package:aandi_auth/aandi_auth.dart';
import 'package:http/http.dart' as http;

import 'admin_api_exception.dart';
import 'admin_user_provision_type.dart';
import 'admin_user_summary.dart';
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

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw AdminApiException(
        'Invalid response shape',
        statusCode: response.statusCode,
      );
    }

    final success = decoded['success'] == true;
    final error = decoded['error'];
    if (response.statusCode < 200 || response.statusCode >= 300 || !success) {
      final message = error is Map<String, dynamic>
          ? (error['message']?.toString() ?? '요청에 실패했습니다.')
          : '요청에 실패했습니다.';
      final code = error is Map<String, dynamic>
          ? error['code']?.toString()
          : null;
      throw AdminApiException(
        message,
        statusCode: response.statusCode,
        code: code,
      );
    }

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
      }),
    );

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw AdminApiException(
        'Invalid response shape',
        statusCode: response.statusCode,
      );
    }

    final success = decoded['success'] == true;
    final error = decoded['error'];
    if (response.statusCode < 200 || response.statusCode >= 300 || !success) {
      final message = error is Map<String, dynamic>
          ? (error['message']?.toString() ?? '요청에 실패했습니다.')
          : '요청에 실패했습니다.';
      final code = error is Map<String, dynamic>
          ? error['code']?.toString()
          : null;
      throw AdminApiException(
        message,
        statusCode: response.statusCode,
        code: code,
      );
    }

    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return CreateAdminUserResponse.fromJson(data);
  }
}
