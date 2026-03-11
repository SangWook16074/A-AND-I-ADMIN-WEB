import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/tasks_management_repository_impl.dart';
import '../../domain/repositories/tasks_management_repository.dart';
import '../../domain/usecases/create_course_use_case.dart';
import '../../domain/usecases/get_courses_use_case.dart';

part 'tasks_management_providers.g.dart';

@Riverpod(keepAlive: true)
CourseApiClient tasksCourseApiClient(Ref ref) {
  return CourseApiClient(baseUrl: ref.watch(authBaseUrlProvider), dio: Dio());
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
  return CreateCourseUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}
