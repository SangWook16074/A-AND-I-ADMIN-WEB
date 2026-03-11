import '../repositories/tasks_management_repository.dart';

abstract interface class DeleteCourseUseCase {
  Future<void> call({required String slug});
}

class DeleteCourseUseCaseImpl implements DeleteCourseUseCase {
  const DeleteCourseUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<void> call({required String slug}) {
    return _repository.deleteCourse(slug: slug);
  }
}
