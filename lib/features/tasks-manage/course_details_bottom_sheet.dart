import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';
import 'package:aandi_course_api/aandi_course_api.dart';

import 'task_management.dart';
import 'assignment_details_dialog.dart';
import 'edit_assignment_dialog.dart';

enum _EnrollmentActionStatus { enrolled, dropped, banned, deleted }

void showCourseDetailsBottomSheet(BuildContext context, CourseSummary course) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _CourseDetailsBottomSheet(course: course),
  );
}

class _CourseDetailsBottomSheet extends ConsumerStatefulWidget {
  const _CourseDetailsBottomSheet({required this.course});

  final CourseSummary course;

  @override
  ConsumerState<_CourseDetailsBottomSheet> createState() =>
      _CourseDetailsBottomSheetState();
}

class _CourseDetailsBottomSheetState
    extends ConsumerState<_CourseDetailsBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(tasksManagementBlocProvider, (previous, next) {
      if (previous?.isDeleting == true && next.isDeleting == false) {
        if (next.errorMessage == null) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('코스가 정상적으로 삭제되었습니다.')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('코스 삭제 실패: ${next.errorMessage}')),
          );
        }
      }

      // Update result listener
      if (previous?.isCreating == true && next.isCreating == false) {
        if (next.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('코스 수정 실패: ${next.errorMessage}')),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('과제가 성공적으로 반영되었습니다.')));
        }
      }
    });

    final state = ref.watch(tasksManagementBlocProvider);
    final enrollments = state.selectedCourseEnrollments;

    return FractionallySizedBox(
      heightFactor: 0.9,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 48,
                height: 6,
                decoration: BoxDecoration(
                  color: const Color(0xFFE0E0E0),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.course.metadata.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                        ),
                      ),
                      if (widget.course.metadata.description?.isNotEmpty ??
                          false) ...[
                        const SizedBox(height: 8),
                        Text(
                          widget.course.metadata.description!,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                          ),
                        ),
                      ],
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _CourseInfoChip(
                            label: '분야',
                            value: widget.course.targetTrack,
                          ),
                          _CourseInfoChip(
                            label: 'Phase',
                            value: widget.course.metadata.phase,
                          ),
                          _CourseInfoChip(
                            label: 'Slug',
                            value: widget.course.slug,
                          ),
                          if ((widget.course.startDate?.isNotEmpty ?? false) ||
                              (widget.course.endDate?.isNotEmpty ?? false))
                            _CourseInfoChip(
                              label: '일정',
                              value:
                                  '${widget.course.startDate ?? '-'} ~ ${widget.course.endDate ?? '-'}',
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.edit_outlined,
                    color: Color(0xFF555555),
                  ),
                  onPressed: () {
                    _showEditCourseDialog(
                      context: context,
                      ref: ref,
                      course: widget.course,
                    );
                  },
                ),
                IconButton(
                  icon: state.isDeleting
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: state.isDeleting
                      ? null
                      : () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                '코스 삭제',
                                style: TextStyle(fontWeight: FontWeight.w800),
                              ),
                              content: const Text(
                                '정말로 이 코스를 삭제하시겠습니까?\n주차, 과제, 수강생 등의 모든 데이터가 함께 삭제되며 복구할 수 없습니다.',
                                style: TextStyle(height: 1.5),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text(
                                    '취소',
                                    style: TextStyle(color: Color(0xFF8A8A8A)),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    ref
                                        .read(
                                          tasksManagementBlocProvider.notifier,
                                        )
                                        .add(
                                          TasksManagementCourseDeletedRequested(
                                            courseSlug: widget.course.slug,
                                          ),
                                        );
                                  },
                                  child: const Text(
                                    '삭제',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                ),
              ],
            ),
            const SizedBox(height: 24),
            TabBar(
              controller: _tabController,
              indicatorColor: const Color(0xFF1A1A1A),
              labelColor: const Color(0xFF1A1A1A),
              unselectedLabelColor: const Color(0xFF8A8A8A),
              labelStyle: const TextStyle(fontWeight: FontWeight.w700),
              tabs: const [
                Tab(text: '수강생 목록'),
                Tab(text: '과제 관리'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _EnrollmentsTab(
                    courseSlug: widget.course.slug,
                    isLoading: state.isLoadingDetails,
                    enrollments: enrollments,
                  ),
                  _AssignmentsTab(
                    course: widget.course,
                    courseSlug: widget.course.slug,
                    isLoading: state.isLoadingDetails,
                    assignments: state.selectedCourseAssignments,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditCourseDialog({
    required BuildContext context,
    required WidgetRef ref,
    required CourseSummary course,
  }) {
    final formKey = GlobalKey<FormState>();
    String title = course.metadata.title;
    String description = course.metadata.description ?? '';
    String phase = course.metadata.phase;
    String fieldTag = course.targetTrack;
    String status = course.status;
    String startDate = course.startDate ?? '';
    String endDate = course.endDate ?? '';

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text(
          '코스 수정',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        content: SizedBox(
          width: 440,
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    initialValue: title,
                    decoration: const InputDecoration(
                      labelText: '제목',
                      border: OutlineInputBorder(),
                    ),
                    onSaved: (v) => title = v?.trim() ?? title,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? '제목을 입력해주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    initialValue: description,
                    decoration: const InputDecoration(
                      labelText: '설명',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                    onSaved: (v) => description = v?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: phase,
                          decoration: const InputDecoration(
                            labelText: '단계 (Phase)',
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'BASIC',
                              child: Text('BASIC'),
                            ),
                            DropdownMenuItem(value: 'CS', child: Text('CS')),
                            DropdownMenuItem(
                              value: 'FRAMEWORK',
                              child: Text('FRAMEWORK'),
                            ),
                          ],
                          onChanged: (v) => phase = v ?? phase,
                          onSaved: (v) => phase = v ?? phase,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          initialValue: fieldTag,
                          decoration: const InputDecoration(
                            labelText: '트랙 (Field Tag)',
                            border: OutlineInputBorder(),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'FL', child: Text('FL')),
                            DropdownMenuItem(value: 'SP', child: Text('SP')),
                            DropdownMenuItem(value: 'NO', child: Text('NO')),
                          ],
                          onChanged: (v) => fieldTag = v ?? fieldTag,
                          onSaved: (v) => fieldTag = v ?? fieldTag,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: status,
                    decoration: const InputDecoration(
                      labelText: '상태 (Status)',
                      border: OutlineInputBorder(),
                    ),
                    items: const [
                      DropdownMenuItem(value: 'DRAFT', child: Text('DRAFT')),
                      DropdownMenuItem(
                        value: 'PUBLISHED',
                        child: Text('PUBLISHED'),
                      ),
                    ],
                    onChanged: (v) => status = v ?? status,
                    onSaved: (v) => status = v ?? status,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          initialValue: startDate,
                          decoration: const InputDecoration(
                            labelText: '시작일 (YYYY-MM-DD)',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (v) => startDate = v?.trim() ?? '',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          initialValue: endDate,
                          decoration: const InputDecoration(
                            labelText: '종료일 (YYYY-MM-DD)',
                            border: OutlineInputBorder(),
                          ),
                          onSaved: (v) => endDate = v?.trim() ?? '',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('취소', style: TextStyle(color: Color(0xFF8A8A8A))),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                formKey.currentState?.save();

                ref
                    .read(tasksManagementBlocProvider.notifier)
                    .add(
                      TasksManagementUpdateCourseRequested(
                        courseSlug: course.slug,
                        request: UpdateCourseRequest(
                          fieldTag: fieldTag,
                          startDate: startDate,
                          endDate: endDate,
                          title: title,
                          description: description,
                          phase: phase,
                          status: status,
                        ),
                      ),
                    );
                Navigator.pop(dialogContext);
              }
            },
            child: const Text('수정'),
          ),
        ],
      ),
    );
  }
}

