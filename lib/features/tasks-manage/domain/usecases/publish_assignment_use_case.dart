import '../repositories/tasks_management_repository.dart';

abstract interface class PublishAssignmentUseCase {
  Future<void> call({
    required String courseSlug,
    required String assignmentId,
  });
}

class PublishAssignmentUseCaseImpl implements PublishAssignmentUseCase {
  const PublishAssignmentUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<void> call({
    required String courseSlug,
    required String assignmentId,
  }) async {
    return _repository.publishAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
