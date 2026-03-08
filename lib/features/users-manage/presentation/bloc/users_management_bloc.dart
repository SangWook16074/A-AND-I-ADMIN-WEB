import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/users_management_api_client.dart';
import '../../data/repositories/users_management_repository_impl.dart';
import '../../domain/entities/admin_user.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import '../../domain/repositories/users_management_repository.dart';
import '../../domain/usecases/get_admin_users_use_case.dart';
import 'users_management_event.dart';
import 'users_management_state.dart';

part 'users_management_bloc.g.dart';

@Riverpod(keepAlive: true)
UsersManagementApiClient usersManagementApiClient(Ref ref) {
  return UsersManagementApiClient(
    baseUrl: ref.watch(authBaseUrlProvider),
    dio: Dio(),
  );
}

@Riverpod(keepAlive: true)
UsersManagementRepository usersManagementRepository(Ref ref) {
  return UsersManagementRepositoryImpl(
    apiClient: ref.watch(usersManagementApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

@Riverpod(keepAlive: true)
GetAdminUsersUseCase getAdminUsersUseCase(Ref ref) {
  return GetAdminUsersUseCase(ref.watch(usersManagementRepositoryProvider));
}

@riverpod
class UsersManagementBloc extends _$UsersManagementBloc {
  @override
  UsersManagementState build() => const UsersManagementState.initial();

  Future<void> onEvent(UsersManagementEvent event) async {
    switch (event) {
      case UsersManagementStarted():
        await loadUsers();
      case UsersManagementRefreshRequested():
        await loadUsers();
      case UsersManagementCreateRequested(:final provisionType, :final cohort):
        await createUser(provisionType: provisionType, cohort: cohort);
      case UsersManagementDeleteRequested(:final userId):
        await deleteUser(userId: userId);
      case UsersManagementUpdateRequested(
        :final userId,
        :final role,
        :final userTrack,
        :final cohort,
        :final nickname,
      ):
        await updateUser(
          userId: userId,
          role: role,
          userTrack: userTrack,
          cohort: cohort,
          nickname: nickname,
        );
    }
  }

  Future<void> loadUsers() async {
    state = state.copyWith(
      status: UsersManagementStatus.loading,
      clearError: true,
    );

    try {
      final users = await ref.read(getAdminUsersUseCaseProvider).call();
      state = state.copyWith(
        status: UsersManagementStatus.success,
        users: users,
        clearError: true,
      );
    } on UsersManagementApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        errorMessage: e.message,
      );
    } on AuthApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        errorMessage: '사용자 목록을 불러오지 못했습니다.',
      );
    }
  }

  Future<void> createUser({
    required AdminUserProvisionType provisionType,
    required int cohort,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);

    try {
      final createdUser = await ref
          .read(usersManagementRepositoryProvider)
          .createUser(provisionType: provisionType, cohort: cohort);
      final updatedUsers = [createdUser, ...state.users].fold<List<AdminUser>>(
        [],
        (acc, user) {
          final exists = acc.any((it) => it.id == user.id);
          if (!exists) {
            acc.add(user);
          }
          return acc;
        },
      );
      state = state.copyWith(
        status: UsersManagementStatus.success,
        users: updatedUsers,
        isCreating: false,
        clearError: true,
      );
    } on UsersManagementApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        isCreating: false,
        errorMessage: e.message,
      );
    } on AuthApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        isCreating: false,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        isCreating: false,
        errorMessage: '사용자 생성에 실패했습니다.',
      );
    }
  }

  Future<void> deleteUser({required String userId}) async {
    state = state.copyWith(deletingUserId: userId, clearError: true);

    try {
      await ref
          .read(usersManagementRepositoryProvider)
          .deleteUser(userId: userId);
      final updatedUsers = state.users
          .where((user) => user.id != userId)
          .toList();
      state = state.copyWith(
        status: UsersManagementStatus.success,
        users: updatedUsers,
        clearDeletingUserId: true,
        clearError: true,
      );
    } on UsersManagementApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        clearDeletingUserId: true,
        errorMessage: e.message,
      );
    } on AuthApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        clearDeletingUserId: true,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        clearDeletingUserId: true,
        errorMessage: '사용자 삭제에 실패했습니다.',
      );
    }
  }

  Future<void> updateUser({
    required String userId,
    required AuthRole role,
    required String userTrack,
    required int cohort,
    required String nickname,
  }) async {
    state = state.copyWith(updatingUserId: userId, clearError: true);

    try {
      await ref
          .read(usersManagementRepositoryProvider)
          .updateUser(
            userId: userId,
            role: role,
            userTrack: userTrack,
            cohort: cohort,
            nickname: nickname,
          );

      final updatedUsers = state.users.map((user) {
        if (user.id != userId) {
          return user;
        }
        return AdminUser(
          id: user.id,
          username: user.username,
          role: role,
          nickname: nickname,
          publicCode: user.publicCode,
          userTrack: userTrack,
          cohort: cohort,
          cohortOrder: user.cohortOrder,
          forcePasswordChange: user.forcePasswordChange,
          inviteLink: user.inviteLink,
          inviteExpiresAt: user.inviteExpiresAt,
          active: user.active,
        );
      }).toList();

      state = state.copyWith(
        status: UsersManagementStatus.success,
        users: updatedUsers,
        clearUpdatingUserId: true,
        clearError: true,
      );
    } on UsersManagementApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        clearUpdatingUserId: true,
        errorMessage: e.message,
      );
    } on AuthApiException catch (e) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        clearUpdatingUserId: true,
        errorMessage: e.message,
      );
    } catch (_) {
      state = state.copyWith(
        status: UsersManagementStatus.failure,
        clearUpdatingUserId: true,
        errorMessage: '사용자 수정에 실패했습니다.',
      );
    }
  }
}
