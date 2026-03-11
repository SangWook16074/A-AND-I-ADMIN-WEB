import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetAssignmentsUseCase {
  Future<List<Assignment>> call({
    required String courseSlug,
    int? weekNo,
    String? status,
  });
}

class GetAssignmentsUseCaseImpl implements GetAssignmentsUseCase {
  const GetAssignmentsUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<List<Assignment>> call({
    required String courseSlug,
    int? weekNo,
    String? status,
  }) {
    return _repository.getAssignments(
      courseSlug: courseSlug,
      weekNo: weekNo,
      status: status,
    );
  }
}
