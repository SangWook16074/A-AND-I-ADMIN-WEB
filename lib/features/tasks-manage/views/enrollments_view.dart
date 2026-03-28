import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

import '../task_management.dart';

enum EnrollmentActionStatus { enabled, banned, deleted }

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
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.enrollments == null || widget.enrollments!.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  '등록된 수강생이 없습니다.',
                  style: TextStyle(color: Color(0xFF8A8A8A)),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.enrollments!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final enrollment = widget.enrollments![index];
                final statusColor = enrollment.status == 'ENABLED'
                    ? const Color(0xFF10B981)
                    : enrollment.status == 'BANNED'
                    ? const Color(0xFFEF4444)
                    : const Color(0xFF6B7280);

                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFF3F4F6)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: statusColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            (enrollment.username?.isNotEmpty ?? false)
                                ? enrollment.username!
                                      .substring(0, 1)
                                      .toUpperCase()
                                : (enrollment.userId.isNotEmpty
                                      ? enrollment.userId
                                            .substring(0, 1)
                                            .toUpperCase()
                                      : '?'),
                            style: TextStyle(
                              color: statusColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  enrollment.username ?? 'Unknown',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 16,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                if (enrollment.publicCode != null) ...[
                                  const SizedBox(width: 6),
                                  Text(
                                    enrollment.publicCode!,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue[600],
                                      fontWeight: FontWeight.w600,
                                      backgroundColor: Colors.blue[50]
                                          ?.withValues(alpha: 0.5),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: statusColor.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    enrollment.status,
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: statusColor,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                if (enrollment.joinedAt != null) ...[
                                  const SizedBox(width: 8),
                                  Text(
                                    '등록: ${_formatDateTime(enrollment.joinedAt!)}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF9CA3AF),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            if (enrollment.banReason != null &&
                                enrollment.banReason!.trim().isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.red[50],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  '사유: ${enrollment.banReason}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.red[700],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      PopupMenuButton<EnrollmentActionStatus>(
                        tooltip: '관리',
                        enabled: !_isUpdatingEnrollmentStatus,
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Color(0xFF9CA3AF),
                        ),
                        onSelected: (value) {
                          if (value == EnrollmentActionStatus.deleted) {
                            _showDeleteEnrollmentDialog(enrollment);
                          } else {
                            _showEnrollmentStatusDialog(
                              enrollment: enrollment,
                              status: value,
                            );
                          }
                        },
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
                                Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '목록에서 삭제',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFEAEAEA)),
              color: const Color(0xFFFAFAFA),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '수강생 등록 / 복구',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _userLookupController,
                              decoration: InputDecoration(
                                labelText: 'Code',
                                hintText: '유저 코드 입력',
                                filled: true,
                                fillColor: Colors.white,
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
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Center(
                                      widthFactor: 1,
                                      child: Text(
                                        '조회',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
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
                            if (ref
                                .watch(tasksManagementBlocProvider)
                                .isSearchingUser)
                              const Padding(
                                padding: EdgeInsets.only(top: 8, left: 12),
                                child: SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            else if (ref
                                    .watch(tasksManagementBlocProvider)
                                    .searchedUser !=
                                null)
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 12,
                                ),
                                child: Text(
                                  '존재하는 사용자: ${ref.watch(tasksManagementBlocProvider).searchedUser!.nickname ?? ref.watch(tasksManagementBlocProvider).searchedUser!.id} (${ref.watch(tasksManagementBlocProvider).searchedUser!.username})',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            else if (ref
                                .watch(tasksManagementBlocProvider)
                                .userNotFound)
                              const Padding(
                                padding: EdgeInsets.only(top: 8, left: 12),
                                child: Text(
                                  '사용자를 찾을 수 없습니다.',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        height: 52,
                        child: FilledButton(
                          onPressed: _submit,
                          style: FilledButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            '등록',
                            style: TextStyle(fontWeight: FontWeight.w700),
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
            style: TextStyle(fontWeight: FontWeight.w800),
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
                    style: const TextStyle(fontWeight: FontWeight.w700),
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
                        if (!shouldRequireBanReason) {
                          return null;
                        }
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
              child: const Text(
                '취소',
                style: TextStyle(color: Color(0xFF8A8A8A)),
              ),
            ),
            FilledButton(
              onPressed: () async {
                if (!(formKey.currentState?.validate() ?? true)) {
                  return;
                }
                formKey.currentState?.save();
                Navigator.of(dialogContext).pop();

                setState(() {
                  _isUpdatingEnrollmentStatus = true;
                });

                final targetStatus = switch (status) {
                  EnrollmentActionStatus.enabled => EnrollmentStatus.enabled,
                  EnrollmentActionStatus.banned => EnrollmentStatus.banned,
                  EnrollmentActionStatus.deleted => throw UnimplementedError(
                    'Delete is separate',
                  ),
                };

                final statusString = switch (targetStatus) {
                  EnrollmentStatus.enabled => 'ENABLED',
                  EnrollmentStatus.banned => 'BANNED',
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

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${enrollment.username ?? enrollment.userId} 상태를 $statusString(으)로 변경 요청했습니다.',
                    ),
                  ),
                );

                if (mounted) {
                  setState(() {
                    _isUpdatingEnrollmentStatus = false;
                  });
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
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: Text(
          '정말로 ${enrollment.username ?? enrollment.userId} 수강생을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.',
          style: const TextStyle(height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('취소', style: TextStyle(color: Color(0xFF8A8A8A))),
          ),
          TextButton(
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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    '${enrollment.username ?? enrollment.userId} 수강생을 삭제 요청했습니다.',
                  ),
                ),
              );
            },
            child: const Text(
              '삭제',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDateTime(DateTime dt) {
  final now = DateTime.now();
  final difference = now.difference(dt);
  if (difference.inMinutes < 60) {
    return '${difference.inMinutes}분 전';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}시간 전';
  } else {
    return '${dt.year}.${dt.month.toString().padLeft(2, '0')}.${dt.day.toString().padLeft(2, '0')}';
  }
}
