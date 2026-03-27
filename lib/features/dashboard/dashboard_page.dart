import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/presentation/bloc/auth_bloc.dart';
import '../auth/presentation/bloc/auth_event.dart';
import 'dashboard_nav_view_model.dart';
import 'views/dashboard_body_view.dart';
import 'views/dashboard_sidebar_view.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(dashboardNavViewModelProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 980;

        void onLogout() {
          ref
              .read(authBlocProvider.notifier)
              .onEvent(const AuthLogoutRequested());
          context.go('/login');
        }

        final body = DashboardBodyView(
          selectedTab: selectedTab,
          onLogout: onLogout,
          isDesktop: isDesktop,
        );

        if (isDesktop) {
          return Scaffold(
            backgroundColor: const Color(0xFFFCFCFC),
            body: Row(
              children: [
                const DashboardSidebarView(),
                Expanded(child: body),
              ],
            ),
          );
        }

        return Scaffold(
          backgroundColor: const Color(0xFFFCFCFC),
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: const Text(
              'A&I Admin',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                letterSpacing: -0.5,
              ),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.menu_rounded),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                );
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  ref
                      .read(authBlocProvider.notifier)
                      .onEvent(const AuthLogoutRequested());
                  context.go('/login');
                },
                icon: const Icon(Icons.logout_rounded),
              ),
            ],
          ),
          drawer: const Drawer(
            child: DashboardSidebarView(),
          ),
          body: body,
        );
      },
    );
  }
}
