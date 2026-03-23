import '../entities/problem_test_cases.dart';
import '../entities/submission.dart';

abstract interface class OjManagementRepository {
  Future<List<ProblemTestCases>> getTestCases();
  Future<List<Submission>> getSubmissions();
}
