import 'package:aandi_oj_api/aandi_oj_api.dart' as oj_api;
import 'package:dio/dio.dart';

class OjManagementApiException implements Exception {
  OjManagementApiException(this.message, {this.statusCode, this.code});
  final String message;
  final int? statusCode;
  final String? code;

  @override
  String toString() => message;
}

class OjManagementApiClient {
  OjManagementApiClient({required this.baseUrl, Dio? dio})
    : apiClient = oj_api.OjApiClient(baseUrl: baseUrl, dio: dio);

  final String baseUrl;
  final oj_api.OjApiClient apiClient;

  Future<List<oj_api.ProblemTestCases>> getTestCases({required String accessToken}) async {
    try {
      return await apiClient.getTestCases(accessToken: accessToken);
    } catch (e) {
      if (e is oj_api.OjApiException) {
        throw OjManagementApiException(
          e.message,
          statusCode: e.statusCode,
          code: e.code,
        );
      }
      if (e is DioException) {
        throw OjManagementApiException(
          e.message ?? '테스트 케이스를 불러오는 중 오류가 발생했습니다.',
          statusCode: e.response?.statusCode,
        );
      }
      throw OjManagementApiException(e.toString());
    }
  }

  Future<List<oj_api.Submission>> getSubmissions({required String accessToken}) async {
    try {
      return await apiClient.getSubmissions(accessToken: accessToken);
    } catch (e) {
      if (e is oj_api.OjApiException) {
        throw OjManagementApiException(
          e.message,
          statusCode: e.statusCode,
          code: e.code,
        );
      }
      if (e is DioException) {
        throw OjManagementApiException(
          e.message ?? '제출 내역을 불러오는 중 오류가 발생했습니다.',
          statusCode: e.response?.statusCode,
        );
      }
      throw OjManagementApiException(e.toString());
    }
  }
}
