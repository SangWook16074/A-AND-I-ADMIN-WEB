import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/kotlin.dart';
import 'package:highlight/languages/python.dart';

// ─── 디자인 토큰 ────────────────────────────────────────────────────────────────
class _D {
  static const textPrimary = Color(0xFF0F172B);
  static const textSub = Color(0xFF64748B);
  static const textLight = Color(0xFF94A3B8);
  static const accentBlue = Color(0xFF155DFC);
  static const sectionBg = Color(0xFFF8FAFC);
  static const sectionBorder = Color(0xFFE2E8F0);
}

// ─── 유틸리티 ──────────────────────────────────────────────────────────────────
void showAssignmentDetailsDialog(
  BuildContext context,
  Assignment assignment,
  String courseSlug,
) {
  showDialog(
    context: context,
    builder: (ctx) => AssignmentDetailsDialog(
      assignment: assignment,
      courseSlug: courseSlug,
    ),
  );
}

// ─── 메인 다이얼로그 ─────────────────────────────────────────────────────────────
class AssignmentDetailsDialog extends ConsumerWidget {
  final Assignment assignment;
  final String courseSlug;

  const AssignmentDetailsDialog({
    super.key,
    required this.assignment,
    required this.courseSlug,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meta = assignment.metadata;

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: 680,
        height: 720,
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 헤더: 제목 + 배지
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${assignment.weekNo}주차 과제 상세',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: _D.accentBlue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        meta.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: _D.textPrimary,
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
                _StatusBadge(status: assignment.status),
              ],
            ),
            const SizedBox(height: 20),

            // 요약 정보 (난이도, 기간)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _D.sectionBg,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _D.sectionBorder),
              ),
              child: Row(
                children: [
                  _SummaryItem(
                    icon: Icons.speed_rounded,
                    label: '난이도',
                    value: meta.difficulty,
                  ),
                  _divider(),
                  _SummaryItem(
                    icon: Icons.calendar_today_rounded,
                    label: '시작',
                    value: _pruneOffset(assignment.startAt),
                  ),
                  _divider(),
                  _SummaryItem(
                    icon: Icons.event_available_rounded,
                    label: '마감',
                    value: _pruneOffset(assignment.endAt),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 스크롤 영역
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SectionTitle(title: '과제 설명'),
                    Text(
                      meta.description ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        color: _D.textSub,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),

                    if (meta.learningGoals.isNotEmpty) ...[
                      _SectionTitle(title: '학습 목표'),
                      ...meta.learningGoals.map((g) => _ListBulletItem(text: g.learningGoalText)),
                      const SizedBox(height: 24),
                    ],

                    if (meta.requirements.isNotEmpty) ...[
                      _SectionTitle(title: '요구사항'),
                      ...meta.requirements.map((r) => _ListBulletItem(text: r.requirementText)),
                      const SizedBox(height: 24),
                    ],

                    if (meta.codeTemplates.isNotEmpty) ...[
                      _SectionTitle(title: '작성 템플릿'),
                      ...meta.codeTemplates.map((t) => _CodeTemplateViewCard(tmpl: t)),
                      const SizedBox(height: 24),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 푸터 버튼
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('닫기', style: TextStyle(color: _D.textSub)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Container(
        width: 1,
        height: 24,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        color: _D.sectionBorder,
      );
}

// ─── 서브 위젯 ────────────────────────────────────────────────────────────────
class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});
  @override
  Widget build(BuildContext context) {
    final isPublished = status == 'PUBLISHED';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isPublished ? const Color(0xFFE0F2FE) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w800,
          color: isPublished ? const Color(0xFF0284C7) : const Color(0xFF64748B),
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _SummaryItem({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Icon(icon, size: 18, color: _D.textLight),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 11, color: _D.textLight)),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: _D.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 16,
            decoration: BoxDecoration(
              color: _D.accentBlue,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: _D.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListBulletItem extends StatelessWidget {
  final String text;
  const _ListBulletItem({required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Icon(Icons.circle, size: 4, color: _D.textLight),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, color: _D.textSub, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class _CodeTemplateViewCard extends StatefulWidget {
  final CodeTemplate tmpl;
  const _CodeTemplateViewCard({required this.tmpl});
  @override
  State<_CodeTemplateViewCard> createState() => _CodeTemplateViewCardState();
}

class _CodeTemplateViewCardState extends State<_CodeTemplateViewCard> {
  late CodeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CodeController(
      text: widget.tmpl.functionTemplate ?? widget.tmpl.codeTemplate ?? '',
      language: _getHighlightLanguage(widget.tmpl.language),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: _D.sectionBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: _D.sectionBorder, width: 1.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF1F5F9),
              border: Border(bottom: BorderSide(color: _D.sectionBorder)),
            ),
            child: Row(
              children: [
                const Icon(Icons.terminal_rounded, size: 14, color: _D.accentBlue),
                const SizedBox(width: 8),
                Text(
                  '${widget.tmpl.language} Editor (View Only)',
                  style: const TextStyle(
                    color: _D.textSub,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ),
          CodeTheme(
            data: const CodeThemeData(styles: atomOneLightTheme),
            child: CodeField(
              controller: _controller,
              readOnly: true,
              textStyle: const TextStyle(
                fontSize: 13,
                fontFamily: 'monospace',
                height: 1.5,
                color: _D.textPrimary,
              ),
              lineNumberStyle: const LineNumberStyle(
                width: 44,
                margin: 12,
                textStyle: TextStyle(
                  color: _D.textLight,
                  fontSize: 12,
                  fontFamily: 'monospace',
                ),
              ),
              decoration: const BoxDecoration(color: _D.sectionBg),
              maxLines: null,
              minLines: 8,
            ),
          ),
        ],
      ),
    );
  }

  dynamic _getHighlightLanguage(String lang) {
    final l = lang.toUpperCase();
    if (l == 'DART') return dart;
    if (l == 'KOTLIN') return kotlin;
    if (l == 'PYTHON') return python;
    return dart;
  }
}

String _pruneOffset(String dtStr) {
  return dtStr
      .replaceAll('T', ' ')
      .split('.')
      .first
      .split('+')
      .first
      .split('Z')
      .first;
}
