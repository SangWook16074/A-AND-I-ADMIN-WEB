import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

import 'task_management.dart';
import 'assignment_deliveries_dialog.dart';
import 'assignment_details_dialog.dart';
import 'edit_assignment_dialog.dart';

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
  ConsumerState<_CourseDetailsBottomSheet> createState() => _CourseDetailsBottomSheetState();
}

class _CourseDetailsBottomSheetState extends ConsumerState<_CourseDetailsBottomSheet> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(tasksManagementBlocProvider, (previous, next) {
      if (previous?.lastDeliveryResult != next.lastDeliveryResult && next.lastDeliveryResult != null) {
        final result = next.lastDeliveryResult!;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('과제 배포 결과', style: TextStyle(fontWeight: FontWeight.w800)),
            content: Text(
              '총 대상자: ${result.targetCount}명\n배포 성공: ${result.deliveredCount}명\n배포 실패: ${result.failedCount}명',
              style: const TextStyle(height: 1.5),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('확인', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        );
      }

      if (previous?.isDeleting == true && next.isDeleting == false) {
        if (next.errorMessage == null) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('코스가 정상적으로 삭제되었습니다.')));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('코스 삭제 실패: ${next.errorMessage}')));
        }
      }

      // Update result listener
      if (previous?.isCreating == true && next.isCreating == false) {
        if (next.errorMessage != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('코스 수정 실패: ${next.errorMessage}')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('코스가 수정되었습니다.')),
          );
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
                          widget.course.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        if (widget.course.description != null) ...[
                          const SizedBox(height: 8),
                          Text(
                            widget.course.description!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF8A8A8A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit_outlined, color: Color(0xFF555555)),
                    onPressed: () {
                      _showEditCourseDialog(
                        context: context,
                        ref: ref,
                        course: widget.course,
                      );
                    },
                  ),
                  IconButton(
                    icon: state.isDeleting ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator(strokeWidth: 2)) : const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: state.isDeleting
                        ? null
                        : () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('코스 삭제', style: TextStyle(fontWeight: FontWeight.w800)),
                                content: const Text('정말로 이 코스를 삭제하시겠습니까?\n주차, 과제, 수강생 등의 모든 데이터가 함께 삭제되며 복구할 수 없습니다.', style: TextStyle(height: 1.5)),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(context).pop(),
                                    child: const Text('취소', style: TextStyle(color: Color(0xFF8A8A8A))),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      ref.read(tasksManagementBlocProvider.notifier).add(
                                        TasksManagementCourseDeletedRequested(courseSlug: widget.course.slug),
                                      );
                                    },
                                    child: const Text('삭제', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700)),
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
                  Tab(text: '주차 관리'),
                  Tab(text: '과제 관리'),
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _EnrollmentsTab(
                      isLoading: state.isLoadingDetails,
                      enrollments: enrollments,
                    ),
                    _WeeksTab(
                      courseSlug: widget.course.slug,
                    ),
                    _AssignmentsTab(
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
    String title = course.title;
    String description = course.description ?? '';
    String phase = course.phase;
    String fieldTag = course.targetTrack;
    String status = course.status;
    String startDate = course.startDate ?? '';
    String endDate = course.endDate ?? '';

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('코스 수정', style: TextStyle(fontWeight: FontWeight.w800)),
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
                            DropdownMenuItem(value: 'BASIC', child: Text('BASIC')),
                            DropdownMenuItem(value: 'CS', child: Text('CS')),
                            DropdownMenuItem(value: 'FRAMEWORK', child: Text('FRAMEWORK')),
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
                      DropdownMenuItem(value: 'PUBLISHED', child: Text('PUBLISHED')),
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

                ref.read(tasksManagementBlocProvider.notifier).add(
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

class _EnrollmentsTab extends StatelessWidget {
  const _EnrollmentsTab({
    required this.isLoading,
    required this.enrollments,
  });

  final bool isLoading;
  final List<Enrollment>? enrollments;

  @override
  Widget build(BuildContext context) {
    if (isLoading && enrollments == null) {
      return const Center(child: CircularProgressIndicator());
    }

    if (enrollments == null || enrollments!.isEmpty) {
      return const Center(
        child: Text(
          '등록된 수강생이 없습니다.',
          style: TextStyle(
            color: Color(0xFF8A8A8A),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 32),
      itemCount: enrollments!.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final enrollment = enrollments![index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFEAEAEA)),
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFFF0F0F0),
                child: Text(
                  enrollment.userId.substring(0, 1).toUpperCase(),
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
                        color: enrollment.status == 'ENROLLED' ? Colors.green[700] : const Color(0xFF8A8A8A),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _WeeksTab extends ConsumerStatefulWidget {
  const _WeeksTab({
    required this.courseSlug,
  });

  final String courseSlug;

  @override
  ConsumerState<_WeeksTab> createState() => _WeeksTabState();
}

class _WeeksTabState extends ConsumerState<_WeeksTab> {
  final _formKey = GlobalKey<FormState>();
  
  int _weekNo = 1;
  String _title = '';
  String _startDate = '';
  String _endDate = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Container(
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
                '새 주차(과제) 추가/수정',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '같은 주차 번호가 있으면 자동으로 갱신됩니다.',
                style: TextStyle(
                  fontSize: 13,
                  color: Color(0xFF8A8A8A),
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '주차 번호 (예: 1)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                keyboardType: TextInputType.number,
                onSaved: (value) => _weekNo = int.tryParse(value ?? '1') ?? 1,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) return '주차 번호를 입력해주세요.';
                  if (int.tryParse(value) == null) return '숫자만 입력 가능합니다.';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '주차 제목 (예: 1주차 - Kotlin 기본)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSaved: (value) => _title = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '제목을 입력해주세요.' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '시작일 (예: 2026-03-02)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSaved: (value) => _startDate = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '시작일을 입력해주세요.' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '종료일 (예: 2026-03-08)',
                  filled: true,
                  fillColor: Colors.white,
                ),
                onSaved: (value) => _endDate = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '종료일을 입력해주세요.' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      ref.read(tasksManagementBlocProvider.notifier).add(
                            TasksManagementCreateWeekRequested(
                              courseSlug: widget.courseSlug,
                              weekNo: _weekNo,
                              title: _title,
                              startDate: _startDate,
                              endDate: _endDate,
                            ),
                          );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('주차 생성(수정) 요청을 보냈습니다.')),
                      );
                      _formKey.currentState?.reset();
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF1A1A1A),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  child: const Text('주차 등록 / 갱신', style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AssignmentsTab extends ConsumerStatefulWidget {
  const _AssignmentsTab({
    required this.courseSlug,
    required this.isLoading,
    this.assignments,
  });

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // List existing assignments
          if (widget.isLoading && widget.assignments == null)
            const Center(child: Padding(
              padding: EdgeInsets.all(24.0),
              child: CircularProgressIndicator(),
            ))
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
                              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              assignment.status,
                              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
                              style: const TextStyle(color: Color(0xFF8A8A8A), fontSize: 13),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AssignmentDetailsDialog(
                                      courseSlug: widget.courseSlug,
                                      assignmentId: assignment.id,
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text('상세 보기', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
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
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text('수정', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('과제 삭제'),
                                      content: const Text('과제와 연관 데이터(요구사항/예시/배포)를 모두 삭제합니다. 계속하시겠습니까?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.of(context).pop(),
                                          child: const Text('취소', style: TextStyle(color: Colors.grey)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ref.read(tasksManagementBlocProvider.notifier).add(
                                              TasksManagementAssignmentDeletedRequested(
                                                courseSlug: widget.courseSlug,
                                                assignmentId: assignment.id,
                                              ),
                                            );
                                          },
                                          child: const Text('삭제', style: TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  minimumSize: Size.zero,
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text('삭제', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.red)),
                              ),
                              if (assignment.status == 'DRAFT')
                            TextButton(
                              onPressed: () {
                                ref.read(tasksManagementBlocProvider.notifier).add(
                                  TasksManagementPublishAssignmentRequested(
                                    courseSlug: widget.courseSlug,
                                    assignmentId: assignment.id,
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('과제 게시 요청을 보냈습니다.')));
                              },
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text('게시하기', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                            )
                          else if (assignment.status != 'DRAFT')
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ref.read(tasksManagementBlocProvider.notifier).add(
                                      TasksManagementDeliverAssignmentRequested(
                                        courseSlug: widget.courseSlug,
                                        assignmentId: assignment.id,
                                      ),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('과제 배포 요청을 보냈습니다.')));
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    foregroundColor: Colors.blue,
                                  ),
                                  child: const Text('배포하기', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AssignmentDeliveriesDialog(
                                        courseSlug: widget.courseSlug,
                                        assignmentId: assignment.id,
                                      ),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: const Text('배포 결과 보기', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700)),
                                ),
                              ],
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
                child: Text('등록된 과제가 없습니다.', style: TextStyle(color: Color(0xFF8A8A8A))),
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
                  const Text('새 과제 추가', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: '주차 (weekNo)', filled: true, fillColor: Colors.white),
                          keyboardType: TextInputType.number,
                          onSaved: (v) => _weekNo = int.tryParse(v ?? '1') ?? 1,
                          validator: (v) => v == null || v.isEmpty ? '필수' : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(labelText: '순서 (order)', filled: true, fillColor: Colors.white),
                          keyboardType: TextInputType.number,
                          onSaved: (v) => _orderInWeek = int.tryParse(v ?? '1') ?? 1,
                          validator: (v) => v == null || v.isEmpty ? '필수' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '과제 제목', filled: true, fillColor: Colors.white),
                    onSaved: (v) => _title = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '과제 설명', filled: true, fillColor: Colors.white),
                    maxLines: 3,
                    onSaved: (v) => _description = v?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _difficulty,
                    decoration: const InputDecoration(labelText: '난이도', filled: true, fillColor: Colors.white),
                    items: const [
                      DropdownMenuItem(value: 'LOW', child: Text('LOW')),
                      DropdownMenuItem(value: 'MID', child: Text('MID')),
                      DropdownMenuItem(value: 'HIGH', child: Text('HIGH')),
                    ],
                    onChanged: (v) => setState(() => _difficulty = v ?? 'MID'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '시작일시 (예: 2026-03-03T09:00:00+09:00)', filled: true, fillColor: Colors.white),
                    onSaved: (v) => _startAt = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(labelText: '종료일시 (예: 2026-03-11T08:59:59+09:00)', filled: true, fillColor: Colors.white),
                    onSaved: (v) => _endAt = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();
                          ref.read(tasksManagementBlocProvider.notifier).add(
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
                                ),
                              ),
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('과제 생성 요청을 보냈습니다.')));
                          _formKey.currentState?.reset();
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A1A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text('과제 등록', style: TextStyle(fontWeight: FontWeight.w700)),
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
