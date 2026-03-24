import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../dashboard_nav_view_model.dart';

class DashboardSidebarView extends ConsumerWidget {
  const DashboardSidebarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(dashboardNavViewModelProvider);

    return Container(
      width: 264,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Color(0xFFEFEFEF))),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(24, 32, 24, 24),
            child: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: Icon(
                      Icons.admin_panel_settings_rounded,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'A&I ADMIN',
                  style: TextStyle(
                    fontSize: 12,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Color(0xFFF1F1F1)),
          const SizedBox(height: 20),
          DashboardSidebarItemView(
            icon: Icons.group_rounded,
            label: '사용자 관리',
            selected: selectedTab == DashboardNavTab.usersManage,
            onTap: () {
              ref
                  .read(dashboardNavViewModelProvider.notifier)
                  .selectTab(DashboardNavTab.usersManage);
            },
          ),
          DashboardSidebarItemView(
            icon: Icons.add_task_rounded,
            label: '과제 추가',
            selected: selectedTab == DashboardNavTab.tasksManage,
            onTap: () {
              ref
                  .read(dashboardNavViewModelProvider.notifier)
                  .selectTab(DashboardNavTab.tasksManage);
            },
          ),
          DashboardSidebarItemView(
            icon: Icons.code_rounded,
            label: '채점 서비스 관리',
            selected: selectedTab == DashboardNavTab.ojManage,
            onTap: () {
              ref
                  .read(dashboardNavViewModelProvider.notifier)
                  .selectTab(DashboardNavTab.ojManage);
            },
          ),
          const Spacer(),
          const Divider(height: 1, color: Color(0xFFF1F1F1)),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 17,
                  backgroundColor: Color(0xFFEDEDED),
                  child: Icon(Icons.person_rounded, color: Color(0xFF333333)),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin User',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        'SUPER ADMIN',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(0xFF8A8A8A),
                          letterSpacing: 0.4,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashboardSidebarItemView extends StatelessWidget {
  const DashboardSidebarItemView({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1A1A1A) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          dense: true,
          leading: Icon(
            icon,
            color: selected ? Colors.white : const Color(0xFF666666),
          ),
          title: Text(
            label,
            style: TextStyle(
              color: selected ? Colors.white : const Color(0xFF666666),
              fontSize: 14,
              fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
