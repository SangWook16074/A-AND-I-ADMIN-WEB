import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'presentation/providers/tasks_provider.dart';

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
    final coursesAsync = ref.watch(coursesProvider);

    void showCreateCourseDialog() {
      final titleController = TextEditingController();
      final slugController = TextEditingController();
      final descController = TextEditingController();
      final phaseController = TextEditingController(text: 'BASIC');
      final trackController = TextEditingController(text: 'FL');

      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text('새 코스(과제 묶음) 생성'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: '제목 (예: Flutter 심화)',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: slugController,
                  decoration: const InputDecoration(
                    labelText: '고유 슬러그 (예: flutter-adv)',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: descController,
                  decoration: const InputDecoration(labelText: '간단한 설명'),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: phaseController,
                  decoration: const InputDecoration(
                    labelText: '단계 (예: BASIC, ADVANCED)',
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: trackController,
                  decoration: const InputDecoration(
                    labelText: '트랙 (예: FL, AL)',
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('취소'),
            ),
            FilledButton(
              onPressed: () {
                final slug = slugController.text.trim();
                final title = titleController.text.trim();
                if (slug.isEmpty || title.isEmpty) return;

                ref
                    .read(coursesNotifierProvider.notifier)
                    .createCourse(
                      slug: slug,
                      title: title,
                      description: descController.text.trim(),
                      phase: phaseController.text.trim(),
                      targetTrack: trackController.text.trim(),
                    );
                Navigator.pop(dialogContext);
              },
              child: const Text('생성'),
            ),
          ],
        ),
      );
    }

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
                    _CreateButton(onPressed: () => showCreateCourseDialog()),
                  ],
                )
              else
                Row(
                  children: [
                    _SearchField(width: searchWidth),
                    const SizedBox(width: 12),
                    _CreateButton(onPressed: () => showCreateCourseDialog()),
                  ],
                ),
              const SizedBox(height: 20),
              coursesAsync.when(
                data: (courses) {
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
                },
                loading: () => const SizedBox(
                  height: 220,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => SizedBox(
                  height: 220,
                  child: Center(child: Text('에러 발생: $error')),
                ),
              ),
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

class _CreateButton extends StatelessWidget {
  const _CreateButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressed,
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
