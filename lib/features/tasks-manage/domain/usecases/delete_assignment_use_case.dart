import '../repositories/tasks_management_repository.dart';

abstract interface class DeleteAssignmentUseCase {
  Future<void> call({required String courseSlug, required String assignmentId});
}

class DeleteAssignmentUseCaseImpl implements DeleteAssignmentUseCase {
  const DeleteAssignmentUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<void> call({
    required String courseSlug,
    required String assignmentId,
  }) {
    return _tasksManagementRepository.deleteAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
