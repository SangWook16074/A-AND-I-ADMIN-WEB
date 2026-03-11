import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class UpdateAssignmentUseCase {
  Future<Assignment> call({
    required String courseSlug,
    required String assignmentId,
    required UpdateAssignmentRequest request,
  });
}

class UpdateAssignmentUseCaseImpl implements UpdateAssignmentUseCase {
  const UpdateAssignmentUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<Assignment> call({
    required String courseSlug,
    required String assignmentId,
    required UpdateAssignmentRequest request,
  }) {
    return _tasksManagementRepository.updateAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
      request: request,
    );
  }
}
