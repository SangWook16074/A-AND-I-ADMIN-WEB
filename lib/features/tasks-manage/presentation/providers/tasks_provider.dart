import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';
import 'package:http/http.dart' as http;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/repositories/tasks_management_repository.dart';
import '../../domain/usecases/get_courses_use_case.dart';
import '../../domain/usecases/create_course_use_case.dart';
import '../../data/repositories/tasks_management_repository_impl.dart';

part 'tasks_provider.g.dart';
part 'tasks_provider.freezed.dart';

enum CourseListViewStatus { init, loading, done, error }

@freezed
abstract class CourseViewState with _$CourseViewState {
  const factory CourseViewState({
    @Default(CourseListViewStatus.init) CourseListViewStatus status,
    @Default([]) List<CourseSummary> courses,
    @Default("") String errorMessage,
  }) = _CourseViewState;
}

@Riverpod(keepAlive: true)
AdminApiClient tasksAdminApiClient(Ref ref) {
  return AdminApiClient(
    baseUrl: ref.watch(authBaseUrlProvider),
    client: http.Client(),
  );
}

@Riverpod(keepAlive: true)
TasksManagementRepository tasksManagementRepository(Ref ref) {
  return TasksManagementRepositoryImpl(
    apiClient: ref.watch(tasksAdminApiClientProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
}

@Riverpod(keepAlive: true)
GetCoursesUseCase getCoursesUseCase(Ref ref) {
  return GetCoursesUseCase(ref.watch(tasksManagementRepositoryProvider));
}

@Riverpod(keepAlive: true)
CreateCourseUseCase createCourseUseCase(Ref ref) {
  return CreateCourseUseCase(ref.watch(tasksManagementRepositoryProvider));
}

@riverpod
AsyncValue<List<CourseSummary>> courses(Ref ref) {
  final state = ref.watch(coursesNotifierProvider);
  return switch (state.status) {
    CourseListViewStatus.init ||
    CourseListViewStatus.loading => const AsyncValue.loading(),
    CourseListViewStatus.done => AsyncValue.data(state.courses),
    CourseListViewStatus.error => AsyncValue.error('', StackTrace.empty),
  };
}

@riverpod
class CoursesNotifier extends _$CoursesNotifier {
  @override
  CourseViewState build() {
    Future.microtask(() => initialize());
    return const CourseViewState();
  }

  Future<void> initialize() async {
    state = state.copyWith(status: CourseListViewStatus.loading);
    try {
      final useCase = ref.read(getCoursesUseCaseProvider);
      final courses = await useCase();
      state = state.copyWith(
        status: CourseListViewStatus.done,
        courses: courses,
      );
    } catch (e) {
      state = state.copyWith(
        status: CourseListViewStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
  }) async {
    state = state.copyWith(status: CourseListViewStatus.loading);
    try {
      final useCase = ref.read(createCourseUseCaseProvider);
      await useCase(
        slug: slug,
        title: title,
        description: description,
        phase: phase,
        targetTrack: targetTrack,
      );

      await initialize();
    } catch (e) {
      state = state.copyWith(
        status: CourseListViewStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}
