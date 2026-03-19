import 'package:a_and_i_admin_web_serivce/features/users-manage/domain/entities/admin_user.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/domain/repositories/users_management_repository.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/presentation/bloc/users_management_bloc.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/presentation/bloc/users_management_event.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/presentation/bloc/users_management_state.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeUsersManagementRepository implements UsersManagementRepository {
  final List<AdminUser> users = const [
    AdminUser(
      id: 'u-1',
      username: 'existing-admin',
      role: AuthRole.organizer,
      userTrack: 'FL',
      cohort: 3,
      nickname: '닉네임',
    ),
  ].toList();

  @override
  Future<AdminUser> getUser({required String userId}) async {
    return users.firstWhere((u) => u.id == userId);
  }

  @override
  Future<AdminUser> lookupUserByPublicCode({required String publicCode}) async {
    return users.firstWhere((u) => u.publicCode == publicCode);
  }

  @override
  Future<AdminUser> createUser({
    required AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    final created = AdminUser(
      id: 'u-2',
      username: 'new-admin',
      role: AuthRole.user,
      cohort: cohort,
    );
    users.add(created);
    return created;
  }

  @override
  Future<List<AdminUser>> getUsers() async => List<AdminUser>.from(users);

  @override
  Future<void> deleteUser({required String userId}) async {
    users.removeWhere((user) => user.id == userId);
  }

  @override
  Future<void> updateUser({
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    final index = users.indexWhere((user) => user.id == userId);
    if (index == -1) return;

    final existing = users[index];
    users[index] = AdminUser(
      id: existing.id,
      username: existing.username,
      role: role,
      nickname: nickname,
      publicCode: existing.publicCode,
      userTrack: userTrack,
      cohort: cohort,
      cohortOrder: existing.cohortOrder,
      forcePasswordChange: existing.forcePasswordChange,
      inviteLink: existing.inviteLink,
      inviteExpiresAt: existing.inviteExpiresAt,
      active: existing.active,
    );
  }

  @override
  Future<String> resetPassword({required String userId}) async {
    return 'temp-password-123';
  }

  @override
  Future<void> inviteMail({
    required List<String> emails,
    required AuthRole role,
    required int cohort,
    required int cohortOrder,
    required String userTrack,
  }) async {
    for (final email in emails) {
      users.add(
        AdminUser(
          id: 'u-${DateTime.now().millisecondsSinceEpoch}',
          username: email.split('@').first,
          role: role,
          nickname: '',
          publicCode: 'code',
          userTrack: userTrack,
          cohort: cohort,
          cohortOrder: cohortOrder,
          forcePasswordChange: false,
          active: true,
        ),
      );
    }
  }
}

void main() {
  group('UsersManagementBloc', () {
    test('invite event adds user and reloads users list', () async {
      final fakeRepo = FakeUsersManagementRepository();
      final container = ProviderContainer(
        overrides: [
          usersManagementRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(usersManagementBlocProvider.notifier);

      await notifier.onEvent(
        const UsersManagementInviteRequested(
          emails: ['test@example.com'],
          role: AuthRole.user,
          cohort: 4,
          cohortOrder: 4,
          userTrack: 'NO',
        ),
      );

      final state = container.read(usersManagementBlocProvider);
      expect(state.status, UsersManagementStatus.success);
      expect(state.users.map((e) => e.username), contains('test'));
    });

    test('delete event removes user from state', () async {
      final fakeRepo = FakeUsersManagementRepository();
      final container = ProviderContainer(
        overrides: [
          usersManagementRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(usersManagementBlocProvider.notifier);

      await notifier.onEvent(const UsersManagementStarted());
      await notifier.onEvent(
        const UsersManagementDeleteRequested(userId: 'u-1'),
      );

      final state = container.read(usersManagementBlocProvider);
      expect(state.status, UsersManagementStatus.success);
      expect(state.users.map((e) => e.id), isNot(contains('u-1')));
    });

    test('update event updates role/track/cohort in state', () async {
      final fakeRepo = FakeUsersManagementRepository();
      final container = ProviderContainer(
        overrides: [
          usersManagementRepositoryProvider.overrideWithValue(fakeRepo),
        ],
      );
      addTearDown(container.dispose);

      final notifier = container.read(usersManagementBlocProvider.notifier);

      await notifier.onEvent(const UsersManagementStarted());
      await notifier.onEvent(
        const UsersManagementUpdateRequested(
          userId: 'u-1',
          role: AuthRole.user,
          userTrack: 'SP',
          cohort: 9,
          nickname: '닉네임',
        ),
      );

      final state = container.read(usersManagementBlocProvider);
      final updated = state.users.firstWhere((e) => e.id == 'u-1');
      expect(state.status, UsersManagementStatus.success);
      expect(updated.role, AuthRole.user);
      expect(updated.userTrack, 'SP');
      expect(updated.cohort, 9);
    });
  });
}
