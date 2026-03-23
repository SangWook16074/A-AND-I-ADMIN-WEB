import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'presentation/bloc/tasks_management_bloc.dart';
import 'presentation/bloc/tasks_management_event.dart';

class EditAssignmentDialog extends ConsumerStatefulWidget {
  final String courseSlug;
  final Assignment assignment;

  const EditAssignmentDialog({
    super.key,
    required this.courseSlug,
    required this.assignment,
  });

  @override
  ConsumerState<EditAssignmentDialog> createState() =>
      _EditAssignmentDialogState();
}

class _EditAssignmentDialogState extends ConsumerState<EditAssignmentDialog> {
  final _formKey = GlobalKey<FormState>();

  late int _orderInWeek;
  late String _title;
  late String _difficulty;
  late String _description;
  late String _startAt;
  late String _endAt;
  late String _learningGoals;
  late String _language;
  late String _status;
  late List<_TestCaseData> _testCases;

  // Problem Detail fields
  late String _inputDescription;
  late String _outputDescription;
  late String _algorithmStep;
  late int _difficultyStep;

  // Submission Guide fields
  late String _submissionGuideTitle;
  late String _submissionGuideDescription;
  late String _commentSectionsText;

  // Code Templates
  late List<_CodeTemplateData> _codeTemplates;
  late String _requirementsText;

