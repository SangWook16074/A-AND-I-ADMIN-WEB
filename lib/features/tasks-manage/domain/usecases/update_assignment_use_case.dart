import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

class UpdateAssignmentUseCase {
  final TasksManagementRepository repository;

  UpdateAssignmentUseCase(this.repository);

  Future<Assignment> execute({
    required String courseSlug,
    required String assignmentId,
    required UpdateAssignmentRequest request,
  }) {
    return repository.updateAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
      request: request,
    );
  }
}
