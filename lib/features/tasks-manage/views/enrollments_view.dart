import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

import '../task_management.dart';

enum EnrollmentActionStatus { enabled, banned, deleted }

// ─── 디자인 토큰 ────────────────────────────────────────────────────────────────
class _D {
  static const textPrimary = Color(0xFF0F172B);
  static const textLight = Color(0xFF90A1B9);
  static const label = Color(0xFF314158);
  static const inputBorder = Color(0xFFCAD5E2);
  static const sectionBorder = Color(0xFFE2E8F0);
  static const sectionBg = Color(0xFFF8FAFC);
  static const accentBlue = Color(0xFF155DFC);
}

InputDecoration _inputDeco(String? hint) => InputDecoration(
  hintText: hint,
  hintStyle: const TextStyle(color: _D.textLight, fontSize: 14),
  filled: true,
  fillColor: Colors.white,
  contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: _D.inputBorder),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: _D.inputBorder),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: _D.accentBlue, width: 1.5),
  ),
);

// ─── 메인 위젯 ──────────────────────────────────────────────────────────────────
class EnrollmentsView extends ConsumerStatefulWidget {
  const EnrollmentsView({
    super.key,
    required this.courseSlug,
    required this.isLoading,
    required this.enrollments,
  });

  final String courseSlug;
  final bool isLoading;
  final List<Enrollment>? enrollments;

  @override
  ConsumerState<EnrollmentsView> createState() => EnrollmentsViewState();
}

class EnrollmentsViewState extends ConsumerState<EnrollmentsView> {
  final _formKey = GlobalKey<FormState>();
  String _publicCode = '';
  bool _isUpdatingEnrollmentStatus = false;
  late final TextEditingController _userLookupController;

  @override
  void initState() {
    super.initState();
    _userLookupController = TextEditingController();
    _userLookupController.addListener(() {
      if (_userLookupController.text.isEmpty) {
        ref
            .read(tasksManagementBlocProvider.notifier)
            .add(const TasksManagementClearUserSearch());
      }
    });
  }

  @override
  void dispose() {
    _userLookupController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final searchedUser = ref.read(tasksManagementBlocProvider).searchedUser;
      final request = AddEnrollmentRequest(
        publicCode: searchedUser?.publicCode ?? _publicCode,
      );
      ref
          .read(tasksManagementBlocProvider.notifier)
          .add(
            TasksManagementAddEnrollmentRequested(
              courseSlug: widget.courseSlug,
              request: request,
            ),
          );
      _userLookupController.clear();
      ref
          .read(tasksManagementBlocProvider.notifier)
          .add(const TasksManagementClearUserSearch());
      _formKey.currentState!.reset();
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && widget.enrollments == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 28, 32, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── 수강생 목록 ──────────────────────────────────────────────────
          if (widget.enrollments == null || widget.enrollments!.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                '등록된 수강생이 없습니다.',
                style: const TextStyle(color: _D.textLight, fontSize: 14),
              ),
            )
          else
            Column(
              children: widget.enrollments!
                  .map(
                    (e) => _EnrollmentCard(
                      enrollment: e,
                      isUpdating: _isUpdatingEnrollmentStatus,
                      onStatusAction: (status) {
                        if (status == EnrollmentActionStatus.deleted) {
                          _showDeleteEnrollmentDialog(e);
                        } else {
                          _showEnrollmentStatusDialog(
                            enrollment: e,
                            status: status,
                          );
                        }
                      },
                    ),
                  )
                  .toList(),
            ),

          const SizedBox(height: 32),

