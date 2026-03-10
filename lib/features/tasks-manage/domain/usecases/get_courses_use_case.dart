import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

class GetCoursesUseCase {
  const GetCoursesUseCase(this.repository);

  final TasksManagementRepository repository;

  Future<List<CourseSummary>> call() => repository.getCourses();
}
