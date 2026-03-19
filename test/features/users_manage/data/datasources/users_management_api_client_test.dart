import 'dart:convert';
import 'dart:typed_data';

import 'package:a_and_i_admin_web_serivce/features/users-manage/data/datasources/users_management_api_client.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersManagementApiClient.lookupUserByPublicCode', () {
    test('sends GET /v1/users/lookup with code query', () async {
      late RequestOptions captured;
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        dio: _createMockDio((options, body) async {
          captured = options;
          expect(body, isEmpty);
          return _jsonResponse({
            'success': true,
            'data': {
              'id': 'u-1',
              'username': 'user1',
              'role': 'USER',
              'nickname': 'tester',
              'publicCode': 'PUB-001',
            },
          }, 200);
        }),
      );

      final user = await apiClient.lookupUserByPublicCode(
        accessToken: 'access-token',
        publicCode: 'PUB-001',
      );

      expect(captured.method, 'GET');
      expect(
        captured.uri.toString(),
        'https://api.example.com/v1/users/lookup?code=PUB-001',
      );
      expect(
        _headerValue(captured.headers, 'authorization'),
        'Bearer access-token',
      );
      expect(user.id, 'u-1');
      expect(user.publicCode, 'PUB-001');
    });
  });

  group('UsersManagementApiClient.createUser', () {
    test('sends POST /v1/admin/users with expected payload', () async {
      late RequestOptions captured;
      late String capturedBody;
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        dio: _createMockDio((options, body) async {
          captured = options;
          capturedBody = body;
          return _jsonResponse({
            'success': true,
            'data': {'id': 'u-1'},
          }, 201);
        }),
      );

      final created = await apiClient.createUser(
        accessToken: 'access-token',
        provisionType: AdminUserProvisionType.invite,
        cohort: 7,
      );

      expect(captured.method, 'POST');
      expect(captured.uri.toString(), 'https://api.example.com/v1/admin/users');
      expect(
        _headerValue(captured.headers, 'authorization'),
        'Bearer access-token',
      );
      expect(
        _headerValue(captured.headers, 'content-type'),
        'application/json',
      );

      final body = jsonDecode(capturedBody) as Map<String, dynamic>;
      expect(body['role'], 'USER');
      expect(body['provisionType'], 'INVITE');
      expect(body['cohort'], 7);
      expect(created.id, 'u-1');
    });
  });

  group('UsersManagementApiClient.deleteUser', () {
    test('sends DELETE /v1/admin/users with userId in body', () async {
      late RequestOptions captured;
      late String capturedBody;
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        dio: _createMockDio((options, body) async {
          captured = options;
          capturedBody = body;
          return _jsonResponse({'success': true}, 200);
        }),
      );

      await apiClient.deleteUser(accessToken: 'access-token', userId: 'u-1');

      expect(captured.method, 'DELETE');
      expect(captured.uri.toString(), 'https://api.example.com/v1/admin/users');
      expect(
        _headerValue(captured.headers, 'authorization'),
        'Bearer access-token',
      );
      expect(
        _headerValue(captured.headers, 'content-type'),
        'application/json',
      );

      final body = jsonDecode(capturedBody) as Map<String, dynamic>;
      expect(body['userId'], 'u-1');
    });
  });

  group('UsersManagementApiClient.updateUser', () {
    test('sends PATCH /v1/admin/users with expected payload', () async {
      late RequestOptions captured;
      late String capturedBody;
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        dio: _createMockDio((options, body) async {
          captured = options;
          capturedBody = body;
          return _jsonResponse({'success': true}, 200);
        }),
      );

      await apiClient.updateUser(
        accessToken: 'access-token',
        userId: 'u-1',
        role: AuthRole.organizer,
        userTrack: 'SP',
        cohort: 9,
        nickname: 'nick',
      );

      expect(captured.method, 'PATCH');
      expect(captured.uri.toString(), 'https://api.example.com/v1/admin/users');
      expect(
        _headerValue(captured.headers, 'authorization'),
        'Bearer access-token',
      );
      expect(
        _headerValue(captured.headers, 'content-type'),
        'application/json',
      );

      final body = jsonDecode(capturedBody) as Map<String, dynamic>;
      expect(body['userId'], 'u-1');
      expect(body['role'], 'ORGANIZER');
      expect(body['userTrack'], 'SP');
      expect(body['cohort'], 9);
      expect(body['nickname'], 'nick');
    });
  });
}

Dio _createMockDio(
  Future<ResponseBody> Function(RequestOptions options, String body) handler,
) {
  final dio = Dio();
  dio.httpClientAdapter = _MockDioAdapter(handler);
  return dio;
}

ResponseBody _jsonResponse(Object? body, int statusCode) {
  return ResponseBody.fromString(
    jsonEncode(body),
    statusCode,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );
}

String? _headerValue(Map<String, dynamic> headers, String name) {
  for (final entry in headers.entries) {
    if (entry.key.toLowerCase() == name.toLowerCase()) {
      return entry.value?.toString();
    }
  }
  return null;
}

class _MockDioAdapter implements HttpClientAdapter {
  _MockDioAdapter(this._handler);

  final Future<ResponseBody> Function(RequestOptions options, String body)
  _handler;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    final bytes = <int>[];
    if (requestStream != null) {
      await for (final chunk in requestStream) {
        bytes.addAll(chunk);
      }
    }
    final body = utf8.decode(bytes, allowMalformed: true);
    return _handler(options, body);
  }
}
