import 'package:aandi_auth/aandi_auth.dart';
import '../../domain/entities/problem_test_cases.dart';
import '../../domain/entities/submission.dart';
import '../../domain/entities/submission_test_case.dart';
import '../../domain/entities/test_case.dart';
import '../../domain/repositories/oj_management_repository.dart';
import '../datasources/oj_management_api_client.dart';

class OjManagementRepositoryImpl implements OjManagementRepository {
  OjManagementRepositoryImpl({
    required OjManagementApiClient apiClient,
    required TokenStore tokenStore,
  }) : _apiClient = apiClient,
       _tokenStore = tokenStore;

  final OjManagementApiClient _apiClient;
  final TokenStore _tokenStore;

  @override
  Future<List<ProblemTestCases>> getTestCases() async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw OjManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dtos = await _apiClient.getTestCases(accessToken: accessToken);
    return dtos.map((dto) => ProblemTestCases(
      problemId: dto.problemId,
      updatedAt: dto.updatedAt,
      testCases: dto.testCases.map((tc) => TestCase(
        caseId: tc.caseId,
        args: tc.args,
        argTypes: tc.argTypes,
        expectedOutput: tc.expectedOutput,
        expectedOutputType: tc.expectedOutputType,
      )).toList(),
    )).toList();
  }

  @override
  Future<List<Submission>> getSubmissions() async {
    final token = await _tokenStore.read();
    final accessToken = token?.accessToken;
    if (accessToken == null || accessToken.isEmpty) {
      throw OjManagementApiException('인증 토큰이 없습니다. 다시 로그인해주세요.');
    }

    final dtos = await _apiClient.getSubmissions(accessToken: accessToken);
    return dtos.map((dto) => Submission(
      submissionId: dto.submissionId,
      submitterId: dto.submitterId,
      submitterPublicCode: dto.submitterPublicCode,
      problemId: dto.problemId,
      language: dto.language,
      code: dto.code,
      status: dto.status,
      createdAt: dto.createdAt,
      completedAt: dto.completedAt,
      testCases: dto.testCases.map((tc) => SubmissionTestCase(
        caseId: tc.caseId,
        status: tc.status,
        timeMs: tc.timeMs,
        memoryMb: tc.memoryMb,
        output: tc.output,
        error: tc.error,
      )).toList(),
    )).toList();
  }
}
