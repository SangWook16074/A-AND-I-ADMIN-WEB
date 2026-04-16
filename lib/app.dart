import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app/api_error_feedback.dart';
import 'features/dashboard/dashboard_page.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/login/login_page.dart';

class AdminApp extends ConsumerStatefulWidget {
  const AdminApp({super.key});

  @override
  ConsumerState<AdminApp> createState() => _AdminAppState();
}

class _AdminAppState extends ConsumerState<AdminApp> {
  static const bool _bypassAuthForDashboard = false;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      navigatorKey: appNavigatorKey,
      initialLocation: '/dashboard',
      redirect: (context, state) {
        if (_bypassAuthForDashboard) {
          return null;
        }

        final isLoggedIn = ref.read(authBlocProvider).isAuthenticated;
        final isLoginRoute = state.matchedLocation == '/login';

        if (!isLoggedIn && !isLoginRoute) {
          return '/login';
        }
        if (isLoggedIn && isLoginRoute) {
          return '/dashboard';
        }
        return null;
      },
      routes: [
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(
          path: '/dashboard',
          builder: (context, state) => const DashboardPage(),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _router.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'AANDI Admin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
