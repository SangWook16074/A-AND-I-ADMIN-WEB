import '../repositories/tasks_management_repository.dart';

class DeleteAssignmentUseCase {
  final TasksManagementRepository repository;

  DeleteAssignmentUseCase(this.repository);

  Future<void> execute({
    required String courseSlug,
    required String assignmentId,
  }) {
    return repository.deleteAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
