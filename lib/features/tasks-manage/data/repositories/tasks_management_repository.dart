import 'package:aandi_auth/aandi_auth.dart';
import 'package:aandi_admin_api/aandi_admin_api.dart';

class TasksManagementRepository {
  TasksManagementRepository({
    required AdminApiClient apiClient,
    required TokenStore tokenStore,
  }) : _apiClient = apiClient,
       _tokenStore = tokenStore;

  final AdminApiClient _apiClient;
  final TokenStore _tokenStore;

  Future<String> _getAccessToken() async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw AuthApiException('인증 토큰이 없습니다.', statusCode: 401);
    }
    return accessToken;
  }

  Future<List<CourseSummary>> getCourses() async {
    final token = await _getAccessToken();
    return _apiClient.getCourses(accessToken: token);
  }

  Future<CourseSummary> createCourse({
    required String slug,
    required String title,
    String? description,
    required String phase,
    required String targetTrack,
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
      ),
    );
  }
}
