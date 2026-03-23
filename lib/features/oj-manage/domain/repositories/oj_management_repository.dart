import '../entities/problem_test_cases.dart';

abstract interface class OjManagementRepository {
  Future<List<ProblemTestCases>> getTestCases();
}
