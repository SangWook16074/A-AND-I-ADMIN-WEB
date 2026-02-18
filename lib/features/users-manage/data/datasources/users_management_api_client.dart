import 'dart:convert';

import 'package:aandi_auth/aandi_auth.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/admin_user_provision_type.dart';
import '../dtos/admin_user_dto.dart';

class UsersManagementApiException implements Exception {
  UsersManagementApiException(this.message, {this.statusCode, this.code});

  final String message;
  final int? statusCode;
  final String? code;

  @override
  String toString() {
    return 'UsersManagementApiException(statusCode: $statusCode, code: $code, message: $message)';
  }
}

class UsersManagementApiClient {
  UsersManagementApiClient({required this.baseUrl, http.Client? client})
    : _client = client ?? http.Client();

  final String baseUrl;
  final http.Client _client;

  Future<List<AdminUserDto>> getUsers({required String accessToken}) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await _client.get(
      uri,
      headers: {
        'Authorization': 'Bearer $accessToken',
        'Accept': 'application/json',
      },
    );

    final decoded = jsonDecode(response.body);
    if (decoded is! Map<String, dynamic>) {
      throw UsersManagementApiException(
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
      throw UsersManagementApiException(
        message,
        statusCode: response.statusCode,
        code: code,
      );
    }

    final data = decoded['data'];
    if (data is! List) {
      throw UsersManagementApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return data
        .whereType<Map<String, dynamic>>()
        .map(AdminUserDto.fromJson)
        .toList();
  }

  Future<AdminUserDto> createUser({
    required String accessToken,
    required AuthRole role,
    required AdminUserProvisionType provisionType,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await _client.post(
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
      throw UsersManagementApiException(
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
      throw UsersManagementApiException(
        message,
        statusCode: response.statusCode,
        code: code,
      );
    }

    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw UsersManagementApiException(
        'Response data is missing',
        statusCode: response.statusCode,
      );
    }

    return AdminUserDto.fromJson(data);
  }
}
