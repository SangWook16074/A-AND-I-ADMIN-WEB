import 'package:aandi_admin_api/aandi_admin_api.dart' as admin_api;
import 'package:aandi_auth/aandi_auth.dart';
import 'package:http/http.dart' as http;

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
    : apiClient = admin_api.AdminApiClient(baseUrl: baseUrl, client: client);

  final String baseUrl;
  final admin_api.AdminApiClient apiClient;

  Future<List<AdminUserDto>> getUsers({required String accessToken}) async {
    try {
      final users = await apiClient.getUsers(accessToken: accessToken);
      return users
          .map(
            (user) => AdminUserDto(
              id: user.id,
              username: user.username,
              role: user.role,
              forcePasswordChange: user.forcePasswordChange,
              inviteLink: user.inviteLink,
              inviteExpiresAt: user.inviteExpiresAt,
              active: user.active,
            ),
          )
          .toList();
    } on admin_api.AdminApiException catch (e) {
      throw UsersManagementApiException(
        e.message,
        statusCode: e.statusCode,
        code: e.code,
      );
    }
  }

  Future<AdminUserDto> createUser({
    required String accessToken,
    required AuthRole role,
    required admin_api.AdminUserProvisionType provisionType,
  }) async {
    try {
      final created = await apiClient.createUser(
        accessToken: accessToken,
        role: role,
        provisionType: provisionType,
      );
      return AdminUserDto(
        id: created.id,
        username: created.username,
        role: created.role,
        inviteLink: created.inviteLink,
        inviteExpiresAt: created.expiresAt,
      );
    } on admin_api.AdminApiException catch (e) {
      throw UsersManagementApiException(
        e.message,
        statusCode: e.statusCode,
        code: e.code,
      );
    }
  }
}
