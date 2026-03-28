import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

import 'task_management.dart';
import 'views/enrollments_view.dart';
import 'views/assignments_view.dart';
import 'widgets/date_picker_field_inline.dart';
import 'widgets/metadata_chip.dart';

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
                      Row(
                        children: [
                          Flexible(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 8,
                              runSpacing: 4,
                              children: [
                                Text(
                                  widget.course.metadata.title,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: -0.8,
                                  ),
                                ),
                                MetadataChip(
                                  label: widget.course.metadata.phase,
                                  color: Colors.blue[700]!,
                                  backgroundColor: Colors.blue[50]!,
                                ),
                                MetadataChip(
                                  label: widget.course.targetTrack,
                                  color: Colors.orange[700]!,
                                  backgroundColor: Colors.orange[50]!,
                                ),
                                MetadataChip(
                                  label: widget.course.status,
                                  color: Colors.purple[700]!,
                                  backgroundColor: Colors.purple[50]!,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_rounded,
                            size: 14,
                            color: Color(0xFF8A8A8A),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${widget.course.startDate ?? '미정'} ~ ${widget.course.endDate ?? '미정'}',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8A8A8A),
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            Icons.link_rounded,
                            size: 14,
                            color: Color(0xFF8A8A8A),
                          ),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              widget.course.slug,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF8A8A8A),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '생성: ${widget.course.createdAt?.toLocal().toString().split('.').first ?? '-'}  |  '
                        '수정: ${widget.course.updatedAt?.toLocal().toString().split('.').first ?? '-'}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFB0B0B0),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (widget.course.metadata.attributes.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          '속성: ${widget.course.metadata.attributes}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF8A8A8A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      if (widget.course.metadata.description?.isNotEmpty ??
                          false) ...[
                        const SizedBox(height: 12),
                        Text(
                          widget.course.metadata.description!,
                          style: const TextStyle(
                            fontSize: 15,
                            color: Color(0xFF555555),
                            height: 1.5,
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
                  EnrollmentsView(
                    courseSlug: widget.course.slug,
                    isLoading: state.isLoadingDetails,
                    enrollments: enrollments,
                  ),
                  AssignmentsView(
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
                            child: DatePickerFieldInline(
                              label: '시작일',
                              initialValue: startDate,
                              onChanged: (v) => startDate = v,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: DatePickerFieldInline(
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
