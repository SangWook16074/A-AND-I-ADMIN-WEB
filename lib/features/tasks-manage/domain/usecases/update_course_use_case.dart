import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

abstract interface class UpdateCourseUseCase {
  Future<CourseSummary> call({
    required String courseSlug,
    required UpdateCourseRequest request,
  });
}

class UpdateCourseUseCaseImpl implements UpdateCourseUseCase {
  const UpdateCourseUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<CourseSummary> call({
    required String courseSlug,
    required UpdateCourseRequest request,
  }) {
    return _repository.updateCourse(
      courseSlug: courseSlug,
      request: request,
    );
  }
}
