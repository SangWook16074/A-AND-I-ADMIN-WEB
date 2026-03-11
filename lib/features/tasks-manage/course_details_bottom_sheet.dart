import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

import 'task_management.dart';

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
                      Text(
                        '난이도: ${assignment.metadata.difficulty} | 기한: ${assignment.startAt.split('T').first} ~ ${assignment.endAt.split('T').first}',
                        style: const TextStyle(color: Color(0xFF8A8A8A), fontSize: 13),
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
                    value: _difficulty,
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
