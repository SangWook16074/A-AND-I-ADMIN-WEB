import 'package:flutter/material.dart';

import '../../oj-manage/views/oj_management_view.dart';
import '../../tasks-manage/task_management_view.dart';
import '../../users-manage/users_management_view.dart';
import '../dashboard_nav_view_model.dart';

class DashboardBodyView extends StatelessWidget {
  const DashboardBodyView({
    super.key,
    required this.selectedTab,
    required this.onLogout,
    required this.isDesktop,
  });

  final DashboardNavTab selectedTab;
  final VoidCallback onLogout;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return switch (selectedTab) {
      DashboardNavTab.usersManage => UsersManagementView(
        showLogoutButton: !isDesktop,
        onLogout: onLogout,
      ),
      DashboardNavTab.tasksManage => TaskManagementView(
        showLogoutButton: !isDesktop,
        onLogout: onLogout,
      ),
      DashboardNavTab.ojManage => OJManagementView(
        showLogoutButton: !isDesktop,
        onLogout: onLogout,
      ),
    };
  }
}
