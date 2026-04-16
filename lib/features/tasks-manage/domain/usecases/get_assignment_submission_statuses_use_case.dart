import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetAssignmentSubmissionStatusesUseCase {
  Future<AssignmentSubmissionStatuses> call({
    required String courseSlug,
    required String assignmentId,
  });
}

class GetAssignmentSubmissionStatusesUseCaseImpl
    implements GetAssignmentSubmissionStatusesUseCase {
  const GetAssignmentSubmissionStatusesUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<AssignmentSubmissionStatuses> call({
    required String courseSlug,
    required String assignmentId,
  }) {
    return _tasksManagementRepository.getAssignmentSubmissionStatuses(
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }
}
