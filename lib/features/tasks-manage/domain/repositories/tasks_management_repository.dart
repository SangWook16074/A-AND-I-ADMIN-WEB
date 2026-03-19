import 'package:aandi_course_api/aandi_course_api.dart';

abstract interface class TasksManagementRepository {
  Future<void> deleteCourse({required String slug});

  Future<CourseSummary> updateCourse({
    required String courseSlug,
    required UpdateCourseRequest request,
  });

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

  Future<List<Enrollment>> getEnrollments({required String courseSlug});

  Future<Enrollment> addEnrollment({
    required String courseSlug,
    required AddEnrollmentRequest request,
  });

  Future<Enrollment> updateEnrollmentStatus({
    required String courseSlug,
    required String userId,
    required UpdateEnrollmentStatusRequest request,
  });

  Future<void> deleteEnrollment({
    required String courseSlug,
    required String userId,
  });

  Future<List<Assignment>> getAssignments({
    required String courseSlug,
    int? weekNo,
    String? status,
  });

  Future<Assignment> getAssignment({
    required String courseSlug,
    required String assignmentId,
  });

  Future<Assignment> createAssignment({
    required String courseSlug,
    required CreateAssignmentRequest request,
  });

  Future<void> deleteAssignment({
    required String courseSlug,
    required String assignmentId,
  });




  Future<Assignment> updateAssignment({
    required String courseSlug,
    required String assignmentId,
    required UpdateAssignmentRequest request,
  });
}
