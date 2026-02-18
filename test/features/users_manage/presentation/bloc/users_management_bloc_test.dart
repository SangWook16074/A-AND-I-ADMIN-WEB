import 'package:a_and_i_admin_web_serivce/features/users-manage/domain/entities/admin_user.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/domain/entities/admin_user_provision_type.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/domain/repositories/users_management_repository.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/presentation/bloc/users_management_bloc.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/presentation/bloc/users_management_event.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/presentation/bloc/users_management_state.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _FakeUsersManagementRepository implements UsersManagementRepository {
  final List<AdminUser> _users = const [
    AdminUser(id: 'u-1', username: 'existing-admin', role: AuthRole.admin),
  ].toList();

  @override
  Future<AdminUser> createUser({
    required AuthRole role,
    required AdminUserProvisionType provisionType,
  }) async {
    final created = AdminUser(id: 'u-2', username: 'new-admin', role: role);
    _users.add(created);
    return created;
  }

  @override
  Future<List<AdminUser>> getUsers() async => List<AdminUser>.from(_users);
}

void main() {
  group('UsersManagementBloc', () {
    test('create event adds user and reloads users list', () async {
      final fakeRepo = _FakeUsersManagementRepository();
      final container = ProviderContainer(
        overrides: [
          usersManagementRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(usersManagementBlocProvider.notifier);

      await notifier.onEvent(
        const UsersManagementCreateRequested(
          role: AuthRole.admin,
          provisionType: AdminUserProvisionType.invite,
        ),
      );

      final state = container.read(usersManagementBlocProvider);
      expect(state.status, UsersManagementStatus.success);
      expect(state.users.map((e) => e.username), contains('new-admin'));
    });
  });
}
