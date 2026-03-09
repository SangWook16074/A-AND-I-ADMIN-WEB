import 'package:aandi_admin_api/aandi_admin_api.dart';
import '../repositories/tasks_management_repository.dart';

class GetCoursesUseCase {
  const GetCoursesUseCase(this.repository);

  final TasksManagementRepository repository;

  Future<List<CourseSummary>> call() => repository.getCourses();
}
