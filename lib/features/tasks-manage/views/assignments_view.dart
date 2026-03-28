import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/kotlin.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';
import '../task_management.dart';
import '../edit_assignment_dialog.dart';
import '../assignment_details_dialog.dart';

class AssignmentsView extends ConsumerStatefulWidget {
  const AssignmentsView({
    super.key,
    required this.course,
    required this.isLoading,
    this.assignments,
  });

  final CourseSummary course;
  final bool isLoading;
  final List<Assignment>? assignments;

  @override
  ConsumerState<AssignmentsView> createState() => AssignmentsViewState();
}

class AssignmentsViewState extends ConsumerState<AssignmentsView> {
  final _formKey = GlobalKey<FormState>();

  int _weekNo = 1;
  int _orderInWeek = 1;
  String _title = '';
  String _difficulty = 'MID';
  String _description = '';
  String _startAt = '';
  String _endAt = '';

  final List<String> _learningGoals = [''];
  String _language = 'kotlin';

  final List<String> _requirements = [''];
  final List<_TestCaseData> _testCases = [_TestCaseData()];

  // Code Templates
  final List<_CodeTemplateData> _codeTemplates = [];

  late TextEditingController _startAtController;
  late TextEditingController _endAtController;

  @override
  void initState() {
    super.initState();
    _startAtController = TextEditingController();
    _endAtController = TextEditingController();

    // Initialize based on track
    final track = widget.course.targetTrack.toUpperCase();
    if (track == 'SP') {
      _language = 'KOTLIN';
      final defaults = _CodeTemplateData.getDefaultTemplates('KOTLIN');
      _codeTemplates.add(
        _CodeTemplateData(language: 'KOTLIN', codeTemplate: defaults['code']),
      );
    } else if (track == 'FL') {
      _language = 'DART';
      final defaults = _CodeTemplateData.getDefaultTemplates('DART');
      _codeTemplates.add(
        _CodeTemplateData(language: 'DART', codeTemplate: defaults['code']),
      );
    } else {
      _language = 'KOTLIN'; // fallback
      _codeTemplates.addAll([
        _CodeTemplateData(
          language: 'KOTLIN',
          codeTemplate: _CodeTemplateData.getDefaultTemplates('KOTLIN')['code'],
        ),
        _CodeTemplateData(
          language: 'DART',
          codeTemplate: _CodeTemplateData.getDefaultTemplates('DART')['code'],
        ),
        _CodeTemplateData(
          language: 'PYTHON',
          codeTemplate: _CodeTemplateData.getDefaultTemplates('PYTHON')['code'],
        ),
      ]);
    }
  }

  @override
  void dispose() {
    _startAtController.dispose();
    _endAtController.dispose();
    for (var t in _codeTemplates) {
      t.dispose();
    }
    super.dispose();
  }

  Future<void> _selectDateTime(bool isStart) async {
    final DateTime now = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
    );

    if (pickedTime == null) return;

    final DateTime fullDateTime = DateTime(
      pickedDate.year,
      pickedDate.month,
      pickedDate.day,
      pickedTime.hour,
      pickedTime.minute,
    );

