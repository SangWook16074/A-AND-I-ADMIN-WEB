import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/kotlin.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

import 'task_management.dart';
import 'assignment_details_dialog.dart';
import 'edit_assignment_dialog.dart';

enum _EnrollmentActionStatus { enabled, banned, deleted }

void showCourseDetailsBottomSheet(BuildContext context, CourseSummary course) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
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
          ).showSnackBar(SnackBar(content: Text('과제가 성공적으로 반영되었습니다.')));
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
                IconButton(
                  icon: const Icon(
                    Icons.close_rounded,
                    color: Color(0xFF555555),
                  ),
                  onPressed: () => Navigator.of(context).pop(),
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
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setDialogState) {
          return AlertDialog(
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
                        validator: (v) => (v == null || v.trim().isEmpty)
                            ? '제목을 입력해주세요.'
                            : null,
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
                                DropdownMenuItem(
                                  value: 'CS',
                                  child: Text('CS'),
                                ),
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
                                DropdownMenuItem(
                                  value: 'FL',
                                  child: Text('FL'),
                                ),
                                DropdownMenuItem(
                                  value: 'SP',
                                  child: Text('SP'),
                                ),
                                DropdownMenuItem(
                                  value: 'NO',
                                  child: Text('NO'),
                                ),
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
                          DropdownMenuItem(
                            value: 'DRAFT',
                            child: Text('DRAFT'),
                          ),
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
                            child: _DatePickerFieldInline(
                              label: '시작일',
                              initialValue: startDate,
                              onChanged: (v) => startDate = v,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _DatePickerFieldInline(
                              label: '종료일',
                              initialValue: endDate,
                              onChanged: (v) => endDate = v,
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
                child: const Text(
                  '취소',
                  style: TextStyle(color: Color(0xFF8A8A8A)),
                ),
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
          );
        },
      ),
    );
  }
}

