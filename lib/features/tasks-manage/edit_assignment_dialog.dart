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
  ConsumerState<EditAssignmentDialog> createState() => _EditAssignmentDialogState();
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
  late List<_ExampleData> _examples;

  late final TextEditingController _startAtController;
  late final TextEditingController _endAtController;

  bool _isInit = false;

  @override
  void initState() {
    super.initState();
    _startAtController = TextEditingController();
    _endAtController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(tasksManagementBlocProvider.notifier).add(
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

    _learningGoals =
        fullAssignment.metadata.learningGoals.map((e) => e.learningGoalText).join(', ');
    _language = fullAssignment.metadata.attributes['language'] ?? 'kotlin';
    _examples = fullAssignment.metadata.examples
        .map((e) => _ExampleData(
              input: e.inputText ?? '',
              output: e.outputText ?? '',
              description: e.description ?? '',
            ))
        .toList();
    if (_examples.isEmpty) {
      _examples.add(_ExampleData());
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
      final examples = _examples
          .asMap()
          .entries
          .where((e) => e.value.input.isNotEmpty || e.value.output.isNotEmpty || e.value.description.isNotEmpty)
          .map((e) => AssignmentExample(
                seq: e.key + 1,
                inputText: e.value.input.replaceAll('\\n', '\n'),
                outputText: e.value.output.replaceAll('\\n', '\n'),
                description: e.value.description,
              ))
          .toList();
      
      final request = UpdateAssignmentRequest(
        orderInWeek: _orderInWeek,
        startAt: _startAt,
        endAt: _endAt,
        metadata: AssignmentMetadata(
          title: _title,
          difficulty: _difficulty,
          description: _description.isEmpty ? null : _description,
          timeLimitMinutes: fullAssignment.metadata.timeLimitMinutes,
          learningGoals: _learningGoals
              .split(',')
              .map((e) => e.trim())
              .where((e) => e.isNotEmpty)
              .toList() // Added toList() before asMap()
              .asMap()
              .entries
              .map((e) => LearningGoal(sortOrder: e.key + 1, learningGoalText: e.value))
              .toList(),
          attributes: {
            ...fullAssignment.metadata.attributes,
            'language': _language,
          },
          requirements: requirements,
          examples: examples,
        ),
      );

      ref.read(tasksManagementBlocProvider.notifier).add(
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

    if (isLoading || fullAssignment == null || fullAssignment.id != widget.assignment.id) {
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
                  const Text('과제 수정', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
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
                        decoration: const InputDecoration(labelText: '과제 제목 *', filled: true, fillColor: Colors.white),
                        onSaved: (v) => _title = v?.trim() ?? '',
                        validator: (v) => v == null || v.trim().isEmpty ? '필수' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _orderInWeek.toString(),
                        decoration: const InputDecoration(labelText: '순서 (order) *', filled: true, fillColor: Colors.white),
                        keyboardType: TextInputType.number,
                        onSaved: (v) => _orderInWeek = int.tryParse(v ?? '1') ?? 1,
                        validator: (v) => v == null || v.trim().isEmpty ? '필수' : null,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _description,
                        decoration: const InputDecoration(labelText: '과제 설명', filled: true, fillColor: Colors.white),
                        maxLines: 3,
                        onSaved: (v) => _description = v?.trim() ?? '',
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        initialValue: _difficulty,
                        decoration: const InputDecoration(labelText: '난이도 *', filled: true, fillColor: Colors.white),
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
                                suffixIcon: Icon(Icons.calendar_today, size: 20),
                              ),
                              onSaved: (v) => _startAt = _startAt.trim(),
                              validator: (v) => v == null || v.trim().isEmpty ? '필수' : null,
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
                                suffixIcon: Icon(Icons.calendar_today, size: 20),
                              ),
                              onSaved: (v) => _endAt = _endAt.trim(),
                              validator: (v) => v == null || v.trim().isEmpty ? '필수' : null,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: _learningGoals,
                        decoration: const InputDecoration(
                          labelText: '학습 목표 (쉼표로 구분)',
                          hintText: '입력 파싱, 함수 분리',
                          filled: true,
                          fillColor: Colors.white,
                        ),
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
                            '테스트 예제',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              setState(() {
                                _examples.add(_ExampleData());
                              });
                            },
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text('예제 추가'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ..._examples.asMap().entries.map((entry) {
                        final index = entry.key;
                        final example = entry.value;
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
                                    '예제 ${index + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 13,
                                    ),
                                  ),
                                  if (_examples.length > 1)
                                    IconButton(
                                      icon: const Icon(Icons.remove_circle_outline, color: Colors.red, size: 20),
                                      onPressed: () {
                                        setState(() {
                                          _examples.removeAt(index);
                                        });
                                      },
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                    ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: example.input.replaceAll('\n', '\\n'),
                                decoration: const InputDecoration(
                                  labelText: '예제 입력 (Input)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                  hintText: 'ADD 1\\nCLOSE',
                                ),
                                maxLines: 2,
                                onSaved: (v) => example.input = v?.trim() ?? '',
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: example.output.replaceAll('\n', '\\n'),
                                decoration: const InputDecoration(
                                  labelText: '예제 출력 (Output)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                  hintText: '+1',
                                ),
                                maxLines: 2,
                                onSaved: (v) => example.output = v?.trim() ?? '',
                              ),
                              const SizedBox(height: 12),
                              TextFormField(
                                initialValue: example.description,
                                decoration: const InputDecoration(
                                  labelText: '예제 설명 (Description)',
                                  filled: true,
                                  fillColor: Color(0xFFFAFAFA),
                                  hintText: '기본 동작',
                                ),
                                onSaved: (v) => example.description = v?.trim() ?? '',
                              ),
                            ],
                          ),
                        );
                      }),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: () => _submit(fullAssignment),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('수정 저장', style: TextStyle(fontWeight: FontWeight.w700)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ExampleData {
  String input;
  String output;
  String description;

  _ExampleData({
    this.input = '',
    this.output = '',
    this.description = '',
  });
}
