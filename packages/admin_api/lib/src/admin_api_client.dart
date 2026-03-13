import 'dart:convert';

import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';

import 'admin_api_exception.dart';
import 'admin_user_provision_type.dart';
import 'admin_user_summary.dart';
import 'create_admin_user_response.dart';

class AdminApiClient {
  AdminApiClient({required this.baseUrl, Dio? dio}) : dio = dio ?? Dio();

  static const _usersPath = '/v1/admin/users';

  final String baseUrl;
  final Dio dio;

  Future<List<AdminUserSummary>> getUsers({required String accessToken}) async {
    final response = await _requestJson(
      method: 'GET',
      accessToken: accessToken,
    );

    return _readListData(
      response.body,
      statusCode: response.statusCode,
    ).whereType<Map<String, dynamic>>().map(AdminUserSummary.fromJson).toList();
  }

  Future<CreateAdminUserResponse> createUser({
    required String accessToken,
    required AuthRole role,
    required AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    final response = await _requestJson(
      method: 'POST',
      accessToken: accessToken,
      data: {
        'role': role.toApi(),
        'provisionType': provisionType.toApi(),
        'cohort': cohort,
      },
    );

    return CreateAdminUserResponse.fromJson(
      _readMapData(response.body, statusCode: response.statusCode),
    );
  }

  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  }) async {
    await _requestJson(
      method: 'DELETE',
      accessToken: accessToken,
      data: {'userId': userId},
      allowEmptySuccessBody: true,
    );
  }

  Future<String> resetPassword({
    required String accessToken,
    required String userId,
  }) async {
    final response = await _requestJson(
      method: 'POST',
      accessToken: accessToken,
      pathSuffix: '/$userId/reset-password',
      data: const <String, dynamic>{},
    );
    final data = _readMapData(response.body, statusCode: response.statusCode);
    if (data['temporaryPassword'] is! String) {
      throw AdminApiException(
        'Missing temporaryPassword in response',
        statusCode: response.statusCode,
      );
    }
    return data['temporaryPassword'] as String;
  }

  Future<void> updateUser({
    required String accessToken,
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    await _requestJson(
      method: 'PATCH',
      accessToken: accessToken,
      data: {
        'userId': userId,
        'role': role.toApi(),
        'userTrack': userTrack,
        'cohort': cohort,
        'nickname': nickname,
      },
      allowEmptySuccessBody: true,
    );
  }

  Future<void> inviteMail({
    required String accessToken,
    required List<String> emails,
    required AuthRole role,
    required int cohort,
    required int cohortOrder,
    required String userTrack,
  }) async {
    await _requestJson(
      method: 'POST',
      accessToken: accessToken,
      path: '/v1/admin/invite-mail',
      data: {
        'emails': emails,
        'role': role.toApi(),
        'cohort': cohort,
        'cohortOrder': cohortOrder,
        'userTrack': userTrack,
      },
    );
  }

  Future<({int statusCode, Map<String, dynamic> body})> _requestJson({
    required String method,
    required String accessToken,
    Object? data,
    bool allowEmptySuccessBody = false,
    String? path,
    String pathSuffix = '',
  }) async {
    final response = await dio.requestUri<dynamic>(
      Uri.parse('$baseUrl${path ?? _usersPath}$pathSuffix'),
      data: data,
      options: Options(
        method: method,
        headers: _headers(
          accessToken: accessToken,
          includeContentType: data != null,
        ),
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

  Map<String, String> _headers({
    required String accessToken,
    required bool includeContentType,
  }) {
    return {
      'Authorization': 'Bearer $accessToken',
      'Accept': 'application/json',
      if (includeContentType) 'Content-Type': 'application/json',
    };
  }

  List _readListData(Map<String, dynamic> decoded, {required int statusCode}) {
    final data = decoded['data'];
    if (data is! List) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: statusCode,
      );
    }
    return data;
  }

  Map<String, dynamic> _readMapData(
    Map<String, dynamic> decoded, {
    required int statusCode,
  }) {
    final data = decoded['data'];
    if (data is! Map<String, dynamic>) {
      throw AdminApiException(
        'Response data is missing',
        statusCode: statusCode,
      );
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
      throw AdminApiException('요청에 실패했습니다.', statusCode: statusCode);
    }

    final decoded = switch (responseData) {
      Map<String, dynamic> value => value,
      Map value => value.map((key, value) => MapEntry(key.toString(), value)),
      String value => _decodeJsonString(value, statusCode: statusCode),
      _ => throw AdminApiException(
        'Invalid response shape',
        statusCode: statusCode,
      ),
    };

    return decoded;
  }

  Map<String, dynamic> _decodeJsonString(
    String value, {
    required int statusCode,
  }) {
    try {
      final decoded = jsonDecode(value);
      if (decoded is Map<String, dynamic>) {
        return decoded;
      }
      if (decoded is Map) {
        return decoded.map((key, value) => MapEntry(key.toString(), value));
      }
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    } on FormatException {
      throw AdminApiException('Invalid response shape', statusCode: statusCode);
    }
  }

  bool _isEmptyBody(dynamic responseData) {
    return responseData == null ||
        (responseData is String && responseData.trim().isEmpty);
  }

  bool _isSuccessfulStatus(int statusCode) {
    return statusCode >= 200 && statusCode < 300;
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
