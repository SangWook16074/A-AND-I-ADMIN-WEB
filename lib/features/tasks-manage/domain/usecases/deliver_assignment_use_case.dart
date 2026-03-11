import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class DeliverAssignmentUseCase {
  Future<DeliverAssignmentResult> call({
    required String courseSlug,
    required String assignmentId,
  });
}

class DeliverAssignmentUseCaseImpl implements DeliverAssignmentUseCase {
  const DeliverAssignmentUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<DeliverAssignmentResult> call({
    required String courseSlug,
    required String assignmentId,
  }) {
    return _tasksManagementRepository.deliverAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
