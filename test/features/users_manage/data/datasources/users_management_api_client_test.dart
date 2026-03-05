import 'dart:convert';

import 'package:a_and_i_admin_web_serivce/features/users-manage/data/datasources/users_management_api_client.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  group('UsersManagementApiClient.createUser', () {
    test('sends POST /v1/admin/users with expected payload', () async {
      late http.Request captured;
      final client = MockClient((request) async {
        captured = request;
        return http.Response(
          jsonEncode({
            'success': true,
            'data': {'id': 'u-1'},
          }),
          201,
          headers: {'content-type': 'application/json'},
        );
      });
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        client: client,
      );

      final created = await apiClient.createUser(
        accessToken: 'access-token',
        provisionType: AdminUserProvisionType.invite,
        cohort: 7,
      );

      expect(captured.method, 'POST');
      expect(captured.url.toString(), 'https://api.example.com/v1/admin/users');
      expect(captured.headers['authorization'], 'Bearer access-token');
      expect(captured.headers['content-type'], 'application/json');

      final body = jsonDecode(captured.body) as Map<String, dynamic>;
      expect(body['role'], 'USER');
      expect(body['provisionType'], 'INVITE');
      expect(body['cohort'], 7);
      expect(created.id, 'u-1');
    });
  });

  group('UsersManagementApiClient.deleteUser', () {
    test('sends DELETE /v1/admin/users with userId in body', () async {
      late http.Request captured;
      final client = MockClient((request) async {
        captured = request;
        return http.Response(
          jsonEncode({'success': true}),
          200,
          headers: {'content-type': 'application/json'},
        );
      });
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        client: client,
      );

      await apiClient.deleteUser(accessToken: 'access-token', userId: 'u-1');

      expect(captured.method, 'DELETE');
      expect(captured.url.toString(), 'https://api.example.com/v1/admin/users');
      expect(captured.headers['authorization'], 'Bearer access-token');
      expect(captured.headers['content-type'], 'application/json');

      final body = jsonDecode(captured.body) as Map<String, dynamic>;
      expect(body['userId'], 'u-1');
    });
  });

  group('UsersManagementApiClient.updateUser', () {
    test('sends PATCH /v1/admin/users with expected payload', () async {
      late http.Request captured;
      final client = MockClient((request) async {
        captured = request;
        return http.Response(
          jsonEncode({'success': true}),
          200,
          headers: {'content-type': 'application/json'},
        );
      });
      final apiClient = UsersManagementApiClient(
        baseUrl: 'https://api.example.com',
        client: client,
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
      expect(captured.url.toString(), 'https://api.example.com/v1/admin/users');
      expect(captured.headers['authorization'], 'Bearer access-token');
      expect(captured.headers['content-type'], 'application/json');

      final body = jsonDecode(captured.body) as Map<String, dynamic>;
      expect(body['userId'], 'u-1');
      expect(body['role'], 'ORGANIZER');
      expect(body['userTrack'], 'SP');
      expect(body['cohort'], 9);
      expect(body['nickname'], 'nick');
    });
  });
}
