import 'package:aandi_admin_api/aandi_admin_api.dart';

abstract interface class TasksManagementRepository {
  Future<List<CourseSummary>> getCourses();
  Future<CourseSummary> createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
  });
}