class _DatePickerFieldInline extends StatefulWidget {
  const _DatePickerFieldInline({
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  final String label;
  final String initialValue;
  final Function(String) onChanged;

  @override
  State<_DatePickerFieldInline> createState() => _DatePickerFieldInlineState();
}

class _DatePickerFieldInlineState extends State<_DatePickerFieldInline> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        suffixIcon: const Icon(Icons.calendar_today, size: 18),
      ),
      onTap: () async {
        final current = DateTime.tryParse(_controller.text) ?? DateTime.now();
        final picked = await showDatePicker(
          context: context,
          initialDate: current,
          firstDate: DateTime(2020),
          lastDate: DateTime(2101),
        );
        if (picked != null) {
          final formatted =
              '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
          _controller.text = formatted;
          widget.onChanged(formatted);
        }
      },
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
                      PopupMenuButton<_EnrollmentActionStatus>(
                        tooltip: '관리',
                        enabled: !_isUpdatingEnrollmentStatus,
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Color(0xFF9CA3AF),
                        ),
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
                            value: _EnrollmentActionStatus.enabled,
                            child: Text('상태: ENABLED'),
                          ),
                          PopupMenuItem(
                            value: _EnrollmentActionStatus.banned,
                            child: Text('상태: BANNED'),
                          ),
                          PopupMenuDivider(),
                          PopupMenuItem(
                            value: _EnrollmentActionStatus.deleted,
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
                    '대상: ${enrollment.username ?? enrollment.userId}',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '변경 상태: ${switch (status) {
                      _EnrollmentActionStatus.enabled => 'ENABLED',
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
                  _EnrollmentActionStatus.enabled => EnrollmentStatus.enabled,
                  _EnrollmentActionStatus.banned => EnrollmentStatus.banned,
                  _EnrollmentActionStatus.deleted => throw UnimplementedError(
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
}

class _AssignmentsTab extends ConsumerStatefulWidget {
  const _AssignmentsTab({
    required this.course,
    required this.isLoading,
    this.assignments,
  });

  final CourseSummary course;
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

  List<String> _learningGoals = [''];
  String _language = 'kotlin';

  List<String> _requirements = [''];
  final List<_TestCaseData> _testCases = [_TestCaseData()];




  // Code Templates
  final List<_CodeTemplateData> _codeTemplates = [];

  late TextEditingController _startAtController;
  late TextEditingController _endAtController;

  @override
  void initState() {
    super.initState();
    _startAtController = TextEditingController();
    _endAtController = TextEditingController();

    // Initialize based on track
    final track = widget.course.targetTrack.toUpperCase();
    if (track == 'SP') {
      _language = 'KOTLIN';
      final defaults = _CodeTemplateData.getDefaultTemplates('KOTLIN');
      _codeTemplates.add(_CodeTemplateData(
        language: 'KOTLIN',
        codeTemplate: defaults['code'],
      ));
    } else if (track == 'FL') {
      _language = 'DART';
      final defaults = _CodeTemplateData.getDefaultTemplates('DART');
      _codeTemplates.add(_CodeTemplateData(
        language: 'DART',
        codeTemplate: defaults['code'],
      ));
    } else {
      _language = 'KOTLIN'; // fallback
      _codeTemplates.addAll([
        _CodeTemplateData(
          language: 'KOTLIN',
          codeTemplate: _CodeTemplateData.getDefaultTemplates('KOTLIN')['code'],
        ),
        _CodeTemplateData(
          language: 'DART',
          codeTemplate: _CodeTemplateData.getDefaultTemplates('DART')['code'],
        ),
        _CodeTemplateData(
          language: 'PYTHON',
          codeTemplate: _CodeTemplateData.getDefaultTemplates('PYTHON')['code'],
        ),
      ]);
    }

  }

  @override
  void dispose() {
    _startAtController.dispose();
    _endAtController.dispose();
    for (var t in _codeTemplates) {
      t.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDateTime(bool isStart) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );

    if (pickedTime == null) return;

    final DateTime fullDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      final offset = fullDateTime.timeZoneOffset;
      final hours = offset.inHours.abs().toString().padLeft(2, '0');
      final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
      final sign = offset.isNegative ? '-' : '+';
      final formattedIso =
          '${fullDateTime.toIso8601String().split('.').first}$sign$hours:$minutes';

      if (isStart) {
        _startAt = formattedIso;
        _startAtController.text = _formatFullDateTime(fullDateTime);
      } else {
        _endAt = formattedIso;
        _endAtController.text = _formatFullDateTime(fullDateTime);
      }
    });
  }

  String _formatFullDateTime(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                                          courseSlug: widget.course.slug,
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
                                    barrierDismissible: false,
                                    builder: (context) => EditAssignmentDialog(
                                      courseSlug: widget.course.slug,
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
                                                        widget.course.slug,
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
                    controller: _startAtController,
                    readOnly: true,
                    onTap: () => _selectDateTime(true),
                    decoration: const InputDecoration(
                      labelText: '시작일시 (달력에서 선택)',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.calendar_today, size: 20),
                    ),
                    onSaved: (v) => _startAt = _startAt.trim(),
                    validator: (v) =>
                        v == null || v.isEmpty ? '시작일시를 선택해주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _endAtController,
                    readOnly: true,
                    onTap: () => _selectDateTime(false),
                    decoration: const InputDecoration(
                      labelText: '종료일시 (달력에서 선택)',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.calendar_today, size: 20),
                    ),
                    onSaved: (v) => _endAt = _endAt.trim(),
                    validator: (v) =>
                        v == null || v.isEmpty ? '종료일시를 선택해주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Text(
                    '메타데이터 및 제약사항',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  // Disabled language input if track is set
                  if (widget.course.targetTrack.toUpperCase() == 'SP' || widget.course.targetTrack.toUpperCase() == 'FL')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Text(
                        '사용 언어: $_language',
                        style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xFF64748B)),
                      ),
                    )
                  else
                    Row(
                      children: [
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
                  const SizedBox(height: 12),
                  _buildDynamicFieldSection(
                    title: '학습 목표',
                    items: _learningGoals,
                    onAdd: () => setState(() => _learningGoals.add('')),
                    onRemove: (index) =>
                        setState(() => _learningGoals.removeAt(index)),
                    onChanged: (index, value) =>
                        _learningGoals[index] = value,
                    label: '학습 목표',
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  _buildDynamicFieldSection(
                    title: '요구사항 (Requirements)',
                    items: _requirements,
                    onAdd: () => setState(() => _requirements.add('')),
                    onRemove: (index) =>
                        setState(() => _requirements.removeAt(index)),
                    onChanged: (index, value) =>
                        _requirements[index] = value,
                    label: '요구사항',
                  ),
                  const SizedBox(height: 12),
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
                            _testCases.add(_TestCaseData());
                          });
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('테스트케이스 추가'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._testCases.asMap().entries.map((entry) {
                    final index = entry.key;
                    final testCase = entry.value;
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
                                '테스트케이스 ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              if (_testCases.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _testCases.removeAt(index);
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '입력값 (Inputs)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...testCase.inputs.asMap().entries.map((inputEntry) {
                            final inputIndex = inputEntry.key;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: inputEntry.value,
                                      decoration: InputDecoration(
                                        labelText: '입력 ${inputIndex + 1}',
                                        filled: true,
                                        fillColor: const Color(0xFFFAFAFA),
                                        isDense: true,
                                      ),
                                      onChanged: (v) => testCase.inputs[inputIndex] = v,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 20),
                                    onPressed: () {
                                      setState(() {
                                        testCase.inputs.removeAt(inputIndex);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                testCase.inputs.add('');
                              });
                            },
                            icon: const Icon(Icons.add, size: 16),
                            label: const Text('입력값 추가', style: TextStyle(fontSize: 12)),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: testCase.output,
                            decoration: const InputDecoration(
                              labelText: '출력 (Output)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              hintText: '+1',
                            ),
                            maxLines: 2,
                            onSaved: (v) => testCase.output = v?.trim() ?? '',
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            initialValue: testCase.visibility,
                            decoration: const InputDecoration(
                              labelText: '공개 여부 (Visibility)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'PUBLIC',
                                child: Text('PUBLIC'),
                              ),
                              DropdownMenuItem(
                                value: 'PRIVATE',
                                child: Text('PRIVATE'),
                              ),
                            ],
                            onChanged: (v) {
                              if (v != null) testCase.visibility = v;
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '코드 템플릿 (Code Templates)',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _codeTemplates.add(
                              _CodeTemplateData(
                                language: 'KOTLIN',
                                codeTemplate: _CodeTemplateData.getDefaultTemplates('KOTLIN')['code'],
                              ),
                            );
                          });
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('템플릿 추가'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._codeTemplates.asMap().entries.map((entry) {
                    final index = entry.key;
                    final template = entry.value;
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
                                '템플릿 ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              if (_codeTemplates.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      final removed = _codeTemplates.removeAt(
                                        index,
                                      );
                                      removed.dispose();
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            initialValue: template.language,
                            decoration: const InputDecoration(
                              labelText: '언어 (Language)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'KOTLIN',
                                child: Text('KOTLIN'),
                              ),
                              DropdownMenuItem(
                                value: 'DART',
                                child: Text('DART'),
                              ),
                              DropdownMenuItem(
                                value: 'PYTHON',
                                child: Text('PYTHON'),
                              ),
                            ],
                            onChanged: (v) {
                              if (v != null) {
                                setState(() {
                                  template.updateLanguage(v);
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          _buildPremiumCodeEditor(
                            label: '코드 템플릿',
                            controller: template.codeController,
                            language: template.language,
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();

                          final reqList = _requirements
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
                          final testCaseList = _testCases
                              .asMap()
                              .entries
                              .where(
                                (e) =>
                                    e.value.inputs.isNotEmpty ||
                                    e.value.output.isNotEmpty,
                              )
                              .map(
                                (e) => AssignmentTestCase(
                                  seq: e.key + 1,
                                  inputValues: e.value.inputs.map((input) {
                                    final trimmed = input.trim();
                                    if (trimmed.toLowerCase() == 'true') {
                                      return true;
                                    }
                                    if (trimmed.toLowerCase() == 'false') {
                                      return false;
                                    }
                                    final numVal = num.tryParse(trimmed);
                                    if (numVal != null) return numVal;
                                    return trimmed.replaceAll('\\n', '\n');
                                  }).toList(),
                                  outputText: e.value.output.replaceAll(
                                    '\\n',
                                    '\n',
                                  ),
                                  visibility: e.value.visibility,
                                ),
                              )
                              .toList();

                          final codeTemplateList = _codeTemplates
                              .where((e) => e.language.isNotEmpty)
                              .map(
                                (e) => CodeTemplate(
                                  language: e.language,
                                  functionTemplate: e.codeController.text.trim(),
                                ),
                              )
                              .toList();

                          ref
                              .read(tasksManagementBlocProvider.notifier)
                              .add(
                                TasksManagementCreateAssignmentRequested(
                                  courseSlug: widget.course.slug,
                                  request: CreateAssignmentRequest(
                                    weekNo: _weekNo,
                                    orderInWeek: _orderInWeek,
                                    startAt: _startAt,
                                    endAt: _endAt,
                                    metadata: AssignmentMetadata(
                                      title: _title,
                                      description: _description,
                                      difficulty: _difficulty,
                                      learningGoals: _learningGoals
                                          .where((e) => e.trim().isNotEmpty)
                                          .toList()
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => LearningGoal(
                                              sortOrder: e.key + 1,
                                              learningGoalText: e.value.trim(),
                                            ),
                                          )
                                          .toList(),
                                      requirements: reqList,
                                      testCases: testCaseList,
                                      codeTemplates: codeTemplateList,
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
                          setState(() {
                            for (var t in _codeTemplates) {
                              t.updateControllers();
                            }
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

  Widget _buildPremiumCodeEditor({
    required String label,
    required CodeController controller,
    required String language,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF334155), width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    _buildDot(const Color(0xFFFF5F56)),
                    const SizedBox(width: 8),
                    _buildDot(const Color(0xFFFFBD2E)),
                    const SizedBox(width: 8),
                    _buildDot(const Color(0xFF27C93F)),
                    const SizedBox(width: 16),
                    Text(
                      '${language[0] + language.substring(1).toLowerCase()} Editor',
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'monospace',
                      ),
                    ),
                  ],
                ),
              ),
              // Code Area
              CodeTheme(
                data: CodeThemeData(styles: atomOneDarkTheme),
                child: CodeField(
                  controller: controller,
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'monospace',
                    height: 1.5,
                  ),
                  lineNumberStyle: const LineNumberStyle(
                    width: 45,
                    margin: 16,
                    textStyle: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                  decoration: const BoxDecoration(color: Color(0xFF0F172A)),
                  maxLines: null,
                  minLines: 5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
  Widget _buildDynamicFieldSection({
    required String title,
    required List<String> items,
    required VoidCallback onAdd,
    required Function(int) onRemove,
    required Function(int, String) onChanged,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            TextButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 18),
              label: Text('$label 추가'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: entry.value,
                    decoration: InputDecoration(
                      labelText: '$label ${index + 1}',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (v) => onChanged(index, v),
                  ),
                ),
                if (items.length > 1)
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () => onRemove(index),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _TestCaseData {
  List<String> inputs;
  String output;
  String visibility;

  _TestCaseData({
    List<String>? inputs,
    String? output,
    String? visibility,
  })  : inputs = inputs ?? [],
        output = output ?? '',
        visibility = visibility ?? 'PUBLIC';
}

class _CodeTemplateData {
  String language;
  late final CodeController codeController;

  _CodeTemplateData({
    this.language = 'KOTLIN',
    String? codeTemplate,
  }) {
    codeController = CodeController(
      text: (codeTemplate ?? '').replaceAll('\\n', '\n'),
      language: _getLanguage(language),
    );
  }

  void dispose() {
    codeController.dispose();
  }

  void updateContent(String code) {
    codeController.text = code.replaceAll('\\n', '\n');
  }

  void updateControllers() {
    codeController.language = _getLanguage(language);
  }

  void updateLanguage(String lang) {
    language = lang;
    codeController.language = _getLanguage(lang);

    // Automatically update to default template for the new language
    final defaults = getDefaultTemplates(lang);
    updateContent(defaults['code']!);
  }

  static Map<String, String> getDefaultTemplates(String lang) {
    switch (lang.toUpperCase()) {
      case 'KOTLIN':
        return {
          'code':
              "/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/\nfun solution(): String {\n    var answer = \"\"\n    return answer\n}",
        };
      case 'DART':
        return {
          'code':
              "/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/\n\nString solution() {\n  String answer = '';\n  return answer;\n}",
        };
      case 'PYTHON':
        return {
          'code':
              "'''\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n'''\n\ndef solution():\n    answer = ''\n    return answer",
        };
      default:
        return {'code': ''};
    }
  }

  dynamic _getLanguage(String lang) {
    switch (lang.toUpperCase()) {
      case 'KOTLIN':
        return kotlin;
      case 'DART':
        return dart;
      case 'PYTHON':
        return python;
      default:
        return kotlin;
    }
  }
}
