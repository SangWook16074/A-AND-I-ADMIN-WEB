import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetAssignmentDeliveriesUseCase {
  Future<List<AssignmentDelivery>> call({
    required String courseSlug,
    required String assignmentId,
    String? status,
  });
}

class GetAssignmentDeliveriesUseCaseImpl implements GetAssignmentDeliveriesUseCase {
  const GetAssignmentDeliveriesUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<List<AssignmentDelivery>> call({
    required String courseSlug,
    required String assignmentId,
    String? status,
  }) {
    return _repository.getAssignmentDeliveries(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
      status: status,
    );
  }
}
