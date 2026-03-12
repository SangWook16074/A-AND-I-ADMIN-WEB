import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'package:aandi_auth/aandi_auth.dart';


import 'domain/entities/admin_user.dart';
import 'presentation/bloc/users_management_bloc.dart';
import 'presentation/bloc/users_management_event.dart';
import 'presentation/bloc/users_management_state.dart';
import 'views/users_management_pagination_view.dart';
import 'views/users_management_table_view.dart';

class _InviteUserData {
  const _InviteUserData({
    required this.emails,
    required this.userTrack,
  });

  final List<String> emails;
  final String userTrack;
}

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
    final inviteData = await showInviteUserDialog();
    if (inviteData == null) return;

    await ref
        .read(usersManagementBlocProvider.notifier)
        .onEvent(
          UsersManagementInviteRequested(
            emails: inviteData.emails,
            role: AuthRole.user,
            cohort: 4,
            cohortOrder: 4,
            userTrack: inviteData.userTrack,
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
              ? '${inviteData.emails.length}명의 사용자에게 초대 메일을 발송했습니다.'
              : (nextState.errorMessage ?? '초대 메일 발송에 실패했습니다.'),
        ),
      ),
    );
  }
  Future<_InviteUserData?> showInviteUserDialog() async {
    return showDialog<_InviteUserData>(
      context: context,
      builder: (dialogContext) {
        final emailsController = TextEditingController();
        var selectedTrack = 'NO';
        
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: const Text('사용자 초대'),
              content: SizedBox(
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: emailsController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        labelText: '이메일 (콤마 또는 줄바꿈으로 구분)',
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        labelText: '트랙',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        isDense: true,
                      ),
                      value: selectedTrack,
                      items: const [
                        DropdownMenuItem(value: 'NO', child: Text('공통 (NO)')),
                        DropdownMenuItem(value: 'SP', child: Text('스프링 (SP)')),
                        DropdownMenuItem(value: 'FL', child: Text('플러터 (FL)')),
                      ],
                      onChanged: (val) {
                        if (val != null) setDialogState(() => selectedTrack = val);
                      },
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(dialogContext).pop(),
                  child: const Text('취소'),
                ),
                FilledButton(
                  onPressed: () {
                    final text = emailsController.text;
                    final emails = text
                        .split(RegExp(r'[,\n]'))
                        .map((e) => e.trim())
                        .where((e) => e.isNotEmpty)
                        .toList();
                    if (emails.isEmpty) return;
                    Navigator.of(dialogContext).pop(
                      _InviteUserData(emails: emails, userTrack: selectedTrack),
                    );
                  },
                  child: const Text('초대 발송'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> showUserDetailDialog(AdminUser user) async {
    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        var isDeleting = false;
        var isUpdating = false;
        var isResettingPassword = false;
        var selectedRole = _editableRole(user.role);
        var selectedTrack = _editableTrack(user.userTrack);
        var selectedCohort = _editableCohort(user.cohort);

        return StatefulBuilder(
          builder: (dialogBodyContext, setDialogState) {
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
                      DetailItem(
                        label: '닉네임',
                        value: _displayValue(user.nickname),
                      ),
                      DetailItem(label: '아이디', value: user.username),
                      DetailItem(
                        label: 'publicCode',
                        value: _displayValue(user.publicCode),
                      ),
                      const SizedBox(height: 12),
                      _EditableSelectField<AuthRole>(
                        label: '권한',
                        value: selectedRole,
                        options: const [
                          DropdownMenuItem(
                            value: AuthRole.user,
                            child: Text('사용자 (USER)'),
                          ),
                          DropdownMenuItem(
                            value: AuthRole.organizer,
                            child: Text('운영자 (ORGANIZER)'),
                          ),
                        ],
                        enabled: !isDeleting && !isUpdating,
                        onChanged: (nextValue) {
                          if (nextValue == null) return;
                          setDialogState(() => selectedRole = nextValue);
                        },
                      ),
                      const SizedBox(height: 10),
                      _EditableSelectField<String>(
                        label: '트랙',
                        value: selectedTrack,
                        options: const [
                          DropdownMenuItem(value: 'NO', child: Text('없음')),
                          DropdownMenuItem(value: 'FL', child: Text('Flutter')),
                          DropdownMenuItem(
                            value: 'SP',
                            child: Text('Spring Boot'),
                          ),
                        ],
                        enabled: !isDeleting && !isUpdating,
                        onChanged: (nextValue) {
                          if (nextValue == null) return;
                          setDialogState(() => selectedTrack = nextValue);
                        },
                      ),
                      const SizedBox(height: 10),
                      _EditableSelectField<int>(
                        label: '기수',
                        value: selectedCohort,
                        options: List.generate(
                          10,
                          (index) => DropdownMenuItem(
                            value: index + 1,
                            child: Text('${index + 1}기'),
                          ),
                        ),
                        enabled: !isDeleting && !isUpdating,
                        onChanged: (nextValue) {
                          if (nextValue == null) return;
                          setDialogState(() => selectedCohort = nextValue);
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
                        value: _displayValue(user.inviteExpiresAt),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '초대 링크',
                        style: TextStyle(fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 6),
                      SelectableText(
                        _displayValue(user.inviteLink, emptyText: '없음'),
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
                  onPressed: isDeleting || isUpdating || isResettingPassword
                      ? null
                      : () => Navigator.of(dialogContext).pop(),
                  child: const Text('닫기'),
                ),
                FilledButton.icon(
                  onPressed: isDeleting || isUpdating || isResettingPassword || user.inviteLink == null
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
                FilledButton.icon(
                  onPressed: isDeleting || isUpdating || isResettingPassword
                      ? null
                      : () async {
                          setDialogState(() => isResettingPassword = true);
                          try {
                            await ref
                                .read(usersManagementBlocProvider.notifier)
                                .onEvent(
                                  UsersManagementResetPasswordRequested(
                                    userId: user.id,
                                  ),
                                );
                            if (!mounted) return;

                            final nextState = ref.read(usersManagementBlocProvider);
                            final isSuccess = nextState.status == UsersManagementStatus.success &&
                                nextState.errorMessage == null;

                            if (isSuccess && nextState.temporaryPassword != null) {
                              final temporaryPassword = nextState.temporaryPassword!;
                              await showDialog(
                                context: context,
                                builder: (popupContext) => AlertDialog(
                                  title: const Text('임시 비밀번호 발급'),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        '아래 임시 비밀번호를 복사하여 사용자에게 전달해주세요.\n창을 닫으면 다시 확인할 수 없습니다.',
                                      ),
                                      const SizedBox(height: 16),
                                      Container(
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF5F5F5),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: SelectableText(
                                          temporaryPassword,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(popupContext).pop(),
                                      child: const Text('닫기'),
                                    ),
                                    FilledButton.icon(
                                      onPressed: () async {
                                        await Clipboard.setData(
                                          ClipboardData(text: temporaryPassword),
                                        );
                                        if (popupContext.mounted) {
                                          ScaffoldMessenger.of(popupContext).showSnackBar(
                                            const SnackBar(content: Text('비밀번호가 복사되었습니다.')),
                                          );
                                        }
                                      },
                                      icon: const Icon(Icons.copy_rounded, size: 16),
                                      label: const Text('복사하기'),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(nextState.errorMessage ?? '비밀번호 발급에 실패했습니다.'),
                                ),
                              );
                            }
                          } finally {
                            if (dialogBodyContext.mounted) {
                              setDialogState(() => isResettingPassword = false);
                            }
                          }
                        },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5), // Blue color for emphasis
                    foregroundColor: Colors.white,
                  ),
                  icon: isResettingPassword
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.password_rounded, size: 16),
                  label: Text(isResettingPassword ? '발급 중...' : '임시 비번 발급'),
                ),

                FilledButton.icon(
                  onPressed: isDeleting || isUpdating || isResettingPassword
                      ? null
                      : () async {
                          setDialogState(() => isUpdating = true);
                          try {
                            await ref
                                .read(usersManagementBlocProvider.notifier)
                                .onEvent(
                                  UsersManagementUpdateRequested(
                                    userId: user.id,
                                    role: selectedRole,
                                    userTrack: selectedTrack,
                                    cohort: selectedCohort,
                                    nickname: _rawOrEmpty(user.nickname),
                                  ),
                                );
                            if (!mounted) return;

                            final nextState = ref.read(
                              usersManagementBlocProvider,
                            );
                            final isSuccess =
                                nextState.status ==
                                    UsersManagementStatus.success &&
                                nextState.errorMessage == null;

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isSuccess
                                      ? '사용자 정보를 수정했습니다.'
                                      : (nextState.errorMessage ??
                                            '사용자 수정에 실패했습니다.'),
                                ),
                              ),
                            );
                          } finally {
                            if (dialogBodyContext.mounted) {
                              setDialogState(() => isUpdating = false);
                            }
                          }
                        },
                  icon: isUpdating
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.save_rounded, size: 16),
                  label: Text(isUpdating ? '저장 중...' : '수정 저장'),
                ),
                if (user.role != AuthRole.admin)
                  FilledButton.icon(
                    onPressed: isDeleting || isUpdating || isResettingPassword
                        ? null
                        : () async {
                            final confirmed = await showDialog<bool>(
                              context: dialogContext,
                              builder: (confirmContext) {
                                return AlertDialog(
                                  title: const Text('사용자 삭제'),
                                  content: Text(
                                    '${user.username} 사용자를 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(
                                        confirmContext,
                                      ).pop(false),
                                      child: const Text('취소'),
                                    ),
                                    FilledButton(
                                      onPressed: () => Navigator.of(
                                        confirmContext,
                                      ).pop(true),
                                      style: FilledButton.styleFrom(
                                        backgroundColor: const Color(
                                          0xFFB3261E,
                                        ),
                                        foregroundColor: Colors.white,
                                      ),
                                      child: const Text('삭제'),
                                    ),
                                  ],
                                );
                              },
                            );
                            if (confirmed != true) return;

                            setDialogState(() => isDeleting = true);
                            try {
                              await ref
                                  .read(usersManagementBlocProvider.notifier)
                                  .onEvent(
                                    UsersManagementDeleteRequested(
                                      userId: user.id,
                                    ),
                                  );
                              if (!mounted) return;

                              final nextState = ref.read(
                                usersManagementBlocProvider,
                              );
                              final isSuccess =
                                  nextState.status ==
                                      UsersManagementStatus.success &&
                                  nextState.errorMessage == null &&
                                  !nextState.users.any(
                                    (it) => it.id == user.id,
                                  );

                              if (isSuccess) {
                                if (Navigator.of(dialogContext).canPop()) {
                                  Navigator.of(dialogContext).pop();
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('사용자를 삭제했습니다.')),
                                );
                                return;
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    nextState.errorMessage ?? '사용자 삭제에 실패했습니다.',
                                  ),
                                ),
                              );
                            } finally {
                              if (dialogBodyContext.mounted) {
                                setDialogState(() => isDeleting = false);
                              }
                            }
                          },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFB3261E),
                      foregroundColor: Colors.white,
                    ),
                    icon: isDeleting
                        ? const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(Icons.delete_rounded, size: 16),
                    label: Text(isDeleting ? '삭제 중...' : '삭제'),
                  ),
              ],
            );
          },
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

class _EditableSelectField<T> extends StatelessWidget {
  const _EditableSelectField({
    required this.label,
    required this.value,
    required this.options,
    required this.enabled,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<DropdownMenuItem<T>> options;
  final bool enabled;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      items: options,
      onChanged: enabled ? onChanged : null,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        isDense: true,
      ),
    );
  }
}

String _displayValue(String? value, {String emptyText = '-'}) {
  if (value == null || value.trim().isEmpty) {
    return emptyText;
  }
  return value;
}

String _rawOrEmpty(String? value) {
  return value?.trim() ?? '';
}

AuthRole _editableRole(AuthRole role) {
  return switch (role) {
    AuthRole.user => AuthRole.user,
    AuthRole.organizer => AuthRole.organizer,
    AuthRole.admin => AuthRole.user,
  };
}

String _editableTrack(String? track) {
  final upper = track?.trim().toUpperCase();
  if (upper == 'NO') {
    return 'NO';
  }
  if (upper == 'SP') {
    return 'SP';
  }
  if (upper == 'FL') {
    return 'FL';
  }
  return 'NO';
}

int _editableCohort(int? cohort) {
  if (cohort == null) return 1;
  if (cohort < 1) return 1;
  if (cohort > 10) return 10;
  return cohort;
}
