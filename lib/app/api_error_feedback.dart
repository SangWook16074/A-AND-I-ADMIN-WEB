import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:aandi_oj_api/aandi_oj_api.dart';
import 'package:flutter/material.dart';

import '../features/oj-manage/data/datasources/oj_management_api_client.dart';
import '../features/users-manage/data/datasources/users_management_api_client.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

bool _isShowingApiAlert = false;

String? extractApiAlert(Object error) {
  return switch (error) {
    AuthApiException(:final alert) => alert,
    AdminApiException(:final alert) => alert,
    CourseApiException(:final alert) => alert,
    OjApiException(:final alert) => alert,
    UsersManagementApiException(:final alert) => alert,
    OjManagementApiException(:final alert) => alert,
    _ => null,
  };
}

Future<void> showApiAlertIfPresent(Object error) async {
  final alert = extractApiAlert(error);
  if (alert == null || alert.trim().isEmpty || _isShowingApiAlert) {
    return;
  }

  final context =
      appNavigatorKey.currentContext ??
      appNavigatorKey.currentState?.overlay?.context;
  if (context == null) {
    return;
  }

  _isShowingApiAlert = true;
  try {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('알림'),
          content: Text(alert),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('확인'),
            ),
          ],
        );
      },
    );
  } finally {
    _isShowingApiAlert = false;
  }
}
