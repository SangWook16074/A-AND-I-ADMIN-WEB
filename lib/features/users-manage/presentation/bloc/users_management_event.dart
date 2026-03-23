import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';

// No need to import aandi_admin_api
sealed class UsersManagementEvent {
  const UsersManagementEvent();
}

class UsersManagementStarted extends UsersManagementEvent {
  const UsersManagementStarted();
}

class UsersManagementRefreshRequested extends UsersManagementEvent {
  const UsersManagementRefreshRequested();
}

class UsersManagementInviteRequested extends UsersManagementEvent {
  const UsersManagementInviteRequested({
    required this.emails,
    required this.role,
    required this.cohort,
    required this.cohortOrder,
    required this.userTrack,
  });

  final List<String> emails;
  final AuthRole role;
  final int cohort;
  final int cohortOrder;
  final String userTrack;
}

class UsersManagementCreateRequested extends UsersManagementEvent {
  const UsersManagementCreateRequested({
    required this.role,
    required this.cohort,
    required this.provisionType,
  });

  final AuthRole role;
  final int cohort;
  final AdminUserProvisionType provisionType;
}

class UsersManagementDeleteRequested extends UsersManagementEvent {
  const UsersManagementDeleteRequested({required this.userId});

  final String userId;
}

class UsersManagementUpdateRequested extends UsersManagementEvent {
  const UsersManagementUpdateRequested({
    required this.userId,
    required this.role,
    required this.userTrack,
    required this.cohort,
    required this.nickname,
  });

  final String userId;
  final AuthRole role;
  final String userTrack;
  final int cohort;
  final String nickname;
}

class UsersManagementResetPasswordRequested extends UsersManagementEvent {
  const UsersManagementResetPasswordRequested({required this.userId});

  final String userId;
}
