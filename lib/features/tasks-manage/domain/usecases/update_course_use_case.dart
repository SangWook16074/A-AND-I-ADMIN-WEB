import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

abstract interface class UpdateCourseUseCase {
  Future<CourseSummary> call({
    required String courseSlug,
    required UpdateCourseRequest request,
  });
}

class UpdateCourseUseCaseImpl implements UpdateCourseUseCase {
  const UpdateCourseUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

  @override
  Future<CourseSummary> call({
    required String courseSlug,
    required UpdateCourseRequest request,
  }) {
    return _tasksManagementRepository.updateCourse(
      courseSlug: courseSlug,
      request: request,
    );
  }
}
