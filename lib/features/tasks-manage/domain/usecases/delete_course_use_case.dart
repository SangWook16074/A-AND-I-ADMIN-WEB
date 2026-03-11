import '../repositories/tasks_management_repository.dart';

abstract interface class DeleteCourseUseCase {
  Future<void> call({required String slug});
}

class DeleteCourseUseCaseImpl implements DeleteCourseUseCase {
  const DeleteCourseUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<void> call({required String slug}) {
    return _tasksManagementRepository.deleteCourse(slug: slug);
  }
}
