import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

class CreateCourseUseCase {
  const CreateCourseUseCase(this.repository);

  final TasksManagementRepository repository;

  Future<CourseSummary> call({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
  }) {
    return repository.createCourse(
      slug: slug,
      title: title,
      description: description,
      phase: phase,
      targetTrack: targetTrack,
    );
  }
}
