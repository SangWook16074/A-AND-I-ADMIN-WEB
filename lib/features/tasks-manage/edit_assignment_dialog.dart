import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'presentation/bloc/tasks_management_bloc.dart';
import 'presentation/bloc/tasks_management_event.dart';
import 'package:code_text_field/code_text_field.dart';
import 'package:highlight/languages/kotlin.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/python.dart';
import 'package:flutter_highlight/themes/atom-one-dark.dart';

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
  late List<String> _learningGoalList;
  late String _language;
  late String _status;
  late List<_TestCaseData> _testCases;



  // Code Templates
  late List<_CodeTemplateData> _codeTemplates;
  late List<String> _requirementList;

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

    _learningGoalList = fullAssignment.metadata.learningGoals
        .map((e) => e.learningGoalText)
        .toList();
    if (_learningGoalList.isEmpty) _learningGoalList.add('');

    _requirementList = fullAssignment.metadata.requirements
        .map((e) => e.requirementText)
        .toList();
    if (_requirementList.isEmpty) _requirementList.add('');
    _language = fullAssignment.metadata.attributes['language'] ?? 'kotlin';
    _status = fullAssignment.status;
    _testCases = fullAssignment.metadata.testCases
        .map(
          (tc) => _TestCaseData(
            inputs: tc.inputValues.map((e) => e.toString()).toList(),
            output: tc.outputText ?? '',
            visibility: tc.visibility,
          ),
        )
        .toList();
    if (_testCases.isEmpty) {
      _testCases.add(_TestCaseData());
    }




    _codeTemplates = fullAssignment.metadata.codeTemplates.map((e) {
      String code = '';
      if (e.codeTemplate != null && e.codeTemplate!.isNotEmpty) {
        code = e.codeTemplate!.replaceAll('\\n', '\n');
      } else {
        final comment = (e.commentTemplate ?? '').replaceAll('\\n', '\n');
        final function = (e.functionTemplate ?? '').replaceAll('\\n', '\n');
        code = '$comment\n$function'.trim();
      }
      return _CodeTemplateData(
        language: e.language,
        codeTemplate: code,
      );
    }).toList();

    if (_codeTemplates.isEmpty) {
      final track = fullAssignment.metadata.attributes['targetTrack']?.toString().toUpperCase() ?? '';
      
      if (track == 'SP') {
        _language = 'KOTLIN';
        _codeTemplates = [_CodeTemplateData(language: 'KOTLIN')];
      } else if (track == 'FL') {
        _language = 'DART';
        _codeTemplates = [_CodeTemplateData(language: 'DART')];
      } else {
        _language = 'KOTLIN';
        _codeTemplates = [
          _CodeTemplateData(language: 'KOTLIN'),
          _CodeTemplateData(language: 'DART'),
          _CodeTemplateData(language: 'PYTHON'),
        ];
      }

      for (var t in _codeTemplates) {
        final defaults = _CodeTemplateData.getDefaultTemplates(t.language);
        t.codeController.text = defaults['code']!;
      }
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

      final learningGoalListPayload = _learningGoalList
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
          .toList();

      final requirementListPayload = _requirementList
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

      final testCases = _testCases
          .asMap()
          .entries
          .where((e) => e.value.inputs.isNotEmpty || e.value.output.isNotEmpty)
          .map(
            (e) => AssignmentTestCase(
              seq: e.key + 1,
              inputValues: e.value.inputs.map((input) {
                final trimmed = input.trim();
                if (trimmed.toLowerCase() == 'true') return true;
                if (trimmed.toLowerCase() == 'false') return false;
                final numVal = num.tryParse(trimmed);
                if (numVal != null) return numVal;
                return trimmed.replaceAll('\\n', '\n');
              }).toList(),
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
              functionTemplate: e.codeController.text.trim(),
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
          learningGoals: learningGoalListPayload,
          attributes: {
            ...fullAssignment.metadata.attributes,
            'language': _language,
          },
          requirements: requirementListPayload,
          testCases: testCases,
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
                      const Divider(),
                      const SizedBox(height: 12),
                      _buildDynamicFieldSection(
                        title: '학습 목표',
                        items: _learningGoalList,
                        onAdd: () => setState(() => _learningGoalList.add('')),
                        onRemove: (index) =>
                            setState(() => _learningGoalList.removeAt(index)),
                        onChanged: (index, value) =>
                            _learningGoalList[index] = value,
                        label: '학습 목표',
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      _buildDynamicFieldSection(
                        title: '필수 요구사항 (Requirements)',
                        items: _requirementList,
                        onAdd: () => setState(() => _requirementList.add('')),
                        onRemove: (index) =>
                            setState(() => _requirementList.removeAt(index)),
                        onChanged: (index, value) =>
                            _requirementList[index] = value,
                        label: '요구사항',
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
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
                                          onChanged: (v) => testCase.inputs[inputIndex] = v,
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 20),
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
                                label: const Text('입력값 추가', style: TextStyle(fontSize: 12)),
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
                                _codeTemplates.add(
                                  _CodeTemplateData(
                                    language: 'KOTLIN',
                                    codeTemplate: _CodeTemplateData.getDefaultTemplates('KOTLIN')['code'] ?? '',
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
                                label: '코드 템플릿 (Code Template)',
                                controller: template.codeController,
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
                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    onPressed: () => onRemove(index),
                  ),
              ],
            ),
          );
        }),
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
  late final CodeController codeController;

  _CodeTemplateData({
    this.language = 'KOTLIN',
    String? codeTemplate,
  }) {
    // If we only have the old codeTemplate, use it.
    codeController = CodeController(
      text: (codeTemplate ?? '').replaceAll('\\n', '\n'),
      language: _getLanguage(language),
    );
  }

  void dispose() {
    codeController.dispose();
  }

  void updateLanguage(String lang) {
    language = lang;
    codeController.language = _getLanguage(lang);

    // Automatically update to default template for the new language
    final defaults = getDefaultTemplates(lang);
    codeController.text = defaults['code']!;
  }

  static Map<String, String> getDefaultTemplates(String lang) {
    switch (lang.toUpperCase()) {
      case 'KOTLIN':
        return {
          'code': "/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/\n\nfun solution(): String {\n    var answer = \"\"\n    return answer\n}",
        };
      case 'DART':
        return {
          'code': "/*\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n*/\n\nString solution() {\n  String answer = '';\n  return answer;\n}",
        };
      case 'PYTHON':
        return {
          'code': "'''\n[문제]\n> 이해한 방식으로 문제를 다시 정의해요\n[해석]\n> 문제의 요구사항을 분석해요\n[풀이]\n> 적용할 풀이를 작성해요\n'''\n\ndef solution():\n    answer = ''\n    return answer",
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

class _TestCaseData {
  List<String> inputs;
  String output;
  String visibility;

  _TestCaseData({
    List<String>? inputs,
    String? output,
    String? visibility,
  })  : inputs = inputs ?? [],
        output = output ?? '',
        visibility = visibility ?? 'PUBLIC';
}
