import 'package:aandi_course_api/aandi_course_api.dart';

import '../repositories/tasks_management_repository.dart';

abstract interface class CreateOrUpdateWeekUseCase {
  Future<CourseWeek> call({
    required String courseSlug,
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  });
}

class CreateOrUpdateWeekUseCaseImpl implements CreateOrUpdateWeekUseCase {
  const CreateOrUpdateWeekUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<CourseWeek> call({
    required String courseSlug,
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  }) {
    return _tasksManagementRepository.createOrUpdateWeek(
      courseSlug: courseSlug,
      weekNo: weekNo,
      title: title,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
