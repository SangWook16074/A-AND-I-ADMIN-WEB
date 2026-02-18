import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';

import '../entities/admin_user.dart';

abstract interface class UsersManagementRepository {
  Future<List<AdminUser>> getUsers();
  Future<AdminUser> createUser({
    required AuthRole role,
    required AdminUserProvisionType provisionType,
  });
}
