import 'package:aandi_auth/aandi_auth.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:aandi_course_api/aandi_course_api.dart';

import '../../data/repositories/tasks_management_repository_impl.dart';
import '../../domain/repositories/tasks_management_repository.dart';
import '../../domain/usecases/create_course_use_case.dart';
import '../../domain/usecases/get_courses_use_case.dart';
import 'tasks_management_event.dart';
import 'tasks_management_state.dart';

part 'tasks_management_bloc.g.dart';

@Riverpod(keepAlive: true)
CourseApiClient tasksCourseApiClient(Ref ref) {
  return CourseApiClient(
    baseUrl: ref.watch(authBaseUrlProvider),
    dio: Dio(),
  );
}

@Riverpod(keepAlive: true)
TasksManagementRepository tasksManagementRepository(Ref ref) {
  return TasksManagementRepositoryImpl(
    apiClient: ref.watch(tasksCourseApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

@Riverpod(keepAlive: true)
GetCoursesUseCase getCoursesUseCase(Ref ref) {
  return GetCoursesUseCaseImp(ref.watch(tasksManagementRepositoryProvider));
}

@Riverpod(keepAlive: true)
CreateCourseUseCase createCourseUseCase(Ref ref) {
  return CreateCourseUseCase(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@riverpod
class TasksManagementBloc extends _$TasksManagementBloc {
  @override
  TasksManagementState build() {
    Future.microtask(() => onEvent(const TasksManagementStarted()));
    return const TasksManagementState.initial();
  }

  Future<void> onEvent(TasksManagementEvent event) async {
    switch (event) {
      case TasksManagementStarted():
      case TasksManagementRefreshRequested():
        await _loadCourses();
      case TasksManagementCreateCourseRequested(
          slug: final slug,
          title: final title,
          description: final description,
          phase: final phase,
          targetTrack: final targetTrack,
          startDate: final startDate,
          endDate: final endDate,
        ):
        await _createCourse(
          slug: slug,
          title: title,
          description: description,
          phase: phase,
          targetTrack: targetTrack,
          startDate: startDate,
          endDate: endDate,
        );
    }
  }

  Future<void> _loadCourses() async {
    state = state.copyWith(status: TasksManagementStatus.loading, clearError: true);
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
