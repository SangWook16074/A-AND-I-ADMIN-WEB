import '../repositories/tasks_management_repository.dart';

abstract interface class DeleteEnrollmentUseCase {
  Future<void> execute({
    required String courseSlug,
    required String userId,
  });
}

class DeleteEnrollmentUseCaseImpl implements DeleteEnrollmentUseCase {
  DeleteEnrollmentUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<void> execute({
    required String courseSlug,
    required String userId,
  }) {
    return _repository.deleteEnrollment(
      courseSlug: courseSlug,
      userId: userId,
    );
  }
}