          // ── 수강생 등록 폼 ───────────────────────────────────────────────
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: _D.sectionBg,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: _D.sectionBorder),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '수강생 등록 / 복구',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _D.textPrimary,
                      letterSpacing: -0.89,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 라벨
                            const Text(
                              'Public Code',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _D.label,
                              ),
                            ),
                            const SizedBox(height: 6),
                            // 인풋 + 조회 버튼
                            TextFormField(
                              controller: _userLookupController,
                              decoration: _inputDeco('유저 코드 입력').copyWith(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    final query = _userLookupController.text
                                        .trim();
                                    if (query.isNotEmpty) {
                                      ref
                                          .read(
                                            tasksManagementBlocProvider
                                                .notifier,
                                          )
                                          .add(
                                            TasksManagementUserSearchRequested(
                                              query: query,
                                            ),
                                          );
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _D.textPrimary,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: const Center(
                                      widthFactor: 1,
                                      child: Text(
                                        '조회',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onSaved: (v) => _publicCode = v?.trim() ?? '',
                              validator: (v) =>
                                  v == null || v.trim().isEmpty ? '필수' : null,
                            ),
                            const SizedBox(height: 6),
                            // 유저 검색 결과
                            _buildSearchResult(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: SizedBox(
                          height: 42,
                          child: FilledButton(
                            onPressed: _submit,
                            style: FilledButton.styleFrom(
                              backgroundColor: _D.textPrimary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              '등록',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResult() {
    final state = ref.watch(tasksManagementBlocProvider);
    if (state.isSearchingUser) {
      return const Padding(
        padding: EdgeInsets.only(left: 4),
        child: SizedBox(
          width: 14,
          height: 14,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    if (state.searchedUser != null) {
      return Text(
        '존재하는 사용자: ${state.searchedUser!.nickname ?? state.searchedUser!.id} (${state.searchedUser!.username})',
        style: const TextStyle(
          color: _D.accentBlue,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    if (state.userNotFound) {
      return const Text(
        '사용자를 찾을 수 없습니다.',
        style: TextStyle(
          color: Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Future<void> _showEnrollmentStatusDialog({
    required Enrollment enrollment,
    required EnrollmentActionStatus status,
  }) async {
    final shouldRequireBanReason = status == EnrollmentActionStatus.banned;
    final formKey = GlobalKey<FormState>();
    String banReason = enrollment.banReason ?? '';

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text(
            '수강 상태 변경',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          content: SizedBox(
            width: 420,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '대상: ${enrollment.username ?? enrollment.userId}',
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '변경 상태: ${switch (status) {
                      EnrollmentActionStatus.enabled => 'ENABLED',
                      EnrollmentActionStatus.banned => 'BANNED',
                      EnrollmentActionStatus.deleted => 'DELETED',
                    }}',
                  ),
                  if (shouldRequireBanReason) ...[
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: banReason,
                      decoration: const InputDecoration(
                        labelText: '제한 사유',
                        hintText: '운영 정책 위반',
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 3,
                      onSaved: (value) => banReason = value?.trim() ?? '',
                      validator: (value) {
                        if (!shouldRequireBanReason) return null;
                        if (value == null || value.trim().isEmpty) {
                          return 'BANNED 상태에서는 제한 사유를 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text('취소', style: TextStyle(color: _D.textLight)),
            ),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: _D.textPrimary),
              onPressed: () async {
                if (!(formKey.currentState?.validate() ?? true)) return;
                formKey.currentState?.save();
                Navigator.of(dialogContext).pop();

                setState(() => _isUpdatingEnrollmentStatus = true);

                final targetStatus = switch (status) {
                  EnrollmentActionStatus.enabled => EnrollmentStatus.enabled,
                  EnrollmentActionStatus.banned => EnrollmentStatus.banned,
                  EnrollmentActionStatus.deleted => throw UnimplementedError(
                    'Delete is separate',
                  ),
                };

                ref
                    .read(tasksManagementBlocProvider.notifier)
                    .add(
                      TasksManagementUpdateEnrollmentStatusRequested(
                        courseSlug: widget.courseSlug,
                        userId: enrollment.userId,
                        request: UpdateEnrollmentStatusRequest(
                          status: targetStatus,
                          banReason: targetStatus == EnrollmentStatus.banned
                              ? banReason
                              : null,
                        ),
                      ),
                    );

                if (mounted) {
                  setState(() => _isUpdatingEnrollmentStatus = false);
                }
              },
              child: const Text('변경'),
            ),
          ],
        );
      },
    );
  }

  void _showDeleteEnrollmentDialog(Enrollment enrollment) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(
          '수강생 삭제',
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        content: Text(
          '정말로 ${enrollment.username ?? enrollment.userId} 수강생을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.',
          style: const TextStyle(height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('취소', style: TextStyle(color: _D.textLight)),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(dialogContext);
              ref
                  .read(tasksManagementBlocProvider.notifier)
                  .add(
                    TasksManagementDeleteEnrollmentRequested(
                      courseSlug: widget.courseSlug,
                      userId: enrollment.userId,
                    ),
                  );
            },
            child: const Text('삭제'),
          ),
        ],
      ),
    );
  }
}

// ─── 수강생 카드 ───────────────────────────────────────────────────────────────
class _EnrollmentCard extends StatelessWidget {
  final Enrollment enrollment;
  final bool isUpdating;
  final ValueChanged<EnrollmentActionStatus> onStatusAction;

  const _EnrollmentCard({
    required this.enrollment,
    required this.isUpdating,
    required this.onStatusAction,
  });

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(enrollment.status);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: _D.sectionBorder),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // 아바타
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: statusColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                (enrollment.username?.isNotEmpty ?? false)
                    ? enrollment.username!.substring(0, 1).toUpperCase()
                    : enrollment.userId.isNotEmpty
                    ? enrollment.userId.substring(0, 1).toUpperCase()
                    : '?',
                style: TextStyle(
                  color: statusColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 이름 + 코드
                Row(
                  children: [
                    Text(
                      enrollment.username ?? 'Unknown',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: _D.textPrimary,
                        letterSpacing: -0.3,
                      ),
                    ),
                    if (enrollment.publicCode != null) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          enrollment.publicCode!,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.blue[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    // 상태 배지
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        enrollment.status,
                        style: TextStyle(
                          fontSize: 11,
                          color: statusColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (enrollment.joinedAt != null) ...[
                      const SizedBox(width: 8),
                      Text(
                        '등록: ${_formatDateTime(enrollment.joinedAt!)}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: _D.textLight,
                        ),
                      ),
                    ],
                  ],
                ),
                if (enrollment.banReason != null &&
                    enrollment.banReason!.trim().isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '사유: ${enrollment.banReason}',
                      style: TextStyle(fontSize: 12, color: Colors.red[700]),
                    ),
                  ),
                ],
              ],
            ),
          ),
          PopupMenuButton<EnrollmentActionStatus>(
            tooltip: '관리',
            enabled: !isUpdating,
            icon: const Icon(Icons.more_horiz, color: _D.textLight),
            onSelected: onStatusAction,
            itemBuilder: (context) => const [
              PopupMenuItem(
                value: EnrollmentActionStatus.enabled,
                child: Text('상태: ENABLED'),
              ),
              PopupMenuItem(
                value: EnrollmentActionStatus.banned,
                child: Text('상태: BANNED'),
              ),
              PopupMenuDivider(),
              PopupMenuItem(
                value: EnrollmentActionStatus.deleted,
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, color: Colors.red, size: 18),
                    SizedBox(width: 8),
                    Text('목록에서 삭제', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'ENABLED':
        return const Color(0xFF10B981);
      case 'BANNED':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF6B7280);
    }
  }
}

String _formatDateTime(DateTime dt) {
  final now = DateTime.now();
  final difference = now.difference(dt);
  if (difference.inMinutes < 60) return '${difference.inMinutes}분 전';
  if (difference.inHours < 24) return '${difference.inHours}시간 전';
  return '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')}';
}
