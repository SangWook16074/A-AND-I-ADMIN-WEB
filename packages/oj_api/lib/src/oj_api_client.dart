import 'package:dio/dio.dart';
import 'oj_models.dart';
import 'oj_api_exceptions.dart';

class OjApiClient {
  OjApiClient({required this.baseUrl, Dio? dio}) : dio = dio ?? Dio();

  final String baseUrl;
  final Dio dio;

  Future<List<ProblemTestCases>> getTestCases({required String accessToken}) async {
    try {
      final response = await dio.get<dynamic>(
        '$baseUrl/v1/admin/testcases',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;

      // Handle both direct list and wrapped data as seen in other modules
      if (data is List) {
        return data.map((e) => ProblemTestCases.fromJson(e as Map<String, dynamic>)).toList();
      } else if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List).map((e) => ProblemTestCases.fromJson(e as Map<String, dynamic>)).toList();
      }

      throw OjApiException('Unexpected response format for test cases');
    } on DioException catch (e) {
      throw OjApiException(
        e.response?.data?['message'] ?? e.message ?? 'An error occurred while fetching test cases',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw OjApiException(e.toString());
    }
  }

  Future<List<Submission>> getSubmissions({required String accessToken}) async {
    try {
      final response = await dio.get<dynamic>(
        '$baseUrl/v1/admin/submissions',
        options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'application/json',
          },
        ),
      );

      final data = response.data;

      // Handle both direct list and wrapped data as seen in other modules
      if (data is List) {
        return data.map((e) => Submission.fromJson(e as Map<String, dynamic>)).toList();
      } else if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List).map((e) => Submission.fromJson(e as Map<String, dynamic>)).toList();
      }

      throw OjApiException('Unexpected response format for submissions');
    } on DioException catch (e) {
      throw OjApiException(
        e.response?.data?['message'] ?? e.message ?? 'An error occurred while fetching submissions',
        statusCode: e.response?.statusCode,
      );
    } catch (e) {
      throw OjApiException(e.toString());
    }
  }
}
