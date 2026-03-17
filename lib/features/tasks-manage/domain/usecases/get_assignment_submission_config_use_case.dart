import '../repositories/tasks_management_repository.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

abstract interface class GetAssignmentSubmissionConfigUseCase {
  Future<AssignmentSubmissionConfig> execute({
    required String courseSlug,
    required String assignmentId,
  });
}

class GetAssignmentSubmissionConfigUseCaseImpl
    implements GetAssignmentSubmissionConfigUseCase {
  GetAssignmentSubmissionConfigUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<AssignmentSubmissionConfig> execute({
    required String courseSlug,
    required String assignmentId,
  }) {
    return _tasksManagementRepository.getAssignmentSubmissionConfig(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
