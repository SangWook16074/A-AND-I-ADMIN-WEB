import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:aandi_auth/aandi_auth.dart';

import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'domain/entities/admin_user.dart';
import 'presentation/bloc/users_management_bloc.dart';
import 'presentation/bloc/users_management_event.dart';
import 'presentation/bloc/users_management_state.dart';
import 'views/users_management_pagination_view.dart';
import 'views/users_management_table_view.dart';

class UsersManagementView extends ConsumerStatefulWidget {
  const UsersManagementView({
    super.key,
    required this.showLogoutButton,
    this.onLogout,
  });

  final bool showLogoutButton;
  final VoidCallback? onLogout;

  @override
  ConsumerState<UsersManagementView> createState() =>
      UsersManagementViewState();
}

class UsersManagementViewState extends ConsumerState<UsersManagementView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref
          .read(usersManagementBlocProvider.notifier)
          .onEvent(const UsersManagementStarted());
    });
  }

  Future<void> onCreateUserPressed() async {
    await ref
        .read(usersManagementBlocProvider.notifier)
        .onEvent(
          const UsersManagementCreateRequested(
            role: AuthRole.user,
            provisionType: AdminUserProvisionType.invite,
          ),
        );
    if (!mounted) return;

    final nextState = ref.read(usersManagementBlocProvider);
    final isSuccess =
        nextState.status == UsersManagementStatus.success &&
        nextState.errorMessage == null;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          isSuccess
              ? '사용자가 생성되었습니다.'
              : (nextState.errorMessage ?? '사용자 생성에 실패했습니다.'),
        ),
      ),
    );
  }

  Future<void> showUserDetailDialog(AdminUser user) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('사용자 상세'),
          content: SizedBox(
            width: 460,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DetailItem(label: 'ID', value: user.id),
                  DetailItem(label: '아이디', value: user.username),
                  DetailItem(
                    label: '권한',
                    value: switch (user.role) {
                      AuthRole.admin => 'ADMIN',
                      AuthRole.organizer => 'ORGANIZER',
                      AuthRole.user => 'USER',
                    },
                  ),
                  DetailItem(
                    label: '활성화',
                    value: user.active == null
                        ? '-'
                        : (user.active! ? 'Y' : 'N'),
                  ),
                  DetailItem(
                    label: '비밀번호 변경 필요',
                    value: user.forcePasswordChange == null
                        ? '-'
                        : (user.forcePasswordChange! ? 'Y' : 'N'),
                  ),
                  DetailItem(
                    label: '초대 만료일',
                    value: user.inviteExpiresAt ?? '-',
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '초대 링크',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 6),
                  SelectableText(
                    user.inviteLink ?? '없음',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF555555),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('닫기'),
            ),
            FilledButton.icon(
              onPressed: user.inviteLink == null
                  ? null
                  : () async {
                      await Clipboard.setData(
                        ClipboardData(text: user.inviteLink!),
                      );
                      if (!mounted) return;
                      Navigator.of(dialogContext).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('초대 링크를 복사했습니다.')),
                      );
                    },
              icon: const Icon(Icons.copy_rounded, size: 16),
              label: const Text('링크 복사'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(usersManagementBlocProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final searchWidth = constraints.maxWidth;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '사용자 관리',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '플랫폼의 모든 사용자 계정을 관리하고 권한을 설정합니다.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8A8A8A),
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                runSpacing: 12,
                spacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  SizedBox(
                    width: searchWidth,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '닉네임 또는 아이디로 사용자 검색...',
                        prefixIcon: const Icon(Icons.search_rounded),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFEAEAEA),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Color(0xFFEAEAEA),
                          ),
                        ),
                      ),
                    ),
                  ),
                  FilledButton.icon(
                    onPressed: state.isCreating ? null : onCreateUserPressed,
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF1A1A1A),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: state.isCreating
                        ? const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.add_rounded),
                    label: Text(
                      state.isCreating ? '생성 중...' : '사용자 생성',
                      style: const TextStyle(fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (state.status == UsersManagementStatus.loading)
                const SizedBox(
                  height: 220,
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (state.status == UsersManagementStatus.failure)
                SizedBox(
                  height: 220,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.errorMessage ?? '사용자 목록을 불러오지 못했습니다.'),
                        const SizedBox(height: 8),
                        FilledButton(
                          onPressed: () {
                            ref
                                .read(usersManagementBlocProvider.notifier)
                                .onEvent(
                                  const UsersManagementRefreshRequested(),
                                );
                          },
                          child: const Text('다시 시도'),
                        ),
                      ],
                    ),
                  ),
                )
              else
                UsersManagementTableView(
                  users: state.users,
                  minWidth: constraints.maxWidth,
                  onUserTap: showUserDetailDialog,
                ),
              const SizedBox(height: 20),
              const Center(child: UsersManagementPaginationView()),
              const SizedBox(height: 48),
              const Divider(color: Color(0xFFF0F0F0)),
              const SizedBox(height: 18),
              const Center(
                child: Text(
                  '© 2026 A&I. All rights reserved.',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
              ),
              if (widget.showLogoutButton) ...[
                const SizedBox(height: 16),
                Center(
                  child: TextButton.icon(
                    onPressed: widget.onLogout,
                    icon: const Icon(Icons.logout_rounded, size: 18),
                    label: const Text('로그아웃'),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  const DetailItem({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF6F6F6F),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFF1A1A1A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
