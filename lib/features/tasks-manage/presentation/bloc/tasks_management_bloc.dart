import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../providers/tasks_management_providers.dart';
import 'tasks_management_event.dart';
import 'tasks_management_state.dart';

part 'tasks_management_bloc.g.dart';

@riverpod
class TasksManagementBloc extends _$TasksManagementBloc {
  final Map<Type, Future<void> Function(dynamic)> _handlers = {};

  void on<T extends TasksManagementEvent>(Future<void> Function(T event) handler) {
    _handlers[T] = (event) => handler(event as T);
  }

  void add(TasksManagementEvent event) {
    final handler = _handlers[event.runtimeType];
    if (handler != null) {
      handler(event);
    }
  }

  @override
  TasksManagementState build() {
    on<TasksManagementStarted>((event) async => _loadCourses());
    on<TasksManagementRefreshRequested>((event) async => _loadCourses());
    on<TasksManagementCreateCourseRequested>((event) async {
      await _createCourse(
        slug: event.slug,
        title: event.title,
        description: event.description,
        phase: event.phase,
        targetTrack: event.targetTrack,
        startDate: event.startDate,
        endDate: event.endDate,
      );
    });

    Future.microtask(() => add(const TasksManagementStarted()));
    return const TasksManagementState.initial();
  }

  Future<void> _loadCourses() async {
    state = state.copyWith(
      status: TasksManagementStatus.loading,
      clearError: true,
    );
    try {
      final useCase = ref.read(getCoursesUseCaseProvider);
      final courses = await useCase();
      state = state.copyWith(
        status: TasksManagementStatus.success,
        courses: courses,
      );
    } catch (e) {
      state = state.copyWith(
        status: TasksManagementStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);
    try {
      final useCase = ref.read(createCourseUseCaseProvider);
      await useCase(
        slug: slug,
        title: title,
        description: description,
        phase: phase,
        targetTrack: targetTrack,
        startDate: startDate,
        endDate: endDate,
      );

      await _loadCourses();
      state = state.copyWith(isCreating: false);
    } catch (e) {
      state = state.copyWith(
        status: TasksManagementStatus.failure,
        isCreating: false,
        errorMessage: e.toString(),
      );
    }
  }
}
