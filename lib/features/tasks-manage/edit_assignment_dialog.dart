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

  @override
  void initState() {
    super.initState();
    _orderInWeek = widget.assignment.orderInWeek;
    _title = widget.assignment.metadata.title;
    _difficulty = widget.assignment.metadata.difficulty;
    _description = widget.assignment.metadata.description ?? '';
    _startAt = widget.assignment.startAt;
    _endAt = widget.assignment.endAt;
    _learningGoals = widget.assignment.metadata.learningGoals.join(', ');
    _language = widget.assignment.metadata.attributes['language'] ?? 'kotlin';
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final requirements = widget.assignment.requirements;
      final examples = widget.assignment.examples;
      
      final request = UpdateAssignmentRequest(
        orderInWeek: _orderInWeek,
        startAt: _startAt,
        endAt: _endAt,
        metadata: AssignmentMetadata(
          title: _title,
          difficulty: _difficulty,
          description: _description.isEmpty ? null : _description,
          timeLimitMinutes: widget.assignment.metadata.timeLimitMinutes,
          learningGoals: _learningGoals.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList(),
          attributes: {
            ...widget.assignment.metadata.attributes,
            'language': _language,
          },
        ),
        requirements: requirements,
        examples: examples,
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
                              initialValue: _startAt,
                              decoration: const InputDecoration(
                                labelText: '시작 일시 *',
                                hintText: '2026-03-04T09:00:00+09:00',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onSaved: (v) => _startAt = v?.trim() ?? '',
                              validator: (v) => v == null || v.trim().isEmpty ? '필수' : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextFormField(
                              initialValue: _endAt,
                              decoration: const InputDecoration(
                                labelText: '종료 일시 *',
                                hintText: '2026-03-12T08:59:59+09:00',
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              onSaved: (v) => _endAt = v?.trim() ?? '',
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
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: FilledButton(
                  onPressed: _submit,
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
