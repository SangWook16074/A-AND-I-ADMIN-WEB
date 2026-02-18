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
    required this.role,
    required this.provisionType,
  });

  final AuthRole role;
  final AdminUserProvisionType provisionType;
}
