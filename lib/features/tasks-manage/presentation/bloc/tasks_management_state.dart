import 'package:aandi_course_api/aandi_course_api.dart';

enum TasksManagementStatus { initial, loading, success, failure }

class TasksManagementState {
  const TasksManagementState({
    required this.status,
    required this.courses,
    required this.isCreating,
    this.errorMessage,
  });

  const TasksManagementState.initial()
      : status = TasksManagementStatus.initial,
        courses = const [],
        isCreating = false,
        errorMessage = null;

  final TasksManagementStatus status;
  final List<CourseSummary> courses;
  final bool isCreating;
  final String? errorMessage;

  TasksManagementState copyWith({
    TasksManagementStatus? status,
    List<CourseSummary>? courses,
    bool? isCreating,
    String? errorMessage,
    bool clearError = false,
  }) {
    return TasksManagementState(
      status: status ?? this.status,
      courses: courses ?? this.courses,
      isCreating: isCreating ?? this.isCreating,
      errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
    );
  }
}
