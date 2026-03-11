import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'task_management.dart';

class TaskManagementView extends ConsumerWidget {
  const TaskManagementView({
    super.key,
    required this.showLogoutButton,
    this.onLogout,
  });

  final bool showLogoutButton;
  final VoidCallback? onLogout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocState = ref.watch(tasksManagementBlocProvider);
    final courses = blocState.courses;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 600;
          final searchWidth = isMobile ? constraints.maxWidth : 400.0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '과제 관리',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.8,
                  color: Color(0xFF1A1A1A),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                '플랫폼의 모든 과제를 관리하고 새로운 과제를 등록합니다.',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8A8A8A),
                ),
              ),
              const SizedBox(height: 32),
              if (isMobile)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchField(width: searchWidth),
                    const SizedBox(height: 12),
                    const _CreateButton(),
                  ],
                )
              else
                Row(
                  children: [
                    _SearchField(width: searchWidth),
                    const SizedBox(width: 12),
                    const _CreateButton(),
                  ],
                ),
              const SizedBox(height: 20),
              () {
                switch (blocState.status) {
                  case TasksManagementStatus.initial:
                  case TasksManagementStatus.loading:
                    return const SizedBox(
                      height: 220,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  case TasksManagementStatus.failure:
                    return SizedBox(
                      height: 220,
                      child: Center(child: Text('에러 발생: ${blocState.errorMessage}')),
                    );
                  case TasksManagementStatus.success:
                    if (courses.isEmpty) {
                      return const SizedBox(
                        height: 220,
                        child: Center(
                          child: Text(
                            '등록된 과제가 없습니다.',
                            style: TextStyle(
                              color: Color(0xFF8A8A8A),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: courses.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 8),
                      itemBuilder: (context, index) {
                        final course = courses[index];
                        return ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(color: Color(0xFFEAEAEA)),
                          ),
                          title: Text(
                            course.title,
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(course.description ?? '설명 없음'),
                          trailing: const Icon(Icons.chevron_right_rounded),
                          onTap: () {},
                        );
                      },
                    );
                }
              }(),
              const SizedBox(height: 48),
              const Divider(color: Color(0xFFF0F0F0)),
              const SizedBox(height: 18),
              const Center(
                child: Text(
                  '© 2026 A&I. All rights reserved.',
                  style: TextStyle(
                    fontSize: 10,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFB0B0B0),
                  ),
                ),
              ),
              if (showLogoutButton) ...[
                const SizedBox(height: 16),
                Center(
                  child: TextButton.icon(
                    onPressed: onLogout,
                    icon: const Icon(Icons.logout_rounded, size: 18),
                    label: const Text('로그아웃'),
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextField(
        decoration: InputDecoration(
          hintText: '과제 제목 또는 내용으로 검색...',
          prefixIcon: const Icon(Icons.search_rounded),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEAEAEA)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEAEAEA)),
          ),
        ),
      ),
    );
  }
}

class _CreateButton extends ConsumerWidget {
  const _CreateButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.icon(
      onPressed: () => _showCreateCourseDialog(context, ref),
      style: FilledButton.styleFrom(
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      icon: const Icon(Icons.add_rounded),
      label: const Text('과제 생성', style: TextStyle(fontWeight: FontWeight.w800)),
    );
  }
}

void _showCreateCourseDialog(BuildContext context, WidgetRef ref) {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String slug = '';
  String description = '';
  String phase = 'BASIC';
  String targetTrack = 'FL';
  String startDate = '';
  String endDate = '';

  showDialog(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: const Text('새 코스(과제 묶음) 생성'),
      content: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '제목 (예: Flutter 심화)',
                ),
                onSaved: (value) => title = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '제목을 입력해주세요.' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '고유 슬러그 (예: flutter-adv)',
                ),
                onSaved: (value) => slug = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '슬러그를 입력해주세요.' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(labelText: '간단한 설명'),
                onSaved: (value) => description = value?.trim() ?? '',
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: phase,
                decoration: const InputDecoration(
                  labelText: '단계 (예: BASIC, ADVANCED)',
                ),
                onSaved: (value) => phase = value?.trim() ?? 'BASIC',
              ),
              const SizedBox(height: 8),
              TextFormField(
                initialValue: targetTrack,
                decoration: const InputDecoration(
                  labelText: '트랙 (예: FL, AL)',
                ),
                onSaved: (value) => targetTrack = value?.trim() ?? 'FL',
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '시작일 (예: 2026-03-02)',
                ),
                onSaved: (value) => startDate = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '시작일을 입력해주세요.' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '종료일 (예: 2026-03-30)',
                ),
                onSaved: (value) => endDate = value?.trim() ?? '',
                validator: (value) =>
                    (value == null || value.trim().isEmpty) ? '종료일을 입력해주세요.' : null,
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: const Text('취소'),
        ),
        FilledButton(
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              formKey.currentState?.save();

              ref.read(tasksManagementBlocProvider.notifier).add(
                    TasksManagementCreateCourseRequested(
                      slug: slug,
                      title: title,
                      description: description.isEmpty ? null : description,
                      phase: phase,
                      targetTrack: targetTrack,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                  );
              Navigator.pop(dialogContext);
            }
          },
          child: const Text('생성'),
        ),
      ],
    ),
  );
}
