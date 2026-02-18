import '../entities/admin_user.dart';
import '../repositories/users_management_repository.dart';

class GetAdminUsersUseCase {
  const GetAdminUsersUseCase(this.repository);

  final UsersManagementRepository repository;

  Future<List<AdminUser>> call() => repository.getUsers();
}
