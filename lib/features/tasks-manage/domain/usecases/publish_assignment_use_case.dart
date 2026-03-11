import '../repositories/tasks_management_repository.dart';

abstract interface class PublishAssignmentUseCase {
  Future<void> call({required String courseSlug, required String assignmentId});
}

class PublishAssignmentUseCaseImpl implements PublishAssignmentUseCase {
  const PublishAssignmentUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<void> call({
    required String courseSlug,
    required String assignmentId,
  }) async {
    return _tasksManagementRepository.publishAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
