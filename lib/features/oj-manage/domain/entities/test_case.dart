class TestCase {
  const TestCase({
    required this.caseId,
    required this.args,
    required this.argTypes,
    required this.expectedOutput,
    required this.expectedOutputType,
  });

  final int caseId;
  final List<dynamic> args;
  final List<String> argTypes;
  final dynamic expectedOutput;
  final String expectedOutputType;
}
