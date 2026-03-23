import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

class _OJManagementViewState extends ConsumerState<OJManagementView> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(ojManagementBlocProvider.notifier).onEvent(const OjManagementStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(ojManagementBlocProvider);
    final isLargerThan600 = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        title: const Text(
          'Online Judge 관리',
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
            onPressed: () => ref
                .read(ojManagementBlocProvider.notifier)
                .onEvent(const OjManagementRefreshRequested()),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: _buildBody(state, isLargerThan600),
    );
  }

  Widget _buildBody(OjManagementState state, bool isLargerThan600) {
    if (state.status == OjManagementStatus.loading && state.problemTestCases.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(color: Color(0xFF1A1A1A)),
      );
    }

    if (state.status == OjManagementStatus.failure) {
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
              state.errorMessage ?? '오류가 발생했습니다.',
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

    if (state.problemTestCases.isEmpty) {
      return const Center(
        child: Text(
          '등록된 테스트 케이스가 없습니다.',
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isLargerThan600 ? 32 : 16,
        vertical: 24,
      ),
      child: ListView.separated(
        itemCount: state.problemTestCases.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final problem = state.problemTestCases[index];
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
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
        },
      ),
    );
  }

  Widget _buildTestCaseItem(TestCase tc) {
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
                      text: 'Args: ${tc.args.join(', ')}\\nOutput: ${tc.expectedOutput}',
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('복사되었습니다.')),
                  );
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
          _buildCodeBlock(tc.args.toString()),
          const SizedBox(height: 12),
          const Text(
            'Expected Output:',
            style: TextStyle(
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

  Widget _buildCodeBlock(String code) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SelectableText(
        code,
        style: const TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'monospace',
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
