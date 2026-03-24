class TestCase {
  const TestCase({
    required this.caseId,
    required this.args,
    required this.expectedOutput,
  });

  final int caseId;
  final List<dynamic> args;
  final String expectedOutput;
}
