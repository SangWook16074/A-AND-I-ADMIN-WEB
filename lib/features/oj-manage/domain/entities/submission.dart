import 'submission_test_case.dart';

class Submission {
  const Submission({
    required this.submissionId,
    required this.submitterId,
    required this.submitterPublicCode,
    required this.problemId,
    required this.language,
    required this.code,
    required this.status,
    required this.testCases,
    required this.createdAt,
    required this.completedAt,
  });

  final String submissionId;
  final String submitterId;
  final String submitterPublicCode;
  final String problemId;
  final String language;
  final String code;
  final String status;
  final List<SubmissionTestCase> testCases;
  final DateTime createdAt;
  final DateTime? completedAt;
}
