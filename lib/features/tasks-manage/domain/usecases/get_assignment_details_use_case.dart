import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetAssignmentDetailsUseCase {
  Future<Assignment> call({
    required String courseSlug,
    required String assignmentId,
  });
}

class GetAssignmentDetailsUseCaseImpl implements GetAssignmentDetailsUseCase {
  const GetAssignmentDetailsUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<Assignment> call({
    required String courseSlug,
    required String assignmentId,
  }) {
    return _tasksManagementRepository.getAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
