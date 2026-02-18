import 'package:aandi_auth/aandi_auth.dart';

import '../entities/admin_user_provision_type.dart';
import '../entities/admin_user.dart';

abstract interface class UsersManagementRepository {
  Future<List<AdminUser>> getUsers();
  Future<AdminUser> createUser({
    required AuthRole role,
    required AdminUserProvisionType provisionType,
  });
}
