import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class UpdateEnrollmentStatusUseCase {
  Future<Enrollment> call({
    required String courseSlug,
    required String userId,
    required UpdateEnrollmentStatusRequest request,
  });
}

class UpdateEnrollmentStatusUseCaseImpl
    implements UpdateEnrollmentStatusUseCase {
  const UpdateEnrollmentStatusUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<Enrollment> call({
    required String courseSlug,
    required String userId,
    required UpdateEnrollmentStatusRequest request,
  }) {
    return _tasksManagementRepository.updateEnrollmentStatus(
      courseSlug: courseSlug,
      userId: userId,
      request: request,
    );
  }
}
