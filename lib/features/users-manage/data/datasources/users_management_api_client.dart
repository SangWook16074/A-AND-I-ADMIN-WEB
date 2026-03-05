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
              nickname: user.nickname,
              publicCode: user.publicCode,
              userTrack: user.userTrack,
              cohort: user.cohort,
              cohortOrder: user.cohortOrder,
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
    required admin_api.AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    try {
      final created = await apiClient.createUser(
        accessToken: accessToken,
        role: AuthRole.user,
        provisionType: provisionType,
        cohort: cohort,
      );
      return AdminUserDto(
        id: created.id,
        username: created.username,
        role: created.role,
        nickname: created.nickname,
        publicCode: created.publicCode,
        userTrack: created.userTrack,
        cohort: created.cohort,
        cohortOrder: created.cohortOrder,
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

  Future<void> deleteUser({
    required String accessToken,
    required String userId,
  }) async {
    try {
      await apiClient.deleteUser(accessToken: accessToken, userId: userId);
    } on admin_api.AdminApiException catch (e) {
      throw UsersManagementApiException(
        e.message,
        statusCode: e.statusCode,
        code: e.code,
      );
    }
  }

  Future<void> updateUser({
    required String accessToken,
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    try {
      await apiClient.updateUser(
        accessToken: accessToken,
        userId: userId,
        role: role,
        userTrack: userTrack,
        cohort: cohort,
        nickname: nickname,
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