  late final TextEditingController _startAtController;
  late final TextEditingController _endAtController;

  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _startAtController = TextEditingController();
    _endAtController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tasksManagementBlocProvider.notifier)
          .add(
            TasksManagementAssignmentDetailsRequested(
              courseSlug: widget.courseSlug,
              assignmentId: widget.assignment.id,
            ),
          );
    });
  }

  void _initFields(Assignment fullAssignment) {
    if (_isInit) return;
    _isInit = true;
    _orderInWeek = fullAssignment.orderInWeek;
    _title = fullAssignment.metadata.title;
    _difficulty = fullAssignment.metadata.difficulty;
    _description = fullAssignment.metadata.description ?? '';
    _startAt = fullAssignment.startAt;
    _endAt = fullAssignment.endAt;

    try {
      final start = DateTime.parse(_startAt);
      _startAtController.text = _formatFullDateTime(start);
    } catch (_) {
      _startAtController.text = _startAt;
    }

    try {
      final end = DateTime.parse(_endAt);
      _endAtController.text = _formatFullDateTime(end);
    } catch (_) {
      _endAtController.text = _endAt;
    }

    _learningGoals = fullAssignment.metadata.learningGoals
        .map((e) => e.learningGoalText)
        .join('\n');
    _language = fullAssignment.metadata.attributes['language'] ?? 'kotlin';
    _status = fullAssignment.status;
    _testCases = fullAssignment.metadata.testCases
        .map((tc) => _TestCaseData(
              inputs: tc.inputValues,
              output: tc.outputText ?? '',
              visibility: tc.visibility,
            ))
        .toList();
    if (_testCases.isEmpty) {
      _testCases.add(_TestCaseData());
    }

    _inputDescription =
        fullAssignment.metadata.problemDetail?.inputDescription ?? '';
    _outputDescription =
        fullAssignment.metadata.problemDetail?.outputDescription ?? '';
    _algorithmStep =
        fullAssignment.metadata.problemDetail?.classification?.algorithmStep ??
        'STEP0';
    _difficultyStep =
        fullAssignment.metadata.problemDetail?.classification?.difficultyStep ??
        1;

    _submissionGuideTitle = fullAssignment.metadata.submissionGuide?.title ?? '';
    _submissionGuideDescription =
        fullAssignment.metadata.submissionGuide?.description ?? '';
    _commentSectionsText =
        (fullAssignment.metadata.submissionGuide?.commentSections ?? [])
            .join('\n');

    _requirementsText = fullAssignment.metadata.requirements
        .map((e) => e.requirementText)
        .join('\n');

    _codeTemplates = fullAssignment.metadata.codeTemplates
        .map(
          (e) => _CodeTemplateData(
            language: e.language,
            commentTemplate: e.commentTemplate ?? '',
            functionTemplate: e.functionTemplate ?? '',
            runnableTemplate: e.runnableTemplate ?? '',
          ),
        )
        .toList();

    if (_codeTemplates.isEmpty) {
      _codeTemplates = [
        _CodeTemplateData(
          language: 'KOTLIN',
          commentTemplate:
              '/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/',
          functionTemplate:
              'fun solution(): String {\n    var answer = ""\n    return answer\n}',
          runnableTemplate:
              'fun solution(): String {\n    var answer = "Hello World!"\n    return answer\n}\n\nfun main() {\n    println(solution())\n}',
        ),
        _CodeTemplateData(
          language: 'DART',
          commentTemplate:
              '/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/',
          functionTemplate:
              'String solution() {\n    var answer = "";\n    return answer;\n}',
          runnableTemplate:
              'String solution() {\n    var answer = "Hello World!";\n    return answer;\n}\n\nvoid main() {\n    print(solution());\n}',
        ),
        _CodeTemplateData(
          language: 'PYTHON',
          commentTemplate:
              '"""\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n"""',
          functionTemplate: 'def solution():\n    answer = ""\n    return answer',
          runnableTemplate:
              'def solution():\n    answer = "Hello World!"\n    return answer\n\nif __name__ == "__main__":\n    print(solution())',
        ),
      ];
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
    final DateTime current = isStart
        ? (DateTime.tryParse(_startAt) ?? DateTime.now())
        : (DateTime.tryParse(_endAt) ?? DateTime.now());

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (pickedDate == null) return;

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
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

  void _submit(Assignment fullAssignment) {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final requirements = _requirementsText
          .split('\n')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList()
          .asMap()
          .entries
          .map(
            (e) => AssignmentRequirement(
              sortOrder: e.key + 1,
              requirementText: e.value,
            ),
          )
          .toList();
      final testCases = _testCases
          .asMap()
          .entries
          .where((e) => e.value.inputs.isNotEmpty || e.value.output.isNotEmpty)
          .map(
            (e) => AssignmentTestCase(
              seq: e.key + 1,
              inputValues: e.value.inputs
                  .map((e) => e.replaceAll('\\n', '\n'))
                  .toList(),
              outputText: e.value.output.replaceAll('\\n', '\n'),
              visibility: e.value.visibility,
            ),
          )
          .toList();

      final codeTemplateList = _codeTemplates
          .where((e) => e.language.isNotEmpty)
          .map(
            (e) => CodeTemplate(
              language: e.language,
              commentTemplate: e.commentController.text,
              functionTemplate: e.functionController.text,
              runnableTemplate: e.runnableController.text,
            ),
          )
          .toList();

      final request = UpdateAssignmentRequest(
        orderInWeek: _orderInWeek,
        startAt: _startAt,
        endAt: _endAt,
        status: _status,
        metadata: AssignmentMetadata(
          title: _title,
          difficulty: _difficulty,
          description: _description.isEmpty ? null : _description,
          learningGoals: _learningGoals
              .split('\n')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList()
              .asMap()
              .entries
              .map(
                (e) => LearningGoal(
                  sortOrder: e.key + 1,
                  learningGoalText: e.value,
                ),
              )
              .toList(),
          attributes: {
            ...fullAssignment.metadata.attributes,
            'language': _language,
          },
          requirements: requirements,
          testCases: testCases,
          problemDetail: ProblemDetail(
            inputDescription: _inputDescription,
            outputDescription: _outputDescription,
            classification: ProblemClassification(
              algorithmStep: _algorithmStep,
              difficultyStep: _difficultyStep,
            ),
          ),
          submissionGuide: SubmissionGuide(
            title: _submissionGuideTitle,
            description: _submissionGuideDescription,
            commentSections: _commentSectionsText.isEmpty
                ? []
                : _commentSectionsText
                      .split('\n')
                      .map((e) => e.trim())
                      .where((e) => e.isNotEmpty)
                      .toList(),
          ),
          codeTemplates: codeTemplateList,
        ),
      );

      ref
          .read(tasksManagementBlocProvider.notifier)
          .add(
            TasksManagementUpdateAssignmentRequested(
              courseSlug: widget.courseSlug,
              assignmentId: widget.assignment.id,
              request: request,
            ),
          );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tasksManagementBlocProvider);
    final isLoading = state.isLoadingDetails;
    final fullAssignment = state.selectedAssignment;

    if (isLoading ||
        fullAssignment == null ||
        fullAssignment.id != widget.assignment.id) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Container(
          width: 600,
          padding: const EdgeInsets.all(48),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    }

    _initFields(fullAssignment);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        width: 600,
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '과제 수정',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        initialValue: _title,
                        decoration: const InputDecoration(
                          labelText: '과제 제목 *',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (v) => _title = v?.trim() ?? '',
                        validator: (v) =>
                            v == null || v.trim().isEmpty ? '필수' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _orderInWeek.toString(),
                        decoration: const InputDecoration(
                          labelText: '순서 (order) *',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        keyboardType: TextInputType.number,
                        onSaved: (v) =>
                            _orderInWeek = int.tryParse(v ?? '1') ?? 1,
                        validator: (v) =>
                            v == null || v.trim().isEmpty ? '필수' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _description,
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
                          labelText: '난이도 *',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        items: const [
                          DropdownMenuItem(value: 'LOW', child: Text('LOW')),
                          DropdownMenuItem(value: 'MID', child: Text('MID')),
                          DropdownMenuItem(value: 'HIGH', child: Text('HIGH')),
                        ],
                        onChanged: (v) {
                          if (v != null) _difficulty = v;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _startAtController,
                              readOnly: true,
                              onTap: () => _selectDateTime(true),
                              decoration: const InputDecoration(
                                labelText: '시작 일시 *',
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                ),
                              ),
                              onSaved: (v) => _startAt = _startAt.trim(),
                              validator: (v) =>
                                  v == null || v.trim().isEmpty ? '필수' : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              controller: _endAtController,
                              readOnly: true,
                              onTap: () => _selectDateTime(false),
                              decoration: const InputDecoration(
                                labelText: '종료 일시 *',
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: Icon(
                                  Icons.calendar_today,
                                  size: 20,
                                ),
                              ),
                              onSaved: (v) => _endAt = _endAt.trim(),
                              validator: (v) =>
                                  v == null || v.trim().isEmpty ? '필수' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _learningGoals,
                        decoration: const InputDecoration(
                          labelText: '학습 목표 (줄바꿈으로 구분)',
                          hintText: '입력 파싱\n함수 분리',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 3,
                        onSaved: (v) => _learningGoals = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _requirementsText,
                        decoration: const InputDecoration(
                          labelText: '필수 요구사항 (Requirements, 줄바꿈으로 구분)',
                          hintText: '함수 분리 필수\n예외 처리 필수',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 3,
                        onSaved: (v) => _requirementsText = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _language,
                        decoration: const InputDecoration(
                          labelText: '언어 (language)',
                          hintText: 'kotlin',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (v) => _language = v?.trim() ?? 'kotlin',
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '테스트케이스',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              TextFormField(
                                initialValue: testCase.inputs.join('\n'),
                                decoration: const InputDecoration(
                                  labelText: '입력 (Inputs, 한 줄에 하나씩)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                  hintText: 'param1\nparam2',
                                ),
                                maxLines: 4,
                                onSaved: (v) => testCase.inputs = v
                                        ?.split('\n')
                                        .map((e) => e.trim())
                                        .toList() ??
                                    [],
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: testCase.output.replaceAll(
                                  '\n',
                                  '\\n',
                                ),
                                decoration: const InputDecoration(
                                  labelText: '출력 (Output)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                  hintText: '+1',
                                ),
                                maxLines: 2,
                                onSaved: (v) =>
                                    testCase.output = v?.trim() ?? '',
                              ),
                              const SizedBox(height: 12),
                              DropdownButtonFormField<String>(
                                initialValue: testCase.visibility,
                                decoration: const InputDecoration(
                                  labelText: '공개 여부 (Visibility)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'PUBLIC',
                                    child: Text('PUBLIC'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'PRIVATE',
                                    child: Text('PRIVATE'),
                                  ),
                                ],
                                onChanged: (v) {
                                  if (v != null) testCase.visibility = v;
                                },
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      const Text(
                        '문제 상세 정보 (Problem Detail)',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _inputDescription,
                        decoration: const InputDecoration(
                          labelText: '입력 설명 (Input Description)',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (v) => _inputDescription = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _outputDescription,
                        decoration: const InputDecoration(
                          labelText: '출력 설명 (Output Description)',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (v) => _outputDescription = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              initialValue: _algorithmStep,
                              decoration: const InputDecoration(
                                labelText: '알고리즘 단계 (Algorithm Step)',
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'STEP0',
                              ),
                              onSaved: (v) =>
                                  _algorithmStep = v?.trim() ?? 'STEP0',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              initialValue: _difficultyStep.toString(),
                              decoration: const InputDecoration(
                                labelText: '난이도 단계 (Difficulty Step)',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              keyboardType: TextInputType.number,
                              onSaved: (v) =>
                                  _difficultyStep = int.tryParse(v ?? '1') ?? 1,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      const Text(
                        '제출 가이드 (Submission Guide)',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _submissionGuideTitle,
                        decoration: const InputDecoration(
                          labelText: '가이드 제목',
                          hintText: '문제 풀이 템플릿',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onSaved: (v) => _submissionGuideTitle = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _submissionGuideDescription,
                        decoration: const InputDecoration(
                          labelText: '가이드 설명',
                          hintText: '제출 코드 상단에는 문제-해석-풀이 주석을 작성해야 합니다.',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 2,
                        onSaved: (v) =>
                            _submissionGuideDescription = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _commentSectionsText,
                        decoration: const InputDecoration(
                          labelText: '주석 항목 (줄바꿈으로 구분)',
                          hintText: '문제\n해석\n풀이',
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        maxLines: 3,
                        onSaved: (v) => _commentSectionsText = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 24),
                      const Divider(),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '코드 템플릿',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {
                            setState(() {
                              _codeTemplates.add(_CodeTemplateData(
                                language: 'KOTLIN',
                                commentTemplate:
                                    '/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/',
                                functionTemplate:
                                    'fun solution(): String {\n    var answer = ""\n    return answer\n}',
                                runnableTemplate:
                                    'fun solution(): String {\n    var answer = "Hello World!"\n    return answer\n}\n\nfun main() {\n    println(solution())\n}',
                              ));
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
                          margin: const EdgeInsets.only(bottom: 24),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: template.language.toUpperCase(),
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
                                        DropdownMenuItem(
                                          value: 'JAVASCRIPT',
                                          child: Text('JAVASCRIPT'),
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
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        template.dispose();
                                        _codeTemplates.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              _buildPremiumCodeEditor(
                                label: '주석 템플릿 (Comment Template)',
                                controller: template.commentController,
                                language: template.language,
                              ),
                              const SizedBox(height: 12),
                              _buildPremiumCodeEditor(
                                label: '함수 템플릿 (Function Template)',
                                controller: template.functionController,
                                language: template.language,
                              ),
                              const SizedBox(height: 12),
                              _buildPremiumCodeEditor(
                                label: '실행 가능 템플릿 (Runnable Template)',
                                controller: template.runnableController,
                                language: template.language,
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 12),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () => _submit(fullAssignment),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    '수정 저장',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumCodeEditor({
    required String label,
    required TextEditingController controller,
    required String language,
    String? hintText,
  }) {
    final lines = controller.text.split('\n');
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
                color: Colors.black.withOpacity(0.2),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
                          right:
                              BorderSide(color: Color(0xFF1E293B), width: 1.5),
                        ),
                      ),
                      child: Column(
                        children: List.generate(
                          max(1, lines.length),
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
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                            hintText: hintText,
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.zero,
                          ),
                          maxLines: null,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'monospace',
                            height: 1.5,
                            color: Color(0xFFE2E8F0),
                          ),
                          onChanged: (v) {
                            setState(() {
                              // Trigger rebuild for gutter
                            });
                          },
                        ),
                      ),
                    ),
                  ],
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
}

class _CodeTemplateData {
  String language;
  final TextEditingController commentController;
  final TextEditingController functionController;
  final TextEditingController runnableController;

  _CodeTemplateData({
    this.language = 'KOTLIN',
    String commentTemplate = '',
    String functionTemplate = '',
    String runnableTemplate = '',
  })  : commentController = _PremiumCodeController(
            text: commentTemplate.replaceAll('\\n', '\n'), language: language),
        functionController = _PremiumCodeController(
            text: functionTemplate.replaceAll('\\n', '\n'), language: language),
        runnableController = _PremiumCodeController(
            text: runnableTemplate.replaceAll('\\n', '\n'),
            language: language) {
    // Update language when it changes
  }

  void dispose() {
    commentController.dispose();
    functionController.dispose();
    runnableController.dispose();
  }

  void updateLanguage(String lang) {
    language = lang;
    (commentController as _PremiumCodeController).language = lang;
    (functionController as _PremiumCodeController).language = lang;
    (runnableController as _PremiumCodeController).language = lang;
  }
}

class _PremiumCodeController extends TextEditingController {
  String language;
  _PremiumCodeController({required String text, required this.language})
      : super(text: text);

  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    return _highlightCode(text, language);
  }
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
      // Strings
      spans.add(
        TextSpan(
          text: text,
          style: const TextStyle(color: Color(0xFF86EFAC)),
        ),
      );
    } else if (match.group(3) != null ||
        match.group(4) != null ||
        match.group(5) != null) {
      // Comments (// or /* */ or #)
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
      // Words
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
        // Basic function attempt
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
      // Numbers
      spans.add(
        TextSpan(
          text: text,
          style: const TextStyle(color: Color(0xFFFDE68A)),
        ),
      );
    } else if (match.group(9) != null || match.group(10) != null) {
      // Punctuation/Brackets/Operators
      spans.add(
        TextSpan(
          text: text,
          style: const TextStyle(color: Color(0xFF94A3B8)),
        ),
      );
    } else {
      // Whitespace and others
      spans.add(
        TextSpan(
          text: text,
          style: const TextStyle(color: Color(0xFFE2E8F0)),
        ),
      );
    }
  }

  return TextSpan(children: spans);
}

class _TestCaseData {
  List<String> inputs;
  String output;
  String visibility;

  _TestCaseData({
    List<String>? inputs,
    this.output = '',
    this.visibility = 'PUBLIC',
  }) : inputs = inputs ?? [];
}
