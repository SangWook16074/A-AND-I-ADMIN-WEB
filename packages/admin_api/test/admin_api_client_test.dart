import 'dart:convert';
import 'dart:typed_data';

import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:test/test.dart';

void main() {
  const baseUrl = 'https://api.example.com';
  const accessToken = 'test-token';

  group('AdminApiClient.getUsers', () {
    test('sends GET request and parses users on success', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (options, _) async {
          expect(options.method, 'GET');
          expect(options.uri, Uri.parse('$baseUrl/v1/admin/users'));
          expect(
            _headerValue(options.headers, 'authorization'),
            'Bearer $accessToken',
          );
          expect(_headerValue(options.headers, 'accept'), 'application/json');

          return _jsonResponse({
            'success': true,
            'data': [
              {
                'id': 'user-1',
                'username': 'alice',
                'role': 'ADMIN',
                'nickname': 'Alice',
                'publicCode': 'P001',
                'userTrack': 'BE',
                'cohort': 3,
                'cohortOrder': 2,
                'forcePasswordChange': true,
                'inviteLink': 'https://invite.example.com/token',
                'inviteExpiresAt': '2026-03-07T10:00:00Z',
                'active': true,
              },
            ],
          }, 200);
        },
      );

      final users = await client.getUsers(accessToken: accessToken);

      expect(users, hasLength(1));
      final user = users.single;
      expect(user.id, 'user-1');
      expect(user.username, 'alice');
      expect(user.role, AuthRole.admin);
      expect(user.nickname, 'Alice');
      expect(user.publicCode, 'P001');
      expect(user.userTrack, 'BE');
      expect(user.cohort, 3);
      expect(user.cohortOrder, 2);
      expect(user.forcePasswordChange, isTrue);
      expect(user.inviteLink, 'https://invite.example.com/token');
      expect(user.inviteExpiresAt, '2026-03-07T10:00:00Z');
      expect(user.active, isTrue);
    });

    test('throws AdminApiException with API error payload', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (_, __) async {
          return _jsonResponse({
            'success': false,
            'error': {'message': '권한이 없습니다.', 'code': 'FORBIDDEN'},
          }, 403);
        },
      );

      await expectLater(
        client.getUsers(accessToken: accessToken),
        throwsA(
          _isAdminApiException(
            message: '권한이 없습니다.',
            statusCode: 403,
            code: 'FORBIDDEN',
          ),
        ),
      );
    });

    test('throws when success response has non-list data', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (_, __) async {
          return _jsonResponse({
            'success': true,
            'data': {'id': 'user-1'},
          }, 200);
        },
      );

      await expectLater(
        client.getUsers(accessToken: accessToken),
        throwsA(
          _isAdminApiException(
            message: 'Response data is missing',
            statusCode: 200,
          ),
        ),
      );
    });
  });

  group('AdminApiClient.createUser', () {
    test('sends POST request and parses created user on success', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (options, requestBody) async {
          expect(options.method, 'POST');
          expect(options.uri, Uri.parse('$baseUrl/v1/admin/users'));
          expect(
            _headerValue(options.headers, 'authorization'),
            'Bearer $accessToken',
          );
          expect(_headerValue(options.headers, 'accept'), 'application/json');
          expect(
            _headerValue(options.headers, 'content-type'),
            'application/json',
          );
          expect(jsonDecode(requestBody), {
            'role': 'ORGANIZER',
            'provisionType': 'PASSWORD',
            'cohort': 5,
          });

          return _jsonResponse({
            'success': true,
            'data': {
              'id': 'new-user',
              'username': 'newbie',
              'role': 'ORGANIZER',
              'provisionType': 'PASSWORD',
              'nickname': 'Newbie',
              'publicCode': 'NP-1',
              'userTrack': 'FE',
              'cohort': 5,
              'cohortOrder': 1,
              'temporaryPassword': 'temp-password',
            },
          }, 201);
        },
      );

      final result = await client.createUser(
        accessToken: accessToken,
        role: AuthRole.organizer,
        provisionType: AdminUserProvisionType.password,
        cohort: 5,
      );

      expect(result.id, 'new-user');
      expect(result.username, 'newbie');
      expect(result.role, AuthRole.organizer);
      expect(result.provisionType, AdminUserProvisionType.password);
      expect(result.nickname, 'Newbie');
      expect(result.publicCode, 'NP-1');
      expect(result.userTrack, 'FE');
      expect(result.cohort, 5);
      expect(result.cohortOrder, 1);
      expect(result.temporaryPassword, 'temp-password');
    });

    test('throws AdminApiException with API error payload', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (_, __) async {
          return _jsonResponse({
            'success': false,
            'error': {'message': '이미 존재하는 사용자입니다.', 'code': 'DUPLICATE'},
          }, 409);
        },
      );

      await expectLater(
        client.createUser(
          accessToken: accessToken,
          role: AuthRole.user,
          provisionType: AdminUserProvisionType.invite,
          cohort: 1,
        ),
        throwsA(
          _isAdminApiException(
            message: '이미 존재하는 사용자입니다.',
            statusCode: 409,
            code: 'DUPLICATE',
          ),
        ),
      );
    });
  });

  group('AdminApiClient.deleteUser', () {
    test('returns normally on empty-body 2xx response', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (options, requestBody) async {
          expect(options.method, 'DELETE');
          expect(options.uri, Uri.parse('$baseUrl/v1/admin/users'));
          expect(
            _headerValue(options.headers, 'content-type'),
            'application/json',
          );
          expect(jsonDecode(requestBody), {'userId': 'user-1'});
          return ResponseBody.fromString('', 204);
        },
      );

      await client.deleteUser(accessToken: accessToken, userId: 'user-1');
    });

    test('throws generic error on empty-body non-2xx response', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (_, __) async => ResponseBody.fromString('  ', 500),
      );

      await expectLater(
        client.deleteUser(accessToken: accessToken, userId: 'user-1'),
        throwsA(_isAdminApiException(message: '요청에 실패했습니다.', statusCode: 500)),
      );
    });

    test('throws AdminApiException with API error payload', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (_, __) async {
          return _jsonResponse({
            'success': false,
            'error': {'message': '삭제할 수 없습니다.', 'code': 'CANNOT_DELETE'},
          }, 400);
        },
      );

      await expectLater(
        client.deleteUser(accessToken: accessToken, userId: 'user-1'),
        throwsA(
          _isAdminApiException(
            message: '삭제할 수 없습니다.',
            statusCode: 400,
            code: 'CANNOT_DELETE',
          ),
        ),
      );
    });
  });

  group('AdminApiClient.updateUser', () {
    test(
      'sends PATCH request and returns normally on empty-body 2xx response',
      () async {
        final client = _createClient(
          baseUrl: baseUrl,
          handler: (options, requestBody) async {
            expect(options.method, 'PATCH');
            expect(options.uri, Uri.parse('$baseUrl/v1/admin/users'));
            expect(jsonDecode(requestBody), {
              'userId': 'user-2',
              'role': 'ADMIN',
              'userTrack': 'AI',
              'cohort': 7,
              'nickname': 'Renamed',
            });
            return ResponseBody.fromString('', 200);
          },
        );

        await client.updateUser(
          accessToken: accessToken,
          userId: 'user-2',
          role: AuthRole.admin,
          userTrack: 'AI',
          cohort: 7,
          nickname: 'Renamed',
        );
      },
    );

    test('throws AdminApiException with API error payload', () async {
      final client = _createClient(
        baseUrl: baseUrl,
        handler: (_, __) async {
          return _jsonResponse({
            'success': false,
            'error': {'message': '수정 권한이 없습니다.', 'code': 'NO_PERMISSION'},
          }, 403);
        },
      );

      await expectLater(
        client.updateUser(
          accessToken: accessToken,
          userId: 'user-2',
          role: AuthRole.admin,
          userTrack: 'AI',
          cohort: 7,
          nickname: 'Renamed',
        ),
        throwsA(
          _isAdminApiException(
            message: '수정 권한이 없습니다.',
            statusCode: 403,
            code: 'NO_PERMISSION',
          ),
        ),
      );
    });
  });
}

AdminApiClient _createClient({
  required String baseUrl,
  required Future<ResponseBody> Function(RequestOptions options, String body)
  handler,
}) {
  final dio = Dio();
  dio.httpClientAdapter = _MockDioAdapter(handler);
  return AdminApiClient(baseUrl: baseUrl, dio: dio);
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

Matcher _isAdminApiException({String? message, int? statusCode, String? code}) {
  return predicate<AdminApiException>((exception) {
    if (message != null && exception.message != message) {
      return false;
    }
    if (statusCode != null && exception.statusCode != statusCode) {
      return false;
    }
    if (code != null && exception.code != code) {
      return false;
    }
    return true;
  }, 'AdminApiException($message, $statusCode, $code)');
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
