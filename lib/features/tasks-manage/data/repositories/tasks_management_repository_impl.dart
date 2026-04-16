import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_course_api/aandi_course_api.dart';

import '../../domain/repositories/tasks_management_repository.dart';

class TasksManagementRepositoryImpl implements TasksManagementRepository {
  TasksManagementRepositoryImpl({
    required CourseApiClient apiClient,
    required TokenStore tokenStore,
  }) : _apiClient = apiClient,
       _tokenStore = tokenStore;

  final CourseApiClient _apiClient;
  final TokenStore _tokenStore;

  Future<String> _getAccessToken() async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw AuthApiException('인증 토큰이 없습니다.', statusCode: 401);
    }
    return accessToken;
  }

  @override
  Future<void> deleteCourse({required String slug}) async {
    final token = await _getAccessToken();
    return _apiClient.deleteCourse(accessToken: token, courseSlug: slug);
  }

  @override
  Future<List<CourseSummary>> getCourses() async {
    final token = await _getAccessToken();
    return _apiClient.getCourses(accessToken: token);
  }

  @override
  Future<CourseSummary> updateCourse({
    required String courseSlug,
    required UpdateCourseRequest request,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.updateCourse(
      accessToken: token,
      courseSlug: courseSlug,
      request: request,
    );
  }

  @override
  Future<CourseSummary> createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.createCourse(
      accessToken: token,
      request: CreateCourseRequest(
        slug: slug,
        title: title,
        description: description,
        phase: phase,
        targetTrack: targetTrack,
        startDate: startDate,
        endDate: endDate,
      ),
    );
  }

  @override
  Future<List<Enrollment>> getEnrollments({required String courseSlug}) async {
    final token = await _getAccessToken();
    return _apiClient.getEnrollments(
      accessToken: token,
      courseSlug: courseSlug,
    );
  }

  @override
  Future<Enrollment> addEnrollment({
    required String courseSlug,
    required AddEnrollmentRequest request,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.addEnrollment(
      accessToken: token,
      courseSlug: courseSlug,
      request: request,
    );
  }

  @override
  Future<Enrollment> updateEnrollmentStatus({
    required String courseSlug,
    required String userId,
    required UpdateEnrollmentStatusRequest request,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.updateEnrollmentStatus(
      accessToken: token,
      courseSlug: courseSlug,
      userId: userId,
      request: request,
    );
  }

  @override
  Future<void> deleteEnrollment({
    required String courseSlug,
    required String userId,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.deleteEnrollment(
      accessToken: token,
      courseSlug: courseSlug,
      userId: userId,
    );
  }

  @override
  Future<List<Assignment>> getAssignments({
    required String courseSlug,
    int? weekNo,
    String? status,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.getAssignments(
      accessToken: token,
      courseSlug: courseSlug,
      weekNo: weekNo,
      status: status,
    );
  }

  @override
  Future<Assignment> getAssignment({
    required String courseSlug,
    required String assignmentId,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.getAssignment(
      accessToken: token,
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }

  @override
  Future<AssignmentSubmissionStatuses> getAssignmentSubmissionStatuses({
    required String courseSlug,
    required String assignmentId,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.getAssignmentSubmissionStatuses(
      accessToken: token,
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }

  @override
  Future<Assignment> createAssignment({
    required String courseSlug,
    required CreateAssignmentRequest request,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.createAssignment(
      accessToken: token,
      courseSlug: courseSlug,
      request: request,
    );
  }

  @override
  Future<void> deleteAssignment({
    required String courseSlug,
    required String assignmentId,
  }) async {
    final token = await _getAccessToken();
    await _apiClient.deleteAssignment(
      accessToken: token,
      courseSlug: courseSlug,
      assignmentId: assignmentId,
    );
  }

  @override
  Future<Assignment> updateAssignment({
    required String courseSlug,
    required String assignmentId,
    required UpdateAssignmentRequest request,
  }) async {
    final token = await _getAccessToken();
    return _apiClient.updateAssignment(
      accessToken: token,
      courseSlug: courseSlug,
      assignmentId: assignmentId,
      request: request,
    );
  }
}
