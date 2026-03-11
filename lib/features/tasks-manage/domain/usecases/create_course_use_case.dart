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
  const CreateCourseUseCaseImpl({
    required TasksManagementRepository tasksManagementRepository,
  }) : _tasksManagementRepository = tasksManagementRepository;

  final TasksManagementRepository _tasksManagementRepository;

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
    return _tasksManagementRepository.createCourse(
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
