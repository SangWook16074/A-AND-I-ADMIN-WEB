import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class AddEnrollmentUseCase {
  Future<Enrollment> call({
    required String courseSlug,
    required AddEnrollmentRequest request,
  });
}

class AddEnrollmentUseCaseImpl implements AddEnrollmentUseCase {
  const AddEnrollmentUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<Enrollment> call({
    required String courseSlug,
    required AddEnrollmentRequest request,
  }) {
    return _tasksManagementRepository.addEnrollment(
      courseSlug: courseSlug,
      request: request,
    );
  }
}
