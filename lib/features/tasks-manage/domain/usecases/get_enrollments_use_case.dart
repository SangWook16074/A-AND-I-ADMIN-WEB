import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class GetEnrollmentsUseCase {
  Future<List<Enrollment>> call({required String courseSlug});
}

class GetEnrollmentsUseCaseImpl implements GetEnrollmentsUseCase {
  const GetEnrollmentsUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<List<Enrollment>> call({required String courseSlug}) {
    return _tasksManagementRepository.getEnrollments(courseSlug: courseSlug);
  }
}
