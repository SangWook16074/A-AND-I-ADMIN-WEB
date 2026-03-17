import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_course_api/aandi_course_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/tasks_management_repository_impl.dart';
import '../../domain/repositories/tasks_management_repository.dart';
import '../../domain/usecases/create_course_use_case.dart';

import '../../domain/usecases/get_courses_use_case.dart';
import '../../domain/usecases/get_enrollments_use_case.dart';
import '../../domain/usecases/add_enrollment_use_case.dart';
import '../../domain/usecases/update_enrollment_status_use_case.dart';
import '../../domain/usecases/get_assignments_use_case.dart';
import '../../domain/usecases/create_assignment_use_case.dart';
import '../../domain/usecases/delete_assignment_use_case.dart';
import '../../domain/usecases/get_assignment_details_use_case.dart';
import '../../domain/usecases/delete_course_use_case.dart';
import '../../domain/usecases/update_course_use_case.dart';
import '../../domain/usecases/update_assignment_use_case.dart';

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
  return GetCoursesUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CreateCourseUseCase createCourseUseCase(Ref ref) {
  return CreateCourseUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
DeleteCourseUseCase deleteCourseUseCase(Ref ref) {
  return DeleteCourseUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateCourseUseCase updateCourseUseCase(Ref ref) {
  return UpdateCourseUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetEnrollmentsUseCase getEnrollmentsUseCase(Ref ref) {
  return GetEnrollmentsUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateEnrollmentStatusUseCase updateEnrollmentStatusUseCase(Ref ref) {
  return UpdateEnrollmentStatusUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetAssignmentsUseCase getAssignmentsUseCase(Ref ref) {
  return GetAssignmentsUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
CreateAssignmentUseCase createAssignmentUseCase(Ref ref) {
  return CreateAssignmentUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
GetAssignmentDetailsUseCase getAssignmentDetailsUseCase(Ref ref) {
  return GetAssignmentDetailsUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
DeleteAssignmentUseCase deleteAssignmentUseCase(Ref ref) {
  return DeleteAssignmentUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
UpdateAssignmentUseCase updateAssignmentUseCase(Ref ref) {
  return UpdateAssignmentUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}

@Riverpod(keepAlive: true)
AddEnrollmentUseCase addEnrollmentUseCase(Ref ref) {
  return AddEnrollmentUseCaseImpl(
    tasksManagementRepository: ref.watch(tasksManagementRepositoryProvider),
  );
}
