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
    const nameWidth = 220.0;
    const usernameWidth = 260.0;
    const roleWidth = 160.0;
    const actionWidth = 120.0;
    const tableWidth = nameWidth + usernameWidth + roleWidth + actionWidth;

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
          constraints: BoxConstraints(
            minWidth: minWidth > tableWidth ? minWidth : tableWidth,
          ),
          child: Column(
            children: [
              const HeaderRow(
                nameWidth: nameWidth,
                usernameWidth: usernameWidth,
                roleWidth: roleWidth,
                actionWidth: actionWidth,
              ),
              ...users.map(
                (user) => InkWell(
                  onTap: () => onUserTap(user),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: nameWidth, child: Text(user.username)),
                        SizedBox(
                          width: usernameWidth,
                          child: Text(
                            user.username,
                            style: const TextStyle(
                              color: Color(0xFF767676),
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                        SizedBox(
                          width: roleWidth,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
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
                        ),
                        const SizedBox(
                          width: actionWidth,
                          child: Text(
                            '상세',
                            style: TextStyle(
                              color: Color(0xFF1A1A1A),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    required this.nameWidth,
    required this.usernameWidth,
    required this.roleWidth,
    required this.actionWidth,
  });

  final double nameWidth;
  final double usernameWidth;
  final double roleWidth;
  final double actionWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFFFAFAFA),
      child: Row(
        children: [
          SizedBox(
            width: nameWidth,
            child: Text(
              '닉네임',
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            width: usernameWidth,
            child: Text(
              '아이디',
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            width: roleWidth,
            child: Text(
              '권한',
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(
            width: actionWidth,
            child: Text(
              '관리',
              style: TextStyle(
                color: Color(0xFF888888),
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
