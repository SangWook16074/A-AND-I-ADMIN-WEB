import 'package:aandi_admin_api/aandi_admin_api.dart' as admin_api;
import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';

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
  UsersManagementApiClient({required this.baseUrl, Dio? dio})
    : apiClient = admin_api.AdminApiClient(baseUrl: baseUrl, dio: dio);

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

  Future<AdminUserDto> getUser({
    required String accessToken,
    required String userId,
  }) async {
    try {
      final user = await apiClient.getUser(
        accessToken: accessToken,
        userId: userId,
      );
      return AdminUserDto(
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
      );
    } on admin_api.AdminApiException catch (e) {
      throw UsersManagementApiException(
        e.message,
        statusCode: e.statusCode,
        code: e.code,
      );
    }
  }

  Future<AdminUserDto> lookupUser({
    required String accessToken,
    required String code,
  }) async {
    try {
      final user = await apiClient.lookupUser(
        accessToken: accessToken,
        code: code,
      );
      return AdminUserDto(
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
      );
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
    required int cohort,
  }) async {
    try {
      final created = await apiClient.createUser(
        accessToken: accessToken,
        role: role,
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

  Future<String> resetPassword({
    required String accessToken,
    required String userId,
  }) async {
    try {
      return await apiClient.resetPassword(
        accessToken: accessToken,
        userId: userId,
      );
    } on admin_api.AdminApiException catch (e) {
      throw UsersManagementApiException(
        e.message,
        statusCode: e.statusCode,
        code: e.code,
      );
    }
  }

  Future<void> inviteMail({
    required String accessToken,
    required List<String> emails,
    required AuthRole role,
    required int cohort,
    required int cohortOrder,
    required String userTrack,
  }) async {
    try {
      await apiClient.inviteMail(
        accessToken: accessToken,
        emails: emails,
        role: role,
        cohort: cohort,
        cohortOrder: cohortOrder,
        userTrack: userTrack,
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
