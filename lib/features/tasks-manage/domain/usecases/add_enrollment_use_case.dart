import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

class AddEnrollmentUseCase {
  final TasksManagementRepository repository;

  AddEnrollmentUseCase(this.repository);

  Future<Enrollment> execute({
    required String courseSlug,
    required AddEnrollmentRequest request,
  }) {
    return repository.addEnrollment(
      courseSlug: courseSlug,
      request: request,
    );
  }
}
