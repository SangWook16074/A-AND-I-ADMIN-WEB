import 'package:aandi_auth/aandi_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/users_management_api_client.dart';
import '../../data/repositories/users_management_repository_impl.dart';
import '../../domain/entities/admin_user.dart';
import '../../domain/entities/admin_user_provision_type.dart';
import '../../domain/repositories/users_management_repository.dart';
import '../../domain/usecases/get_admin_users_use_case.dart';
import 'users_management_event.dart';
import 'users_management_state.dart';

part 'users_management_bloc.g.dart';

@Riverpod(keepAlive: true)
UsersManagementApiClient usersManagementApiClient(Ref ref) {
  return UsersManagementApiClient(
    baseUrl: ref.watch(authBaseUrlProvider),
    client: http.Client(),
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
        await _loadUsers();
      case UsersManagementRefreshRequested():
        await _loadUsers();
      case UsersManagementCreateRequested(:final role, :final provisionType):
        await _createUser(role: role, provisionType: provisionType);
    }
  }

  Future<void> _loadUsers() async {
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

  Future<void> _createUser({
    required AuthRole role,
    required AdminUserProvisionType provisionType,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);

    try {
      final createdUser = await ref
          .read(usersManagementRepositoryProvider)
          .createUser(role: role, provisionType: provisionType);
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
}