class _EnrollmentsTab extends ConsumerStatefulWidget {
  const _EnrollmentsTab({
    required this.courseSlug,
    required this.isLoading,
    required this.enrollments,
  });

  final String courseSlug;
  final bool isLoading;
  final List<Enrollment>? enrollments;

  @override
  ConsumerState<_EnrollmentsTab> createState() => _EnrollmentsTabState();
}

class _EnrollmentsTabState extends ConsumerState<_EnrollmentsTab> {
  final _formKey = GlobalKey<FormState>();
  final _publicCodeController = TextEditingController();
  final bool _isUpdatingEnrollmentStatus = false;
  Timer? _searchTimer;

  @override
  void dispose() {
    _searchTimer?.cancel();
    _publicCodeController.dispose();
    super.dispose();
  }

  void _submit() {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    final searchedUser = ref.read(tasksManagementBlocProvider).searchedUser;
    if (searchedUser == null) {
      return;
    }

    final request = AddEnrollmentRequest(
      publicCode: searchedUser.publicCode ?? _publicCodeController.text.trim(),
    );
    ref
        .read(tasksManagementBlocProvider.notifier)
        .add(
          TasksManagementAddEnrollmentRequested(
            courseSlug: widget.courseSlug,
            request: request,
          ),
        );
    ref
        .read(tasksManagementBlocProvider.notifier)
        .add(const TasksManagementClearUserSearch());
    _publicCodeController.clear();
    _formKey.currentState?.reset();
    FocusScope.of(context).unfocus();
  }

