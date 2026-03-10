import 'package:aandi_course_api/aandi_course_api.dart';

abstract interface class TasksManagementRepository {
  Future<List<CourseSummary>> getCourses();
  Future<CourseSummary> createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  });
}
