import 'package:aandi_auth/aandi_auth.dart';

import 'package:aandi_admin_api/aandi_admin_api.dart';

sealed class UsersManagementEvent {
  const UsersManagementEvent();
}

class UsersManagementStarted extends UsersManagementEvent {
  const UsersManagementStarted();
}

class UsersManagementRefreshRequested extends UsersManagementEvent {
  const UsersManagementRefreshRequested();
}

class UsersManagementCreateRequested extends UsersManagementEvent {
  const UsersManagementCreateRequested({
    required this.provisionType,
    required this.cohort,
  });

  final AdminUserProvisionType provisionType;
  final int cohort;
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
