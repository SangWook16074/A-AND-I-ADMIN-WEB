import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/bloc/tasks_management_bloc.dart';
import 'presentation/bloc/tasks_management_event.dart';

class AssignmentDetailsDialog extends ConsumerStatefulWidget {
  final String courseSlug;
  final String assignmentId;

  const AssignmentDetailsDialog({
    super.key,
    required this.courseSlug,
    required this.assignmentId,
  });

  @override
  ConsumerState<AssignmentDetailsDialog> createState() =>
      _AssignmentDetailsDialogState();
}

class _AssignmentDetailsDialogState
    extends ConsumerState<AssignmentDetailsDialog> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tasksManagementBlocProvider.notifier)
          .add(
            TasksManagementAssignmentDetailsRequested(
              courseSlug: widget.courseSlug,
              assignmentId: widget.assignmentId,
            ),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tasksManagementBlocProvider);
    final isLoading = state.isLoadingDetails;
    final assignment = state.selectedAssignment;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '과제 상세 정보',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(),
                ),
              )
            else if (assignment != null && assignment.id == widget.assignmentId)
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('과제 ID', assignment.id),
                      _buildDetailRow(
                        '주차 / 순서',
                        '${assignment.weekNo}주차 / ${assignment.orderInWeek}번째',
                      ),
                      _buildDetailRow('제목', assignment.metadata.title),
                      _buildDetailRow('상태', assignment.status),
                      _buildDetailRow('난이도', assignment.metadata.difficulty),
                      _buildDetailRow('시작일', assignment.startAt),
                      _buildDetailRow('종료일', assignment.endAt),
                      if (assignment.publishedAt != null)
                        _buildDetailRow('배포일', assignment.publishedAt!),
                      const SizedBox(height: 16),
                      const Text(
                        '설명',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F9F9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(assignment.metadata.description ?? '설명 없음'),
                      ),
                      const SizedBox(height: 16),
                      if (assignment.metadata.learningGoals.isNotEmpty) ...[
                        const Text(
                          '학습 목표',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        ...assignment.metadata.learningGoals.map(
                          (goal) => Text('• ${goal.learningGoalText}'),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (assignment.metadata.requirements.isNotEmpty) ...[
                        const Text(
                          '요구사항',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        ...assignment.metadata.requirements.map(
                          (req) =>
                              Text('${req.sortOrder}. ${req.requirementText}'),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (assignment.metadata.examples.isNotEmpty) ...[
                        const Text(
                          '예시',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        ...assignment.metadata.examples.map(
                          (ex) => Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Seq: ${ex.seq}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                if (ex.description != null)
                                  Text('설명: ${ex.description}'),
                                if (ex.inputText != null) ...[
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Input:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(ex.inputText!),
                                ],
                                if (ex.outputText != null) ...[
                                  const SizedBox(height: 4),
                                  const Text(
                                    'Output:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(ex.outputText!),
                                ],
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (state.assignmentSubmissionConfig != null) ...[
                        const Divider(height: 32),
                        const Text(
                          '제출 가이드',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.blueAccent,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildDetailRow(
                          '가이드 제목',
                          state
                              .assignmentSubmissionConfig!
                              .submissionGuide
                              .title,
                        ),
                        const Text(
                          '가이드 설명',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: const Color(0xFFE3F2FD),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            state
                                .assignmentSubmissionConfig!
                                .submissionGuide
                                .description,
                          ),
                        ),
                        if (state
                            .assignmentSubmissionConfig!
                            .submissionGuide
                            .commentSections
                            .isNotEmpty) ...[
                          const SizedBox(height: 12),
                          const Text(
                            '주석 섹션',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          Wrap(
                            spacing: 8,
                            children: state
                                .assignmentSubmissionConfig!
                                .submissionGuide
                                .commentSections
                                .map(
                                  (section) => Chip(
                                    label: Text(section),
                                    backgroundColor: Colors.blue.shade50,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                        const SizedBox(height: 24),
                        const Text(
                          '코드 템플릿',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.deepPurpleAccent,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...state.assignmentSubmissionConfig!.codeTemplates.map(
                          (template) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.deepPurple.shade100,
                              ),
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.code,
                                      color: Colors.deepPurple,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      template.language.toUpperCase(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 16,
                                        color: Colors.deepPurple,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                _buildCodeBlock(
                                  '주석 템플릿',
                                  template.commentTemplate,
                                ),
                                _buildCodeBlock(
                                  '함수 템플릿',
                                  template.functionTemplate,
                                ),
                                _buildCodeBlock(
                                  '실행 템플릿',
                                  template.runnableTemplate,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              )
            else
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text('과제 정보를 불러올 수 없습니다.'),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCodeBlock(String label, String code) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFF2D2D2D),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            code,
            style: const TextStyle(
              color: Color(0xFFF8F8F2),
              fontFamily: 'monospace',
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF8A8A8A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
