import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class CreateAssignmentUseCase {
  Future<Assignment> call({
    required String courseSlug,
    required CreateAssignmentRequest request,
  });
}

class CreateAssignmentUseCaseImpl implements CreateAssignmentUseCase {
  const CreateAssignmentUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<Assignment> call({
    required String courseSlug,
    required CreateAssignmentRequest request,
  }) {
    return _tasksManagementRepository.createAssignment(
      courseSlug: courseSlug,
      request: request,
    );
  }
}
