import 'package:aandi_auth/aandi_auth.dart';

import '../../domain/entities/admin_user.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import '../../domain/repositories/users_management_repository.dart';
import '../datasources/users_management_api_client.dart';

class UsersManagementRepositoryImpl implements UsersManagementRepository {
  UsersManagementRepositoryImpl({
    required UsersManagementApiClient apiClient,
    required TokenStore tokenStore,
  }) : _apiClient = apiClient,
       _tokenStore = tokenStore;

  final UsersManagementApiClient _apiClient;
  final TokenStore _tokenStore;

  @override
  Future<List<AdminUser>> getUsers() async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dtos = await _apiClient.getUsers(accessToken: accessToken);
    return dtos.map((dto) => dto.toDomain()).toList();
  }

  @override
  Future<AdminUser> getUser({required String userId}) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dto = await _apiClient.getUser(
      accessToken: accessToken,
      userId: userId,
    );
    return dto.toDomain();
  }

  @override
  Future<AdminUser> lookupUserByPublicCode({required String publicCode}) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dto = await _apiClient.lookupUserByPublicCode(
      accessToken: accessToken,
      publicCode: publicCode,
    );
    return dto.toDomain();
  }

  @override
  Future<AdminUser> createUser({
    required AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dto = await _apiClient.createUser(
      accessToken: accessToken,
      provisionType: provisionType,
      cohort: cohort,
    );
    return dto.toDomain();
  }

  @override
  Future<void> deleteUser({required String userId}) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    await _apiClient.deleteUser(accessToken: accessToken, userId: userId);
  }

  @override
  Future<void> updateUser({
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    await _apiClient.updateUser(
      accessToken: accessToken,
      userId: userId,
      role: role,
      userTrack: userTrack,
      cohort: cohort,
      nickname: nickname,
    );
  }

  @override
  Future<String> resetPassword({required String userId}) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    return await _apiClient.resetPassword(
      accessToken: accessToken,
      userId: userId,
    );
  }

  @override
  Future<void> inviteMail({
    required List<String> emails,
    required AuthRole role,
    required int cohort,
    required int cohortOrder,
    required String userTrack,
  }) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    await _apiClient.inviteMail(
      accessToken: accessToken,
      emails: emails,
      role: role,
      cohort: cohort,
      cohortOrder: cohortOrder,
      userTrack: userTrack,
    );
  }
}
