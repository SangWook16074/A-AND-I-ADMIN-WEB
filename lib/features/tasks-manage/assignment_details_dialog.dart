import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
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
                      if (assignment.metadata.testCases.isNotEmpty) ...[
                        const Text(
                          '테스트케이스',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        ...assignment.metadata.testCases.map(
                          (ex) => Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Order: ${ex.seq}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 2,
                                      ),
                                      decoration: BoxDecoration(
                                        color: ex.visibility == TestCaseVisibility.public
                                            ? Colors.blue.withValues(alpha: 0.1)
                                            : Colors.grey.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        ex.visibility.name.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: ex.visibility == TestCaseVisibility.public
                                              ? Colors.blue
                                              : Colors.grey,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (ex.inputValues.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Inputs (Parameters):',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: const Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: Text(
                                      ex.inputValues.join('\n'),
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                                if (ex.outputText != null &&
                                    ex.outputText!.isNotEmpty) ...[
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Output:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 4),
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: const Color(0xFFE2E8F0),
                                      ),
                                    ),
                                    child: Text(
                                      ex.outputText!,
                                      style: const TextStyle(
                                        fontFamily: 'monospace',
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                      if (assignment.metadata.codeTemplates.isNotEmpty) ...[
                        const Text(
                          '코드 템플릿',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 12),
                        ...assignment.metadata.codeTemplates.map((template) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1E293B),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Text(
                                        template.language,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                if ((template.codeTemplate ?? '').isNotEmpty ||
                                    (template.commentTemplate ?? '')
                                        .isNotEmpty ||
                                    (template.functionTemplate ?? '')
                                        .isNotEmpty) ...[
                                  _buildReadOnlyCodeField(
                                    label: 'Code Template',
                                    code: (template.codeTemplate?.isNotEmpty ??
                                            false)
                                        ? template.codeTemplate!
                                            .replaceAll('\\n', '\n')
                                        : '${(template.commentTemplate ?? '').replaceAll('\\n', '\n')}\n${(template.functionTemplate ?? '').replaceAll('\\n', '\n')}'
                                              .trim(),
                                    language: template.language,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                                if (template.runnableTemplate != null &&
                                    template.runnableTemplate!.isNotEmpty) ...[
                                  _buildReadOnlyCodeField(
                                    label: 'Runnable Template',
                                    code: template.runnableTemplate!,
                                    language: template.language,
                                  ),
                                ],
                                const Divider(height: 48),
                              ],
                            ),
                          );
                        }),
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

  Widget _buildReadOnlyCodeField({
    required String label,
    required String code,
    required String language,
  }) {
    final cleanCode = code.replaceAll('\\n', '\n');
    final lines = cleanCode.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF0F172A),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xFF334155)),
          ),
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: Row(
                  children: [
                    _buildDot(const Color(0xFFEF4444)),
                    const SizedBox(width: 5),
                    _buildDot(const Color(0xFFF59E0B)),
                    const SizedBox(width: 5),
                    _buildDot(const Color(0xFF10B981)),
                  ],
                ),
              ),
              // Body
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gutter
                  Container(
                    width: 35,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Color(0xFF334155)),
                      ),
                    ),
                    child: Column(
                      children: List.generate(
                        lines.length,
                        (i) => Text(
                          '${i + 1}',
                          style: const TextStyle(
                            color: Color(0xFF475569),
                            fontSize: 11,
                            fontFamily: 'monospace',
                            height: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Code
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: RichText(
                        text: _highlightCode(cleanCode, language),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  TextSpan _highlightCode(String code, String language) {
    final lang = language.toLowerCase();
    const keywords = {
      'python': [
        'def',
        'return',
        'if',
        'else',
        'elif',
        'for',
        'while',
        'import',
        'from',
        'as',
        'class',
        'try',
        'except',
        'pass',
        'print',
        'in',
        'is',
        'not',
      ],
      'kotlin': [
        'fun',
        'val',
        'var',
        'if',
        'else',
        'when',
        'for',
        'while',
        'return',
        'class',
        'interface',
        'object',
        'override',
        'import',
        'package',
        'void',
      ],
      'dart': [
        'void',
        'final',
        'var',
        'if',
        'else',
        'return',
        'class',
        'import',
        'package',
        'async',
        'await',
        'late',
        'dynamic',
        'static',
        'override',
      ],
    };

    final kwList = keywords[lang] ?? keywords['kotlin']!;
    final spans = <TextSpan>[];

    final combinedRegex = RegExp(
      r'(".*?")|'
      r"('.*?')|"
      r'(\/\/.*)|'
      r'(\/\*[\s\S]*?\*\/)|'
      r'(#.*)|'
      r'([a-zA-Z_][a-zA-Z0-9_]*)|'
      r'(\d+(\.\d*)?)|'
      r'([{}()\[\]])|'
      r'([+\-*/%=<>!&|^~,.:;])|'
      r'(\s+)',
    );

    final matches = combinedRegex.allMatches(code).toList();

    for (var i = 0; i < matches.length; i++) {
      final match = matches[i];
      final text = match.group(0)!;

      if (match.group(1) != null || match.group(2) != null) {
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFF86EFAC)),
          ),
        );
      } else if (match.group(3) != null ||
          match.group(4) != null ||
          match.group(5) != null) {
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontStyle: FontStyle.italic,
            ),
          ),
        );
      } else if (match.group(6) != null) {
        final word = match.group(6)!;
        if (kwList.contains(word)) {
          spans.add(
            TextSpan(
              text: text,
              style: const TextStyle(
                color: Color(0xFFC084FC),
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        } else if (i + 1 < matches.length &&
            matches[i + 1].group(0)!.trim().startsWith('(')) {
          spans.add(
            TextSpan(
              text: text,
              style: const TextStyle(color: Color(0xFF60A5FA)),
            ),
          );
        } else {
          spans.add(
            TextSpan(
              text: text,
              style: const TextStyle(color: Color(0xFFE2E8F0)),
            ),
          );
        }
      } else if (match.group(7) != null) {
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFFFDE68A)),
          ),
        );
      } else if (match.group(9) != null || match.group(10) != null) {
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFF94A3B8)),
          ),
        );
      } else {
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFFE2E8F0)),
          ),
        );
      }
    }

    return TextSpan(
      children: spans,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'monospace',
        height: 1.5,
      ),
    );
  }
}
