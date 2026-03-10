import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

abstract interface class GetCoursesUseCase {
  Future<List<CourseSummary>> call();
}

class GetCoursesUseCaseImp implements GetCoursesUseCase {
  const GetCoursesUseCaseImp(this.repository);

  final TasksManagementRepository repository;

  @override
  Future<List<CourseSummary>> call() => repository.getCourses();
}
