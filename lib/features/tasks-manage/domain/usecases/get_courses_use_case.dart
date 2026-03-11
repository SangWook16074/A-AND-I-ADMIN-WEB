import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

abstract interface class GetCoursesUseCase {
  Future<List<CourseSummary>> call();
}

class GetCoursesUseCaseImpl implements GetCoursesUseCase {
  const GetCoursesUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<List<CourseSummary>> call() => _repository.getCourses();
}