    setState(() {
      final offset = fullDateTime.timeZoneOffset;
      final hours = offset.inHours.abs().toString().padLeft(2, '0');
      final minutes = (offset.inMinutes.abs() % 60).toString().padLeft(2, '0');
      final sign = offset.isNegative ? '-' : '+';
      final formattedIso =
          '${fullDateTime.toIso8601String().split('.').first}$sign$hours:$minutes';

      if (isStart) {
        _startAt = formattedIso;
        _startAtController.text = _formatFullDateTime(fullDateTime);
      } else {
        _endAt = formattedIso;
        _endAtController.text = _formatFullDateTime(fullDateTime);
      }
    });
  }

  String _formatFullDateTime(DateTime dt) {
    return '${dt.year}-${dt.month.toString().padLeft(2, '0')}-${dt.day.toString().padLeft(2, '0')} '
        '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // List existing assignments
          if (widget.isLoading && widget.assignments == null)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: CircularProgressIndicator(),
              ),
            )
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
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F0F0),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              assignment.status,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '난이도: ${assignment.metadata.difficulty} | 기한: ${assignment.startAt.split('T').first} ~ ${assignment.endAt.split('T').first}',
                              style: const TextStyle(
                                color: Color(0xFF8A8A8A),
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        AssignmentDetailsDialog(
                                          courseSlug: widget.course.slug,
                                          assignmentId: assignment.id,
                                        ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  '상세 보기',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) => EditAssignmentDialog(
                                      courseSlug: widget.course.slug,
                                      assignment: assignment,
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  '수정',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('과제 삭제'),
                                      content: const Text(
                                        '과제와 연관 데이터(요구사항/예시/배포)를 모두 삭제합니다. 계속하시겠습니까?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text(
                                            '취소',
                                            style: TextStyle(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            ref
                                                .read(
                                                  tasksManagementBlocProvider
                                                      .notifier,
                                                )
                                                .add(
                                                  TasksManagementAssignmentDeletedRequested(
                                                    courseSlug:
                                                        widget.course.slug,
                                                    assignmentId: assignment.id,
                                                  ),
                                                );
                                          },
                                          child: const Text(
                                            '삭제',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  minimumSize: Size.zero,
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                child: const Text(
                                  '삭제',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                child: Text(
                  '등록된 과제가 없습니다.',
                  style: TextStyle(color: Color(0xFF8A8A8A)),
                ),
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
                  const Text(
                    '새 과제 추가',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '주차 (weekNo)',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (v) => _weekNo = int.tryParse(v ?? '1') ?? 1,
                          validator: (v) =>
                              v == null || v.isEmpty ? '필수' : null,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: '순서 (order)',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          keyboardType: TextInputType.number,
                          onSaved: (v) =>
                              _orderInWeek = int.tryParse(v ?? '1') ?? 1,
                          validator: (v) =>
                              v == null || v.isEmpty ? '필수' : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '과제 제목',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    onSaved: (v) => _title = v?.trim() ?? '',
                    validator: (v) => v == null || v.isEmpty ? '필수' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '과제 설명',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    maxLines: 3,
                    onSaved: (v) => _description = v?.trim() ?? '',
                  ),
                  const SizedBox(height: 12),
                  DropdownButtonFormField<String>(
                    initialValue: _difficulty,
                    decoration: const InputDecoration(
                      labelText: '난이도',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: const [
                      DropdownMenuItem(value: 'LOW', child: Text('LOW')),
                      DropdownMenuItem(value: 'MID', child: Text('MID')),
                      DropdownMenuItem(value: 'HIGH', child: Text('HIGH')),
                      DropdownMenuItem(
                        value: 'VERY_HIGH',
                        child: Text('VERY_HIGH'),
                      ),
                    ],
                    onChanged: (v) => setState(() => _difficulty = v ?? 'MID'),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _startAtController,
                    readOnly: true,
                    onTap: () => _selectDateTime(true),
                    decoration: const InputDecoration(
                      labelText: '시작일시 (달력에서 선택)',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.calendar_today, size: 20),
                    ),
                    onSaved: (v) => _startAt = _startAt.trim(),
                    validator: (v) =>
                        v == null || v.isEmpty ? '시작일시를 선택해주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    controller: _endAtController,
                    readOnly: true,
                    onTap: () => _selectDateTime(false),
                    decoration: const InputDecoration(
                      labelText: '종료일시 (달력에서 선택)',
                      filled: true,
                      fillColor: Colors.white,
                      suffixIcon: Icon(Icons.calendar_today, size: 20),
                    ),
                    onSaved: (v) => _endAt = _endAt.trim(),
                    validator: (v) =>
                        v == null || v.isEmpty ? '종료일시를 선택해주세요.' : null,
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  const Text(
                    '메타데이터 및 제약사항',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  // Disabled language input if track is set
                  if (widget.course.targetTrack.toUpperCase() == 'SP' ||
                      widget.course.targetTrack.toUpperCase() == 'FL')
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      child: Text(
                        '사용 언어: $_language',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF64748B),
                        ),
                      ),
                    )
                  else
                    Row(
                      children: [
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: '사용 언어 (예: kotlin)',
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            initialValue: _language,
                            onSaved: (v) => _language = v?.trim() ?? '',
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  _buildDynamicFieldSection(
                    title: '학습 목표',
                    items: _learningGoals,
                    onAdd: () => setState(() => _learningGoals.add('')),
                    onRemove: (index) =>
                        setState(() => _learningGoals.removeAt(index)),
                    onChanged: (index, value) => _learningGoals[index] = value,
                    label: '학습 목표',
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  _buildDynamicFieldSection(
                    title: '요구사항 (Requirements)',
                    items: _requirements,
                    onAdd: () => setState(() => _requirements.add('')),
                    onRemove: (index) =>
                        setState(() => _requirements.removeAt(index)),
                    onChanged: (index, value) => _requirements[index] = value,
                    label: '요구사항',
                  ),
                  const SizedBox(height: 12),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '테스트 예제',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _testCases.add(_TestCaseData());
                          });
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('테스트케이스 추가'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._testCases.asMap().entries.map((entry) {
                    final index = entry.key;
                    final testCase = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '테스트케이스 ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              if (_testCases.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _testCases.removeAt(index);
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '입력값 (Inputs)',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF64748B),
                            ),
                          ),
                          const SizedBox(height: 8),
                          ...testCase.inputs.asMap().entries.map((inputEntry) {
                            final inputIndex = inputEntry.key;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      initialValue: inputEntry.value,
                                      decoration: InputDecoration(
                                        labelText: '입력 ${inputIndex + 1}',
                                        filled: true,
                                        fillColor: const Color(0xFFFAFAFA),
                                        isDense: true,
                                      ),
                                      onChanged: (v) =>
                                          testCase.inputs[inputIndex] = v,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        testCase.inputs.removeAt(inputIndex);
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          }),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                testCase.inputs.add('');
                              });
                            },
                            icon: const Icon(Icons.add, size: 16),
                            label: const Text(
                              '입력값 추가',
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            initialValue: testCase.output,
                            decoration: const InputDecoration(
                              labelText: '출력 (Output)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              hintText: '+1',
                            ),
                            maxLines: 2,
                            onSaved: (v) => testCase.output = v?.trim() ?? '',
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<TestCaseVisibility>(
                            initialValue: testCase.visibility,
                            decoration: const InputDecoration(
                              labelText: '공개 여부 (Visibility)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                            ),
                            items: TestCaseVisibility.values.map((v) {
                              return DropdownMenuItem(
                                value: v,
                                child: Text(v.name.toUpperCase()),
                              );
                            }).toList(),
                            onChanged: (v) {
                              if (v != null) {
                                setState(() {
                                  testCase.visibility = v;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 12),
                  const Divider(),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '코드 템플릿 (Code Templates)',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          setState(() {
                            _codeTemplates.add(
                              _CodeTemplateData(
                                language: 'KOTLIN',
                                codeTemplate:
                                    _CodeTemplateData.getDefaultTemplates(
                                      'KOTLIN',
                                    )['code'],
                              ),
                            );
                          });
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: const Text('템플릿 추가'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ..._codeTemplates.asMap().entries.map((entry) {
                    final index = entry.key;
                    final template = entry.value;
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xFFEAEAEA)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '템플릿 ${index + 1}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                ),
                              ),
                              if (_codeTemplates.length > 1)
                                IconButton(
                                  icon: const Icon(
                                    Icons.remove_circle_outline,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      final removed = _codeTemplates.removeAt(
                                        index,
                                      );
                                      removed.dispose();
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          DropdownButtonFormField<String>(
                            initialValue: template.language,
                            decoration: const InputDecoration(
                              labelText: '언어 (Language)',
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 'KOTLIN',
                                child: Text('KOTLIN'),
                              ),
                              DropdownMenuItem(
                                value: 'DART',
                                child: Text('DART'),
                              ),
                              DropdownMenuItem(
                                value: 'PYTHON',
                                child: Text('PYTHON'),
                              ),
                            ],
                            onChanged: (v) {
                              if (v != null) {
                                setState(() {
                                  template.updateLanguage(v);
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 12),
                          _buildPremiumCodeEditor(
                            label: '코드 템플릿',
                            controller: template.codeController,
                            language: template.language,
                          ),
                        ],
                      ),
                    );
                  }),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _formKey.currentState?.save();

                          final reqList = _requirements
                              .where((e) => e.trim().isNotEmpty)
                              .toList()
                              .asMap()
                              .entries
                              .map(
                                (e) => AssignmentRequirement(
                                  sortOrder: e.key + 1,
                                  requirementText: e.value.trim(),
                                ),
                              )
                              .toList();
                          final testCaseList = _testCases
                              .asMap()
                              .entries
                              .where(
                                (e) =>
                                    e.value.inputs.isNotEmpty ||
                                    e.value.output.isNotEmpty,
                              )
                              .map(
                                (e) => AssignmentTestCase(
                                  seq: e.key + 1,
                                  inputValues: e.value.inputs.map((input) {
                                    final trimmed = input.trim();
                                    if (trimmed.toLowerCase() == 'true') {
                                      return true;
                                    }
                                    if (trimmed.toLowerCase() == 'false') {
                                      return false;
                                    }
                                    final numVal = num.tryParse(trimmed);
                                    if (numVal != null) return numVal;
                                    return trimmed.replaceAll('\\n', '\n');
                                  }).toList(),
                                  outputText: e.value.output.replaceAll(
                                    '\\n',
                                    '\n',
                                  ),
                                  visibility: e.value.visibility,
                                ),
                              )
                              .toList();

                          final codeTemplateList = _codeTemplates
                              .where((e) => e.language.isNotEmpty)
                              .map(
                                (e) => CodeTemplate(
                                  language: e.language,
                                  functionTemplate: e.codeController.text
                                      .trim(),
                                ),
                              )
                              .toList();

                          ref
                              .read(tasksManagementBlocProvider.notifier)
                              .add(
                                TasksManagementCreateAssignmentRequested(
                                  courseSlug: widget.course.slug,
                                  request: CreateAssignmentRequest(
                                    weekNo: _weekNo,
                                    orderInWeek: _orderInWeek,
                                    startAt: _startAt,
                                    endAt: _endAt,
                                    metadata: AssignmentMetadata(
                                      title: _title,
                                      description: _description,
                                      difficulty: _difficulty,
                                      learningGoals: _learningGoals
                                          .where((e) => e.trim().isNotEmpty)
                                          .toList()
                                          .asMap()
                                          .entries
                                          .map(
                                            (e) => LearningGoal(
                                              sortOrder: e.key + 1,
                                              learningGoalText: e.value.trim(),
                                            ),
                                          )
                                          .toList(),
                                      requirements: reqList,
                                      testCases: testCaseList,
                                      codeTemplates: codeTemplateList,
                                      attributes: _language.isNotEmpty
                                          ? {'language': _language}
                                          : {},
                                    ),
                                  ),
                                ),
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('과제 생성 요청을 보냈습니다.')),
                          );
                          setState(() {
                            for (var t in _codeTemplates) {
                              t.updateControllers();
                            }
                          });
                        }
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A1A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        '과제 등록',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
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

  Widget _buildPremiumCodeEditor({
    required String label,
    required CodeController controller,
    required String language,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xFF64748B),
            ),
          ),
        ),
        Container(
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
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
                  ],
                ),
              ),
              // Code Area
              CodeTheme(
                data: CodeThemeData(styles: atomOneDarkTheme),
                child: CodeField(
                  controller: controller,
                  textStyle: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'monospace',
                    height: 1.5,
                  ),
                  lineNumberStyle: const LineNumberStyle(
                    width: 45,
                    margin: 16,
                    textStyle: TextStyle(
                      color: Color(0xFF475569),
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                  decoration: const BoxDecoration(color: Color(0xFF0F172A)),
                  maxLines: null,
                  minLines: 5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildDynamicFieldSection({
    required String title,
    required List<String> items,
    required VoidCallback onAdd,
    required Function(int) onRemove,
    required Function(int, String) onChanged,
    required String label,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
            TextButton.icon(
              onPressed: onAdd,
              icon: const Icon(Icons.add, size: 18),
              label: Text('$label 추가'),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.asMap().entries.map((entry) {
          final index = entry.key;
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: entry.value,
                    decoration: InputDecoration(
                      labelText: '$label ${index + 1}',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onChanged: (v) => onChanged(index, v),
                  ),
                ),
                if (items.length > 1)
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.red,
                    ),
                    onPressed: () => onRemove(index),
                  ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _TestCaseData {
  List<String> inputs;
  String output;
  TestCaseVisibility visibility;

  _TestCaseData({
    List<String>? inputs,
    String? output,
    TestCaseVisibility? visibility,
  }) : inputs = inputs ?? [],
       output = output ?? '',
       visibility = visibility ?? TestCaseVisibility.public;
}

class _CodeTemplateData {
  String language;
  late final CodeController codeController;

  _CodeTemplateData({this.language = 'KOTLIN', String? codeTemplate}) {
    codeController = CodeController(
      text: (codeTemplate ?? '').replaceAll('\\n', '\n'),
      language: _getLanguage(language),
    );
  }

  void dispose() {
    codeController.dispose();
  }

  void updateContent(String code) {
    codeController.text = code.replaceAll('\\n', '\n');
  }

  void updateControllers() {
    codeController.language = _getLanguage(language);
  }

  void updateLanguage(String lang) {
    language = lang;
    codeController.language = _getLanguage(lang);

    // Automatically update to default template for the new language
    final defaults = getDefaultTemplates(lang);
    updateContent(defaults['code']!);
  }

  static Map<String, String> getDefaultTemplates(String lang) {
    switch (lang.toUpperCase()) {
      case 'KOTLIN':
        return {
          'code':
              "/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/\nfun solution(): String {\n    var answer = \"\"\n    return answer\n}",
        };
      case 'DART':
        return {
          'code':
              "/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/\n\nString solution() {\n  String answer = '';\n  return answer;\n}",
        };
      case 'PYTHON':
        return {
          'code':
              "'''\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n'''\n\ndef solution():\n    answer = ''\n    return answer",
        };
      default:
        return {'code': ''};
    }
  }

  dynamic _getLanguage(String lang) {
    switch (lang.toUpperCase()) {
      case 'KOTLIN':
        return kotlin;
      case 'DART':
        return dart;
      case 'PYTHON':
        return python;
      default:
        return kotlin;
    }
  }
}
