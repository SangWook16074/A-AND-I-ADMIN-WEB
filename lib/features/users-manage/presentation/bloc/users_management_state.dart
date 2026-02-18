import '../../domain/entities/admin_user.dart';

enum UsersManagementStatus { idle, loading, success, failure }

class UsersManagementState {
  const UsersManagementState({
    required this.status,
    required this.users,
    required this.isCreating,
    this.errorMessage,
  });

  const UsersManagementState.initial()
    : status = UsersManagementStatus.idle,
      users = const [],
      isCreating = false,
      errorMessage = null;

  final UsersManagementStatus status;
  final List<AdminUser> users;
  final bool isCreating;
  final String? errorMessage;

  UsersManagementState copyWith({
    UsersManagementStatus? status,
    List<AdminUser>? users,
    bool? isCreating,
    String? errorMessage,
    bool clearError = false,
  }) {
    return UsersManagementState(
      status: status ?? this.status,
      users: users ?? this.users,
      isCreating: isCreating ?? this.isCreating,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
