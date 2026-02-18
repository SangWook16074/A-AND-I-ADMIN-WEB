import 'package:aandi_auth/aandi_auth.dart';

import '../../domain/entities/admin_user.dart';
import '../../domain/entities/admin_user_provision_type.dart';
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
  Future<AdminUser> createUser({
    required AuthRole role,
    required AdminUserProvisionType provisionType,
  }) async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw UsersManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dto = await _apiClient.createUser(
      accessToken: accessToken,
      role: role,
      provisionType: provisionType,
    );
    return dto.toDomain();
  }
}
