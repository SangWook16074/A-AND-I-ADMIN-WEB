import 'test_case.dart';

class ProblemTestCases {
  const ProblemTestCases({
    required this.problemId,
    required this.testCases,
    required this.updatedAt,
  });

  final String problemId;
  final List<TestCase> testCases;
  final DateTime updatedAt;
}
