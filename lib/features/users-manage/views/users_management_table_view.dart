import 'package:flutter/material.dart';
import 'package:aandi_auth/aandi_auth.dart';

import '../domain/entities/admin_user.dart';

class UsersManagementTableView extends StatelessWidget {
  const UsersManagementTableView({
    super.key,
    required this.users,
    required this.minWidth,
    required this.onUserTap,
  });

  final List<AdminUser> users;
  final double minWidth;
  final ValueChanged<AdminUser> onUserTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: minWidth),
          child: DataTable(
            showCheckboxColumn: false,
            headingTextStyle: const TextStyle(
              color: Color(0xFF888888),
              fontSize: 11,
              fontWeight: FontWeight.w800,
            ),
            dataTextStyle: const TextStyle(
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.w600,
            ),
            columns: const [
              DataColumn(label: Text('닉네임')),
              DataColumn(label: Text('아이디')),
              DataColumn(label: Text('권한')),
              DataColumn(label: Text('관리')),
            ],
            rows: users
                .map(
                  (user) => DataRow(
                    onSelectChanged: (_) => onUserTap(user),
                    cells: [
                      DataCell(Text(user.username)),
                      DataCell(
                        Text(
                          user.username,
                          style: const TextStyle(
                            color: Color(0xFF767676),
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: user.role == AuthRole.admin
                                ? const Color(0xFF1A1A1A)
                                : const Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            switch (user.role) {
                              AuthRole.admin => '관리자',
                              AuthRole.organizer => '멘토',
                              AuthRole.user => '일반',
                            },
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: user.role == AuthRole.admin
                                  ? Colors.white
                                  : const Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        TextButton(
                          onPressed: () => onUserTap(user),
                          child: const Text('상세'),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
