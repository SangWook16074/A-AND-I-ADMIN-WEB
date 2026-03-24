import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/entities/problem_test_cases.dart';
import '../domain/entities/submission.dart';
import '../domain/entities/submission_test_case.dart';
import '../domain/entities/test_case.dart';
import '../presentation/bloc/oj_management_bloc.dart';
import '../presentation/bloc/oj_management_event.dart';
import '../presentation/bloc/oj_management_state.dart';

class OJManagementView extends ConsumerStatefulWidget {
  const OJManagementView({
    super.key,
    required this.showLogoutButton,
    required this.onLogout,
  });

  final bool showLogoutButton;
  final VoidCallback onLogout;

  @override
  ConsumerState<OJManagementView> createState() => _OJManagementViewState();
}

class _OJManagementViewState extends ConsumerState<OJManagementView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    Future.microtask(() {
      ref
          .read(ojManagementBlocProvider.notifier)
          .onEvent(const OjManagementStarted());
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ojManagementBlocProvider);
    final isLargerThan600 = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          '채점 서비스 관리',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Color(0xFF1A1A1A),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        actions: [
          if (widget.showLogoutButton)
            IconButton(
              icon: const Icon(Icons.logout_rounded),
              onPressed: widget.onLogout,
            ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              if (_tabController.index == 0) {
                ref
                    .read(ojManagementBlocProvider.notifier)
                    .onEvent(const OjManagementRefreshRequested());
              } else {
                ref
                    .read(ojManagementBlocProvider.notifier)
                    .onEvent(const OjManagementSubmissionsRefreshRequested());
              }
            },
          ),
          const SizedBox(width: 16),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: const Color(0xFF1A1A1A),
          unselectedLabelColor: const Color(0xFF6B7280),
          indicatorColor: const Color(0xFF1A1A1A),
          indicatorWeight: 3,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 14,
          ),
          tabs: const [
            Tab(text: '테스트 케이스'),
            Tab(text: '제출 내역'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTestCasesTab(state, isLargerThan600),
          _buildSubmissionsTab(state, isLargerThan600),
        ],
      ),
    );
  }

  Widget _buildTestCasesTab(OjManagementState state, bool isLargerThan600) {
    if (state.status == OjManagementStatus.loading &&
        state.problemTestCases.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF1A1A1A)),
      );
    }

    if (state.status == OjManagementStatus.failure &&
        state.problemTestCases.isEmpty) {
      return _buildErrorView(state.errorMessage);
    }

    if (state.problemTestCases.isEmpty) {
      return const Center(
        child: Text(
          '등록된 테스트 케이스가 없습니다.',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: isLargerThan600 ? 32 : 16,
        vertical: 24,
      ),
      itemCount: state.problemTestCases.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final problem = state.problemTestCases[index];
        return _buildProblemTestCaseCard(problem);
      },
    );
  }

  Widget _buildSubmissionsTab(OjManagementState state, bool isLargerThan600) {
    if (state.status == OjManagementStatus.loading &&
        state.submissions.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF1A1A1A)),
      );
    }

    if (state.status == OjManagementStatus.failure &&
        state.submissions.isEmpty) {
      return _buildErrorView(state.errorMessage);
    }

    if (state.submissions.isEmpty) {
      return const Center(
        child: Text(
          '최근 제출 내역이 없습니다.',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: isLargerThan600 ? 32 : 16,
        vertical: 24,
      ),
      itemCount: state.submissions.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final submission = state.submissions[index];
        return _buildSubmissionCard(submission);
      },
    );
  }

  Widget _buildErrorView(String? message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: Colors.redAccent,
            size: 48,
          ),
          const SizedBox(height: 16),
          Text(
            message ?? '오류가 발생했습니다.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => ref
                .read(ojManagementBlocProvider.notifier)
                .onEvent(const OjManagementRefreshRequested()),
            child: const Text('다시 시도'),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemTestCaseCard(ProblemTestCases problem) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1A1A),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.terminal_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    problem.problemId,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF111827),
                    ),
                  ),
                  Text(
                    '마지막 업데이트: ${problem.updatedAt.toLocal().toString().split('.').first}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '${problem.testCases.length} Cases',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2563EB),
                ),
              ),
            ),
          ],
        ),
        childrenPadding: const EdgeInsets.all(16),
        children: [
          const Divider(height: 1),
          const SizedBox(height: 16),
          ...problem.testCases.map((tc) => _buildTestCaseItem(tc)),
        ],
      ),
    );
  }

  Widget _buildSubmissionCard(Submission submission) {
    final statusColor = _getStatusColor(submission.status);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(color: Color(0xFFE5E7EB)),
      ),
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getStatusIcon(submission.status),
                color: statusColor,
                size: 20,
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
                        submission.submitterPublicCode,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF111827),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          submission.language,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Text(
                        submission.problemId,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF6B7280),
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '·',
                        style: TextStyle(color: Color(0xFFD1D5DB)),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        submission.createdAt
                            .toLocal()
                            .toString()
                            .split('.')
                            .first,
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                submission.status,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: statusColor,
                ),
              ),
            ),
          ],
        ),
        childrenPadding: const EdgeInsets.all(16),
        children: [
          const Divider(height: 1),
          const SizedBox(height: 16),
          _buildCodeSection(submission.code, submission.language),
          const SizedBox(height: 20),
          const Text(
            'Test Cases:',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 13,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 8),
          _buildSubmissionTestCasesTable(submission.testCases),
        ],
      ),
    );
  }

  Widget _buildCodeSection(String code, String language) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Submitted Code:',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 13,
                color: Color(0xFF374151),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.content_copy_rounded, size: 14),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: code));
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text('코드가 복사되었습니다.')));
              },
              constraints: const BoxConstraints(),
              padding: EdgeInsets.zero,
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Language Buttons (as decoration/context)
        Row(
          children: [
            _buildLangBadge('Kotlin', language == 'KOTLIN'),
            const SizedBox(width: 8),
            _buildLangBadge('Dart', language == 'DART'),
            const SizedBox(width: 8),
            _buildLangBadge('Python', language == 'PYTHON'),
          ],
        ),
        const SizedBox(height: 12),
        _buildPremiumCodeEditor(code, language),
      ],
    );
  }

  Widget _buildLangBadge(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFE2E8F0) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Colors.black : const Color(0xFFCBD5E1),
          width: isActive ? 1.5 : 1,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: isActive ? FontWeight.w800 : FontWeight.w600,
          color: isActive ? Colors.black : const Color(0xFF64748B),
        ),
      ),
    );
  }

  Widget _buildPremiumCodeEditor(String code, String language) {
    final lines = code.split('\n');
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                const Spacer(),
                const Text(
                  '템플릿',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          // Code Area
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Gutter
                Container(
                  width: 45,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0F172A),
                    border: Border(
                      right: BorderSide(color: Color(0xFF1E293B), width: 1.5),
                    ),
                  ),
                  child: Column(
                    children: List.generate(
                      lines.length,
                      (i) => Text(
                        '${i + 1}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF475569),
                          fontSize: 12,
                          fontFamily: 'monospace',
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
                // Editor
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SelectableText.rich(
                        _highlightCode(code, language),
                        style: const TextStyle(
                          fontSize: 13,
                          fontFamily: 'monospace',
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 12,
      height: 12,
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

    final kwList = keywords[lang] ?? keywords['python']!;
    final spans = <TextSpan>[];

    final combinedRegex = RegExp(
      r'(".*?")|'
      r"('.*?')|"
      r'(\/\/.*)|'
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
        // Strings
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFF86EFAC)),
          ),
        );
      } else if (match.group(3) != null || match.group(4) != null) {
        // Comments
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontStyle: FontStyle.italic,
            ),
          ),
        );
      } else if (match.group(5) != null) {
        // Words
        final word = match.group(5)!;
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
          // Basic function attempt: next non-whitespace token starts with '('
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
      } else if (match.group(6) != null) {
        // Numbers
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFFFDBA74)),
          ),
        );
      } else if (match.group(8) != null) {
        // Brackets
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFFCBD5E1)),
          ),
        );
      } else if (match.group(9) != null) {
        // Operators
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Color(0xFF94A3B8)),
          ),
        );
      } else {
        // Whitespace etc
        spans.add(
          TextSpan(
            text: text,
            style: const TextStyle(color: Colors.white),
          ),
        );
      }
    }

    if (spans.isEmpty && code.isNotEmpty) {
      spans.add(
        TextSpan(
          text: code,
          style: const TextStyle(color: Colors.white),
        ),
      );
    }

    return TextSpan(children: spans);
  }

  Widget _buildSubmissionTestCasesTable(List<SubmissionTestCase> testCases) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE5E7EB)),
      ),
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(60),
          1: FlexColumnWidth(2),
          2: FixedColumnWidth(80),
          3: FixedColumnWidth(100),
          4: FlexColumnWidth(4),
        },
        border: TableBorder.symmetric(
          inside: const BorderSide(color: Color(0xFFE5E7EB), width: 0.5),
        ),
        children: [
          // HEADER
          TableRow(
            decoration: const BoxDecoration(
              color: Color(0xFFF9FAFB), // Match light row color
            ),
            children: [
              _buildTableCell(
                'Case ID',
                isHeader: true,
                textColor: const Color(0xFF111827),
              ),
              _buildTableCell(
                'Status',
                isHeader: true,
                textColor: const Color(0xFF111827),
              ),
              _buildTableCell(
                'Time',
                isHeader: true,
                textColor: const Color(0xFF111827),
              ),
              _buildTableCell(
                'Memory',
                isHeader: true,
                textColor: const Color(0xFF111827),
              ),
              _buildTableCell(
                'Output / Error',
                isHeader: true,
                textColor: const Color(0xFF111827),
              ),
            ],
          ),
          // ROWS
          ...testCases.asMap().entries.map((entry) {
            final index = entry.key;
            final tc = entry.value;
            final color = _getStatusColor(tc.status);
            final isAlt = index % 2 == 1;

            return TableRow(
              decoration: BoxDecoration(
                color: isAlt ? const Color(0xFFF9FAFB) : Colors.white,
              ),
              children: [
                _buildTableCell(tc.caseId.toString()),
                _buildTableCell(
                  tc.status,
                  textColor: color,
                  fontWeight: FontWeight.w900,
                ),
                _buildTableCell(_formatDouble(tc.timeMs, ' ms')),
                _buildTableCell(
                  _formatDouble(tc.memoryMb, ' MB', precision: 9),
                ),
                _buildTableCell(
                  (tc.error != null && tc.error!.isNotEmpty)
                      ? tc.error!
                      : (tc.output ?? '-'),
                  isMonospace: true,
                  textColor: tc.error != null ? Colors.redAccent : null,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }

  String _formatDouble(double value, String suffix, {int? precision}) {
    double processed = value;
    if (precision != null) {
      // Round to given precision
      processed = double.parse(value.toStringAsFixed(precision));
    }

    if (processed == processed.toInt()) {
      return '${processed.toInt()}$suffix';
    }
    return '$processed$suffix';
  }

  Widget _buildTableCell(
    String text, {
    bool isHeader = false,
    Color? textColor,
    FontWeight? fontWeight,
    bool isMonospace = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Text(
        text,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: TextStyle(
          fontSize: isHeader ? 12 : 11,
          fontWeight: isHeader
              ? FontWeight.w900
              : (fontWeight ?? FontWeight.w600),
          color: isHeader
              ? const Color(0xFF4B5563)
              : (textColor ?? const Color(0xFF111827)),
          fontFamily: isMonospace ? 'monospace' : null,
        ),
      ),
    );
  }

  Widget _buildTestCaseItem(TestCase tc) {
    final List<String> argDisplays = [];
    for (int i = 0; i < tc.args.length; i++) {
      final type = i < tc.argTypes.length ? tc.argTypes[i] : 'UNKNOWN';
      argDisplays.add('${tc.args[i]} ($type)');
    }
    final String argsText = '[${argDisplays.join(', ')}]';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Case #${tc.caseId}',
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  color: Color(0xFF374151),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.content_copy_rounded, size: 16),
                onPressed: () {
                  Clipboard.setData(
                    ClipboardData(
                      text:
                          'Args: $argsText\nOutput: ${tc.expectedOutput} (${tc.expectedOutputType})',
                    ),
                  );
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text('복사되었습니다.')));
                },
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Arguments:',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 4),
          _buildCodeBlock(argsText),
          const SizedBox(height: 12),
          Text(
            'Expected Output (${tc.expectedOutputType}):',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF6B7280),
            ),
          ),
          const SizedBox(height: 4),
          _buildCodeBlock(tc.expectedOutput),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(dynamic code) {
    final String displayCode = code.toString();
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SelectableText(
        displayCode,
        style: const TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'monospace',
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case 'ACCEPTED':
      case 'PASSED':
        return Colors.green;
      case 'WRONG_ANSWER':
      case 'FAILED':
        return Colors.red;
      case 'TIME_LIMIT_EXCEEDED':
      case 'MEMORY_LIMIT_EXCEEDED':
        return Colors.orange;
      case 'COMPILING':
      case 'RUNNING':
      case 'PENDING':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toUpperCase()) {
      case 'ACCEPTED':
      case 'PASSED':
        return Icons.check_circle_rounded;
      case 'WRONG_ANSWER':
      case 'FAILED':
        return Icons.cancel_rounded;
      case 'TIME_LIMIT_EXCEEDED':
      case 'MEMORY_LIMIT_EXCEEDED':
        return Icons.timer_rounded;
      case 'COMPILING':
      case 'RUNNING':
      case 'PENDING':
        return Icons.sync_rounded;
      default:
        return Icons.help_outline_rounded;
    }
  }
}
