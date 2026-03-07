import 'dart:convert';

import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';

import 'admin_api_exception.dart';
import 'admin_user_provision_type.dart';
import 'admin_user_summary.dart';
import 'create_admin_user_response.dart';

class AdminApiClient {
  AdminApiClient({required this.baseUrl, Dio? dio}) : dio = dio ?? Dio();

  final String baseUrl;
  final Dio dio;

  Future<List<AdminUserSummary>> getUsers({required String accessToken}) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await dio.getUri<dynamic>(
      uri,
      options: _requestOptions(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
        },
      ),
    );
    final statusCode = response.statusCode ?? 0;

    final decoded = _decodeResponseMap(response.data, statusCode: statusCode);
    _throwIfRequestFailed(statusCode: statusCode, decoded: decoded);

    final data = decoded['data'];
    if (data is! List) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: statusCode,
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
    final response = await dio.postUri<dynamic>(
      uri,
      data: {
        'role': role.toApi(),
        'provisionType': provisionType.toApi(),
        'cohort': cohort,
      },
      options: _requestOptions(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    final statusCode = response.statusCode ?? 0;

    final decoded = _decodeResponseMap(response.data, statusCode: statusCode);
    _throwIfRequestFailed(statusCode: statusCode, decoded: decoded);

    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: statusCode,
      );
    }

    return CreateAdminUserResponse.fromJson(data);
  }

  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  }) async {
    final uri = Uri.parse('$baseUrl/v1/admin/users');
    final response = await dio.deleteUri<dynamic>(
      uri,
      data: {'userId': userId},
      options: _requestOptions(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    final statusCode = response.statusCode ?? 0;

    final body = _responseBodyAsString(response.data).trim();
    if (body.isEmpty) {
      if (_isSuccessfulStatus(statusCode)) {
        return;
      }
      throw AdminApiException('요청에 실패했습니다.', statusCode: statusCode);
    }

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    }

    _throwIfRequestFailed(statusCode: statusCode, decoded: decoded);
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
    final response = await dio.patchUri<dynamic>(
      uri,
      data: {
        'userId': userId,
        'role': role.toApi(),
        'userTrack': userTrack,
        'cohort': cohort,
        'nickname': nickname,
      },
      options: _requestOptions(
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );
    final statusCode = response.statusCode ?? 0;

    final body = _responseBodyAsString(response.data).trim();
    if (body.isEmpty) {
      if (_isSuccessfulStatus(statusCode)) {
        return;
      }
      throw AdminApiException('요청에 실패했습니다.', statusCode: statusCode);
    }

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) {
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    }

    _throwIfRequestFailed(statusCode: statusCode, decoded: decoded);
  }

  Options _requestOptions({required Map<String, String> headers}) {
    return Options(
      headers: headers,
      responseType: ResponseType.plain,
      validateStatus: (_) => true,
    );
  }

  Map<String, dynamic> _decodeResponseMap(
    dynamic responseData, {
    required int statusCode,
  }) {
    final decoded = switch (responseData) {
      String value => jsonDecode(value),
      null => jsonDecode(''),
      _ => responseData,
    };

    if (decoded is! Map<String, dynamic>) {
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    }

    return decoded;
  }

  bool _isSuccessfulStatus(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
  }

  String _responseBodyAsString(dynamic responseData) {
    if (responseData == null) {
      return '';
    }
    if (responseData is String) {
      return responseData;
    }
    return jsonEncode(responseData);
  }

  void _throwIfRequestFailed({
    required int statusCode,
    required Map<String, dynamic> decoded,
  }) {
    final success = decoded['success'] == true;
    final error = decoded['error'];
    if (_isSuccessfulStatus(statusCode) && success) {
      return;
    }

    final message = error is Map<String, dynamic>
        ? (error['message']?.toString() ?? '요청에 실패했습니다.')
        : '요청에 실패했습니다.';
    final code = error is Map<String, dynamic>
        ? error['code']?.toString()
        : null;
    throw AdminApiException(message, statusCode: statusCode, code: code);
  }
}