  void _onPublicCodeChanged(String value) {
    _searchTimer?.cancel();
    ref
        .read(tasksManagementBlocProvider.notifier)
        .add(const TasksManagementClearUserSearch());

    final query = value.trim();
    if (query.isEmpty) {
      return;
    }

    _searchTimer = Timer(const Duration(seconds: 3), () {
      if (!mounted) {
        return;
      }
      ref
          .read(tasksManagementBlocProvider.notifier)
          .add(TasksManagementUserSearchRequested(query: query));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isLoading && widget.enrollments == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final taskState = ref.watch(tasksManagementBlocProvider);

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
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFEAEAEA)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color(0xFFF0F0F0),
                        child: Text(
                          enrollment.userId.isNotEmpty
                              ? enrollment.userId.substring(0, 1).toUpperCase()
                              : '?',
                          style: const TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User ID: ${enrollment.userId}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '상태: ${enrollment.status}',
                              style: TextStyle(
                                fontSize: 13,
                                color: enrollment.status == 'ENROLLED'
                                    ? Colors.green[700]
                                    : enrollment.status == 'BANNED'
                                    ? Colors.red[700]
                                    : const Color(0xFF8A8A8A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            if (enrollment.banReason != null &&
                                enrollment.banReason!.trim().isNotEmpty) ...[
                              const SizedBox(height: 4),
                              Text(
                                '제한 사유: ${enrollment.banReason}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF8A8A8A),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      PopupMenuButton<_EnrollmentActionStatus>(
                        tooltip: '상태 변경',
                        enabled: !_isUpdatingEnrollmentStatus,
                        onSelected: (value) {
                          if (value == _EnrollmentActionStatus.deleted) {
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
                            value: _EnrollmentActionStatus.enrolled,
                            child: Text('ENROLLED'),
                          ),
                          PopupMenuItem(
                            value: _EnrollmentActionStatus.dropped,
                            child: Text('DROPPED'),
                          ),
                          PopupMenuItem(
                            value: _EnrollmentActionStatus.banned,
                            child: Text('BANNED'),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: _EnrollmentActionStatus.deleted,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.delete_outline_rounded,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '수강생 삭제',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        ],
                        child: const Padding(
                          padding: EdgeInsets.all(4),
                          child: Icon(Icons.more_vert),
                        ),
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
                              controller: _publicCodeController,
                              decoration: const InputDecoration(
                                labelText: 'Public Code',
                                hintText: '3초 멈추면 자동 검색됩니다.',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onChanged: _onPublicCodeChanged,
                              validator: (v) {
                                final query = v?.trim() ?? '';
                                if (query.isEmpty) {
                                  return '필수';
                                }
                                if (taskState.isSearchingUser) {
                                  return '사용자 조회 중입니다.';
                                }
                                if (taskState.searchedUser?.publicCode !=
                                    query) {
                                  return '존재하는 publicCode를 입력하세요.';
                                }
                                return null;
                              },
                            ),
                            if (taskState.isSearchingUser)
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
                            else if (taskState.searchedUser != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 12,
                                ),
                                child: Text(
                                  '존재하는 사용자: ${taskState.searchedUser!.nickname ?? taskState.searchedUser!.id} (${taskState.searchedUser!.username})',
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              )
                            else if (taskState.userNotFound)
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
    )
  }

  Future<void> _showEnrollmentStatusDialog({
    required Enrollment enrollment,
    required _EnrollmentActionStatus status,
  }) async {
    final shouldRequireBanReason = status == _EnrollmentActionStatus.banned;
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
                    '대상: ${enrollment.userId}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '변경 상태: ${switch (status) {
                      _EnrollmentActionStatus.enrolled => 'ENROLLED',
                      _EnrollmentActionStatus.dropped => 'DROPPED',
                      _EnrollmentActionStatus.banned => 'BANNED',
                      _EnrollmentActionStatus.deleted => 'DELETED',
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
                  _EnrollmentActionStatus.enrolled => 'ENROLLED',
                  _EnrollmentActionStatus.dropped => 'DROPPED',
                  _EnrollmentActionStatus.banned => 'BANNED',
                  _EnrollmentActionStatus.deleted => 'DELETED',
                };

                ref
                    .read(tasksManagementBlocProvider.notifier)
                    .add(
                      TasksManagementUpdateEnrollmentStatusRequested(
                        courseSlug: widget.courseSlug,
                        userId: enrollment.userId,
                        request: UpdateEnrollmentStatusRequest(
                          status: targetStatus,
                          banReason: targetStatus == 'BANNED'
                              ? banReason
                              : null,
                        ),
                      ),
                    );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${enrollment.userId} 상태를 $targetStatus(으)로 변경 요청했습니다.',
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
          '정말로 ${enrollment.userId} 수강생을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.',
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
                SnackBar(content: Text('${enrollment.userId} 수강생을 삭제 요청했습니다.')),
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

class _AssignmentsTab extends ConsumerStatefulWidget {
  const _AssignmentsTab({
    required this.course,
    required this.courseSlug,
    required this.isLoading,
    this.assignments,
  });

  final CourseSummary course;
  final String courseSlug;
  final bool isLoading;
  final List<Assignment>? assignments;

  @override
  ConsumerState<_AssignmentsTab> createState() => _AssignmentsTabState();
}

class _AssignmentsTabState extends ConsumerState<_AssignmentsTab> {
  final _formKey = GlobalKey<FormState>();

  int _weekNo = 1;
  int _orderInWeek = 1;
  String _title = '';
  String _difficulty = 'MID';
  String _description = '';
  String _startAt = '';
  String _endAt = '';

  int? _timeLimitMinutes;
  List<String> _learningGoals = [];
  String _language = 'kotlin';

  String _requirementsText = '';
  final List<_ExampleData> _examples = [_ExampleData()];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF7E8),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFF1DFC0)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.course.metadata.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2B2113),
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _CourseInfoChip(
                      label: '분야',
                      value: widget.course.targetTrack,
                    ),
                    _CourseInfoChip(
                      label: 'Phase',
                      value: widget.course.metadata.phase,
                    ),
                    _CourseInfoChip(label: 'Slug', value: widget.course.slug),
                  ],
                ),
              ],
            ),
          ),
          // List existing assignments
          if (widget.isLoading && widget.assignments == null)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: CircularProgressIndicator(),
              ),
            )
          else if (widget.assignments != null && widget.assignments!.isNotEmpty)
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.assignments!.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final assignment = widget.assignments![index];
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFEAEAEA)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${assignment.weekNo}주차 - ${assignment.metadata.title}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              assignment.status,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _CourseInfoChip(
                            label: '분야',
                            value: widget.course.targetTrack,
                          ),
                          _CourseInfoChip(
                            label: 'Phase',
                            value: widget.course.metadata.phase,
                          ),
                          if ((assignment.metadata.attributes['language'] ?? '')
                              .toString()
                              .isNotEmpty)
                            _CourseInfoChip(
                              label: '언어',
                              value: assignment.metadata.attributes['language']
                                  .toString(),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '난이도: ${assignment.metadata.difficulty} | 기한: ${assignment.startAt.split('T').first} ~ ${assignment.endAt.split('T').first}',
                              style: const TextStyle(
                                color: Color(0xFF8A8A8A),
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AssignmentDetailsDialog(
                                          courseSlug: widget.courseSlug,
                                          assignmentId: assignment.id,
                                        ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  '상세 보기',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => EditAssignmentDialog(
                                      courseSlug: widget.courseSlug,
                                      assignment: assignment,
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  '수정',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('과제 삭제'),
                                      content: const Text(
                                        '과제와 연관 데이터(요구사항/예시/배포)를 모두 삭제합니다. 계속하시겠습니까?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text(
                                            '취소',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ref
                                                .read(
                                                  tasksManagementBlocProvider
                                                      .notifier,
                                                )
                                                .add(
                                                  TasksManagementAssignmentDeletedRequested(
                                                    courseSlug:
                                                        widget.courseSlug,
                                                    assignmentId: assignment.id,
                                                  ),
                                                );
                                          },
                                          child: const Text(
                                            '삭제',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          else
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  '등록된 과제가 없습니다.',
                  style: TextStyle(color: Color(0xFF8A8A8A)),
                ),
              ),
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
                    '새 과제 추가',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '주차 (weekNo)',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (v) => _weekNo = int.tryParse(v ?? '1') ?? 1,
                          validator: (v) =>
                              v == null || v.isEmpty ? '필수' : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '순서 (order)',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (v) =>
                              _orderInWeek = int.tryParse(v ?? '1') ?? 1,
                          validator: (v) =>
                              v == null || v.isEmpty ? '필수' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '과제 제목',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (v) => _title = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '과제 설명',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    maxLines: 3,
                    onSaved: (v) => _description = v?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _difficulty,
                    decoration: const InputDecoration(
                      labelText: '난이도',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'LOW', child: Text('LOW')),
                      DropdownMenuItem(value: 'MID', child: Text('MID')),
                      DropdownMenuItem(value: 'HIGH', child: Text('HIGH')),
                    ],
                    onChanged: (v) => setState(() => _difficulty = v ?? 'MID'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '시작일시 (예: 2026-03-03T09:00:00+09:00)',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (v) => _startAt = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '종료일시 (예: 2026-03-11T08:59:59+09:00)',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (v) => _endAt = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Text(
                    '메타데이터 및 제약사항',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '제한 시간 (분)',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (v) =>
                              _timeLimitMinutes = int.tryParse(v ?? ''),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '사용 언어 (예: kotlin)',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          initialValue: _language,
                          onSaved: (v) => _language = v?.trim() ?? '',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '학습 목표 (쉼표로 구분)',
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '함수 분리, 코드 컨벤션',
                    ),
                    onSaved: (v) {
                      if (v != null && v.trim().isNotEmpty) {
                        _learningGoals = v
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                      } else {
                        _learningGoals = [];
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '요구사항 (줄바꿈으로 구분)',
                      filled: true,
                      fillColor: Colors.white,
                      hintText: '함수 분리 필수\n예외 처리 필수',
                    ),
                    maxLines: 3,
                    onSaved: (v) => _requirementsText = v?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '테스트 예제',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _examples.add(_ExampleData());
                          });
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('예제 추가'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._examples.asMap().entries.map((entry) {
                    final index = entry.key;
                    final example = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '예제 ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              if (_examples.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _examples.removeAt(index);
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: example.input,
                            decoration: const InputDecoration(
                              labelText: '예제 입력 (Input)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              hintText: 'ADD 1\\nCLOSE',
                            ),
                            maxLines: 2,
                            onSaved: (v) => example.input = v?.trim() ?? '',
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: example.output,
                            decoration: const InputDecoration(
                              labelText: '예제 출력 (Output)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              hintText: '+1',
                            ),
                            maxLines: 2,
                            onSaved: (v) => example.output = v?.trim() ?? '',
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: example.description,
                            decoration: const InputDecoration(
                              labelText: '예제 설명 (Description)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              hintText: '기본 동작',
                            ),
                            onSaved: (v) =>
                                example.description = v?.trim() ?? '',
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();

                          final reqList = _requirementsText.isEmpty
                              ? <AssignmentRequirement>[]
                              : _requirementsText
                                    .split('\n')
                                    .where((e) => e.trim().isNotEmpty)
                                    .toList()
                                    .asMap()
                                    .entries
                                    .map(
                                      (e) => AssignmentRequirement(
                                        sortOrder: e.key + 1,
                                        requirementText: e.value.trim(),
                                      ),
                                    )
                                    .toList();
                          final exampleList = _examples
                              .asMap()
                              .entries
                              .where(
                                (e) =>
                                    e.value.input.isNotEmpty ||
                                    e.value.output.isNotEmpty ||
                                    e.value.description.isNotEmpty,
                              )
                              .map(
                                (e) => AssignmentExample(
                                  seq: e.key + 1,
                                  inputText: e.value.input.replaceAll(
                                    '\\n',
                                    '\n',
                                  ),
                                  outputText: e.value.output.replaceAll(
                                    '\\n',
                                    '\n',
                                  ),
                                  description: e.value.description,
                                ),
                              )
                              .toList();

                          ref
                              .read(tasksManagementBlocProvider.notifier)
                              .add(
                                TasksManagementCreateAssignmentRequested(
                                  courseSlug: widget.courseSlug,
                                  request: CreateAssignmentRequest(
                                    weekNo: _weekNo,
                                    orderInWeek: _orderInWeek,
                                    startAt: _startAt,
                                    endAt: _endAt,
                                    metadata: AssignmentMetadata(
                                      title: _title,
                                      description: _description,
                                      difficulty: _difficulty,
                                      timeLimitMinutes: _timeLimitMinutes,
                                      learningGoals: _learningGoals
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => LearningGoal(
                                              sortOrder: e.key + 1,
                                              learningGoalText: e.value,
                                            ),
                                          )
                                          .toList(),
                                      requirements: reqList,
                                      examples: exampleList,
                                      attributes: _language.isNotEmpty
                                          ? {'language': _language}
                                          : {},
                                    ),
                                  ),
                                ),
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('과제 생성 요청을 보냈습니다.')),
                          );
                          _formKey.currentState?.reset();
                          setState(() {
                            _examples.clear();
                            _examples.add(_ExampleData());
                          });
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A1A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        '과제 등록',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CourseInfoChip extends StatelessWidget {
  const _CourseInfoChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: const Color(0xFFE4D1B1)),
      ),
      child: Text(
        '$label $value',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: Color(0xFF5F4A2A),
        ),
      ),
    );
  }
}

class _ExampleData {
  String input = '';
  String output = '';
  String description = '';
}
