import '../../domain/entities/admin_user.dart';

enum UsersManagementStatus { idle, loading, success, failure }

class UsersManagementState {
  const UsersManagementState({
    required this.status,
    required this.users,
    required this.isCreating,
    required this.deletingUserId,
    required this.updatingUserId,
    this.errorMessage,
  });

  const UsersManagementState.initial()
    : status = UsersManagementStatus.idle,
      users = const [],
      isCreating = false,
      deletingUserId = null,
      updatingUserId = null,
      errorMessage = null;

  final UsersManagementStatus status;
  final List<AdminUser> users;
  final bool isCreating;
  final String? deletingUserId;
  final String? updatingUserId;
  final String? errorMessage;

  UsersManagementState copyWith({
    UsersManagementStatus? status,
    List<AdminUser>? users,
    bool? isCreating,
    String? deletingUserId,
    bool clearDeletingUserId = false,
    String? updatingUserId,
    bool clearUpdatingUserId = false,
    String? errorMessage,
    bool clearError = false,
  }) {
    return UsersManagementState(
      status: status ?? this.status,
      users: users ?? this.users,
      isCreating: isCreating ?? this.isCreating,
      deletingUserId: clearDeletingUserId
          ? null
          : (deletingUserId ?? this.deletingUserId),
      updatingUserId: clearUpdatingUserId
          ? null
          : (updatingUserId ?? this.updatingUserId),
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
