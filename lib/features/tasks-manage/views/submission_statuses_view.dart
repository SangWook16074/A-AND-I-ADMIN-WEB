import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../task_management.dart';

class SubmissionStatusesView extends ConsumerStatefulWidget {
  const SubmissionStatusesView({
    super.key,
    required this.course,
    required this.isLoadingAssignments,
    this.assignments,
    this.statuses,
    required this.isLoadingStatuses,
    this.errorMessage,
  });

  final CourseSummary course;
  final bool isLoadingAssignments;
  final List<Assignment>? assignments;
  final AssignmentSubmissionStatuses? statuses;
  final bool isLoadingStatuses;
  final String? errorMessage;

  @override
  ConsumerState<SubmissionStatusesView> createState() =>
      _SubmissionStatusesViewState();
}

class _SubmissionStatusesViewState
    extends ConsumerState<SubmissionStatusesView> {
  String? _selectedAssignmentId;

  @override
  void initState() {
    super.initState();
    _syncSelectionWithAssignments();
  }

  @override
  void didUpdateWidget(covariant SubmissionStatusesView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.assignments != widget.assignments) {
      _syncSelectionWithAssignments();
    }
  }

  void _syncSelectionWithAssignments() {
    final assignments = widget.assignments;
    if (assignments == null || assignments.isEmpty) {
      _selectedAssignmentId = null;
      return;
    }

    final hasSelection = assignments.any((a) => a.id == _selectedAssignmentId);
    if (!hasSelection) {
      _selectedAssignmentId = assignments.first.id;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _selectedAssignmentId == null) return;
        ref
            .read(tasksManagementBlocProvider.notifier)
            .add(
              TasksManagementAssignmentSubmissionStatusesRequested(
                courseSlug: widget.course.slug,
                assignmentId: _selectedAssignmentId!,
              ),
            );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final assignments = widget.assignments;

    if (widget.isLoadingAssignments &&
        (assignments == null || assignments.isEmpty)) {
      return const Center(child: CircularProgressIndicator());
    }

    if (assignments == null || assignments.isEmpty) {
      return const Center(
        child: Text(
          '제출 현황을 확인할 과제가 없습니다.',
          style: TextStyle(color: Color(0xFF90A1B9), fontSize: 14),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(32, 28, 32, 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildAssignmentSelector(assignments),
          const SizedBox(height: 20),
          if (widget.isLoadingStatuses)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24),
                child: CircularProgressIndicator(),
              ),
            )
          else if (widget.statuses != null) ...[
            _buildSummaryCards(widget.statuses!),
            const SizedBox(height: 20),
            _buildStatusList(widget.statuses!),
          ] else
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  widget.errorMessage ?? '제출 현황을 불러오지 못했습니다.',
                  style: const TextStyle(
                    color: Color(0xFF90A1B9),
                    fontSize: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAssignmentSelector(List<Assignment> assignments) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '과제 선택',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xFF314158),
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            initialValue: _selectedAssignmentId,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFCAD5E2)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFCAD5E2)),
              ),
            ),
            items: assignments
                .map(
                  (assignment) => DropdownMenuItem<String>(
                    value: assignment.id,
                    child: Text(
                      '${assignment.weekNo}주차 · ${assignment.metadata.title}',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) return;
              setState(() => _selectedAssignmentId = value);
              ref
                  .read(tasksManagementBlocProvider.notifier)
                  .add(
                    TasksManagementAssignmentSubmissionStatusesRequested(
                      courseSlug: widget.course.slug,
                      assignmentId: value,
                    ),
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(AssignmentSubmissionStatuses statuses) {
    return Row(
      children: [
        Expanded(
          child: _SummaryCard(
            label: '총 수강생',
            value: statuses.totalEnrolled.toString(),
            color: const Color(0xFF155DFC),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _SummaryCard(
            label: '제출 완료',
            value: statuses.submittedCount.toString(),
            color: const Color(0xFF16A34A),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _SummaryCard(
            label: '미제출',
            value: statuses.notSubmittedCount.toString(),
            color: const Color(0xFFDC2626),
          ),
        ),
      ],
    );
  }

  Widget _buildStatusList(AssignmentSubmissionStatuses statuses) {
    if (statuses.items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            '표시할 제출 현황이 없습니다.',
            style: TextStyle(color: Color(0xFF90A1B9), fontSize: 14),
          ),
        ),
      );
    }

    return Column(
      children: statuses.items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _SubmissionStatusCard(item: item),
            ),
          )
          .toList(),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: Color(0xFF62748E),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _SubmissionStatusCard extends StatelessWidget {
  const _SubmissionStatusCard({required this.item});

  final AssignmentSubmissionStatusItem item;

  @override
  Widget build(BuildContext context) {
    final submittedColor = item.submitted
        ? const Color(0xFF16A34A)
        : const Color(0xFFDC2626);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.publicCode ?? '-',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.username ?? item.userId,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: submittedColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    item.submitted ? '제출 완료' : '미제출',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: submittedColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _MetricChip(label: '수강 상태', value: item.enrollmentStatus),
                _MetricChip(label: '점수', value: item.score?.toString() ?? '-'),
                _MetricChip(
                  label: '통과',
                  value: item.passedCases == null || item.totalCases == null
                      ? '-'
                      : '${item.passedCases}/${item.totalCases}',
                ),
                _MetricChip(
                  label: '완료 시각',
                  value: item.completedAt == null
                      ? '-'
                      : item.completedAt!.toLocal().toString().split('.').first,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF62748E),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF0F172B),
            ),
          ),
        ],
      ),
    );
  }
}
