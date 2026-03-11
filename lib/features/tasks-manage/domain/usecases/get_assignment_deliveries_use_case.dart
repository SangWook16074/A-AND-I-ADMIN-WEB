import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetAssignmentDeliveriesUseCase {
  Future<List<AssignmentDelivery>> call({
    required String courseSlug,
    required String assignmentId,
    String? status,
  });
}

class GetAssignmentDeliveriesUseCaseImpl
    implements GetAssignmentDeliveriesUseCase {
  const GetAssignmentDeliveriesUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<List<AssignmentDelivery>> call({
    required String courseSlug,
    required String assignmentId,
    String? status,
  }) {
    return _tasksManagementRepository.getAssignmentDeliveries(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
      status: status,
    );
  }
}
