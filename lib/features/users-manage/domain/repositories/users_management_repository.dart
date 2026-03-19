import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';

import '../entities/admin_user.dart';

abstract interface class UsersManagementRepository {
  Future<List<AdminUser>> getUsers();
  Future<AdminUser> getUser({required String userId});
  Future<AdminUser> createUser({
    required AdminUserProvisionType provisionType,
    required int cohort,
  });
  Future<void> deleteUser({required String userId});
  Future<void> updateUser({
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  });
  Future<String> resetPassword({required String userId});
  Future<void> inviteMail({
    required List<String> emails,
    required AuthRole role,
    required int cohort,
    required int cohortOrder,
    required String userTrack,
  });
}
