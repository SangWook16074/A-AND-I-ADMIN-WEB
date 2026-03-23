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
        .map(
          (e) => _TestCaseData(
            input: e.inputText ?? '',
            output: e.outputText ?? '',
            visibility: e.visibility,
          ),
        )
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

    _submissionGuideTitle =
        fullAssignment.metadata.submissionGuide?.title ?? '';
    _submissionGuideDescription =
        fullAssignment.metadata.submissionGuide?.description ?? '';
    _commentSectionsText =
        (fullAssignment.metadata.submissionGuide?.commentSections ?? []).join(
          '\n',
        );

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
      _codeTemplates.add(_CodeTemplateData());
    }
  }

  @override
  void dispose() {
    _startAtController.dispose();
    _endAtController.dispose();
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

      final requirements = fullAssignment.metadata.requirements;
      final testCases = _testCases
          .asMap()
          .entries
          .where((e) => e.value.input.isNotEmpty || e.value.output.isNotEmpty)
          .map(
            (e) => AssignmentTestCase(
              seq: e.key + 1,
              inputText: e.value.input.replaceAll('\\n', '\n'),
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
              commentTemplate: e.commentTemplate.replaceAll('\\n', '\n'),
              functionTemplate: e.functionTemplate.replaceAll('\\n', '\n'),
              runnableTemplate: e.runnableTemplate.replaceAll('\\n', '\n'),
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
                                initialValue: testCase.input.replaceAll(
                                  '\n',
                                  '\\n',
                                ),
                                decoration: const InputDecoration(
                                  labelText: '입력 (Input)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                  hintText: 'ADD 1\\nCLOSE',
                                ),
                                maxLines: 2,
                                onSaved: (v) =>
                                    testCase.input = v?.trim() ?? '',
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
}

class _TestCaseData {
  String input;
  String output;
  String visibility;

  _TestCaseData({
    this.input = '',
    this.output = '',
    this.visibility = 'PUBLIC',
  });
}

class _CodeTemplateData {
  String language;
  String commentTemplate;
  String functionTemplate;
  String runnableTemplate;

  _CodeTemplateData({
    this.language = 'KOTLIN',
    this.commentTemplate = '',
    this.functionTemplate = '',
    this.runnableTemplate = '',
  });
}
