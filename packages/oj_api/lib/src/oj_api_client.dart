import 'package:aandi_api_protocol/aandi_api_protocol.dart';
import 'package:dio/dio.dart';
import 'oj_models.dart';
import 'oj_api_exceptions.dart';

class OjApiClient {
  OjApiClient({required this.baseUrl, Dio? dio}) : dio = dio ?? Dio() {
    ensureAandiProtocolInterceptor(this.dio);
  }

  static const _testCasesPath = '/v2/admin/testcases';
  static const _submissionsPath = '/v2/admin/submissions';

  final String baseUrl;
  final Dio dio;

  Future<List<ProblemTestCases>> getTestCases({
    required String accessToken,
  }) async {
    try {
      final response = await dio.get<dynamic>(
        '$baseUrl$_testCasesPath',
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
        return data
            .map((e) => ProblemTestCases.fromJson(e as Map<String, dynamic>))
            .toList();
      } else if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => ProblemTestCases.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      throw OjApiException('Unexpected response format for test cases');
    } on DioException catch (e) {
      final error = _extractError(e.response?.data);
      throw OjApiException(
        error?.message ??
            e.message ??
            'An error occurred while fetching test cases',
        statusCode: e.response?.statusCode,
        code: error?.code,
        alert: error?.alert,
      );
    } catch (e) {
      throw OjApiException(e.toString());
    }
  }

  Future<List<Submission>> getSubmissions({required String accessToken}) async {
    try {
      final response = await dio.get<dynamic>(
        '$baseUrl$_submissionsPath',
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
        return data
            .map((e) => Submission.fromJson(e as Map<String, dynamic>))
            .toList();
      } else if (data is Map<String, dynamic> && data['data'] is List) {
        return (data['data'] as List)
            .map((e) => Submission.fromJson(e as Map<String, dynamic>))
            .toList();
      }

      throw OjApiException('Unexpected response format for submissions');
    } on DioException catch (e) {
      final error = _extractError(e.response?.data);
      throw OjApiException(
        error?.message ??
            e.message ??
            'An error occurred while fetching submissions',
        statusCode: e.response?.statusCode,
        code: error?.code,
        alert: error?.alert,
      );
    } catch (e) {
      throw OjApiException(e.toString());
    }
  }

  _ApiError? _extractError(dynamic responseData) {
    if (responseData is! Map) {
      return null;
    }

    final error = responseData['error'];
    if (error is Map) {
      return _ApiError(
        message: error['message']?.toString(),
        code: error['code']?.toString(),
        alert: error['alert']?.toString(),
      );
    }

    return _ApiError(
      message: responseData['message']?.toString(),
      code: responseData['code']?.toString(),
      alert: responseData['alert']?.toString(),
    );
  }
}

final class _ApiError {
  const _ApiError({this.message, this.code, this.alert});

  final String? message;
  final String? code;
  final String? alert;
}
