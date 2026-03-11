import 'package:aandi_course_api/aandi_course_api.dart';
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
    on<TasksManagementCourseSelected>((event) async => _selectCourse(event.course));
    on<TasksManagementEnrollmentsRequested>((event) async => _loadEnrollments(event.courseSlug));
    on<TasksManagementCreateWeekRequested>((event) async {
      await _createWeek(
        courseSlug: event.courseSlug,
        weekNo: event.weekNo,
        title: event.title,
        startDate: event.startDate,
        endDate: event.endDate,
      );
    });
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
    
    on<TasksManagementAssignmentsRequested>((event) async {
      await _loadAssignments(event.courseSlug, weekNo: event.weekNo, status: event.status);
    });

    on<TasksManagementCreateAssignmentRequested>((event) async {
      await _createAssignment(courseSlug: event.courseSlug, request: event.request);
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

  Future<void> _selectCourse(CourseSummary course) async {
    state = state.copyWith(
      selectedCourse: course,
      selectedCourseEnrollments: null,
      selectedCourseAssignments: null,
      clearError: true,
    );
    add(TasksManagementEnrollmentsRequested(course.slug));
    add(TasksManagementAssignmentsRequested(courseSlug: course.slug));
  }

  Future<void> _loadEnrollments(String courseSlug) async {
    state = state.copyWith(isLoadingDetails: true, clearError: true);
    try {
      final enrollments = await ref.read(getEnrollmentsUseCaseProvider)(courseSlug: courseSlug);
      // Ensure the course hasn't changed while loading
      if (state.selectedCourse?.slug == courseSlug) {
        state = state.copyWith(
          selectedCourseEnrollments: enrollments,
          isLoadingDetails: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: TasksManagementStatus.failure,
        isLoadingDetails: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _createWeek({
    required String courseSlug,
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);
    try {
      await ref.read(createOrUpdateWeekUseCaseProvider)(
        courseSlug: courseSlug,
        weekNo: weekNo,
        title: title,
        startDate: startDate,
        endDate: endDate,
      );

      // Successfully created/updated, reload lists if needed
      // To show immediate feedback, we could also fetch something else if needed
      state = state.copyWith(isCreating: false);
    } catch (e) {
      state = state.copyWith(
        status: TasksManagementStatus.failure,
        isCreating: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _loadAssignments(String courseSlug, {int? weekNo, String? status}) async {
    state = state.copyWith(isLoadingDetails: true, clearError: true);
    try {
      final assignments = await ref.read(getAssignmentsUseCaseProvider)(courseSlug: courseSlug, weekNo: weekNo, status: status);
      if (state.selectedCourse?.slug == courseSlug) {
        state = state.copyWith(
          selectedCourseAssignments: assignments,
          isLoadingDetails: false,
        );
      }
    } catch (e) {
      state = state.copyWith(
        status: TasksManagementStatus.failure,
        isLoadingDetails: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _createAssignment({
    required String courseSlug,
    required CreateAssignmentRequest request,
  }) async {
    state = state.copyWith(isCreating: true, clearError: true);
    try {
      await ref.read(createAssignmentUseCaseProvider)(
        courseSlug: courseSlug,
        request: request,
      );

      state = state.copyWith(isCreating: false);
      add(TasksManagementAssignmentsRequested(courseSlug: courseSlug));
    } catch (e) {
      state = state.copyWith(
        status: TasksManagementStatus.failure,
        isCreating: false,
        errorMessage: e.toString(),
      );
    }
  }
}
