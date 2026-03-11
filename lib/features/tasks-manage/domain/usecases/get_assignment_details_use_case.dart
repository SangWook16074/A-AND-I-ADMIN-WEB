import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

class GetAssignmentDetailsUseCase {
  final TasksManagementRepository _repository;

  GetAssignmentDetailsUseCase(this._repository);

  Future<Assignment> call({
    required String courseSlug,
    required String assignmentId,
  }) {
    return _repository.getAssignment(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
