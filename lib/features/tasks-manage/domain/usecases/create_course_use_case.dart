import 'package:aandi_course_api/aandi_course_api.dart';
import '../repositories/tasks_management_repository.dart';

abstract interface class CreateCourseUseCase {
  Future<CourseSummary> call({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  });
}

class CreateCourseUseCaseImpl implements CreateCourseUseCase {
  const CreateCourseUseCaseImpl(this._repository);

  final TasksManagementRepository _repository;

  @override
  Future<CourseSummary> call({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  }) {
    return _repository.createCourse(
      slug: slug,
      title: title,
      description: description,
      phase: phase,
      targetTrack: targetTrack,
      startDate: startDate,
      endDate: endDate,
    );
  }
}
