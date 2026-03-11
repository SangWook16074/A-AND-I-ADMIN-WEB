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

  Future<CourseWeek> createOrUpdateWeek({
    required String courseSlug,
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  });

  Future<List<Enrollment>> getEnrollments({
    required String courseSlug,
  });

  Future<List<Assignment>> getAssignments({
    required String courseSlug,
    int? weekNo,
    String? status,
  });

  Future<Assignment> createAssignment({
    required String courseSlug,
    required CreateAssignmentRequest request,
  });
}
