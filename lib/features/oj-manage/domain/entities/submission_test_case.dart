class SubmissionTestCase {
  const SubmissionTestCase({
    required this.caseId,
    required this.status,
    required this.timeMs,
    required this.memoryMb,
    required this.output,
    required this.error,
  });

  final int caseId;
  final String status;
  final double timeMs;
  final double memoryMb;
  final dynamic output;
  final String? error;
}
