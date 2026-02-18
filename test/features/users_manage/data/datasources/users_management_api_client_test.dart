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
        role: AuthRole.admin,
        provisionType: AdminUserProvisionType.invite,
      );

      expect(captured.method, 'POST');
      expect(captured.url.toString(), 'https://api.example.com/v1/admin/users');
      expect(captured.headers['authorization'], 'Bearer access-token');
      expect(captured.headers['content-type'], 'application/json');

      final body = jsonDecode(captured.body) as Map<String, dynamic>;
      expect(body['role'], 'ADMIN');
      expect(body['provisionType'], 'INVITE');
      expect(created.id, 'u-1');
    });
  });
}
