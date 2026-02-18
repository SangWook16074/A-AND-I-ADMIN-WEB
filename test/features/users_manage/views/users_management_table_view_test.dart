import 'package:a_and_i_admin_web_serivce/features/users-manage/domain/entities/admin_user.dart';
import 'package:a_and_i_admin_web_serivce/features/users-manage/views/users_management_table_view.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('tapping a row calls onUserTap', (tester) async {
    AdminUser? tappedUser;
    const user = AdminUser(id: 'u-1', username: 'alice', role: AuthRole.user);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UsersManagementTableView(
            users: const [user],
            minWidth: 600,
            onUserTap: (user) => tappedUser = user,
          ),
        ),
      ),
    );

    await tester.tap(find.text('alice').first);
    await tester.pump();

    expect(tappedUser?.id, 'u-1');
  });
}
