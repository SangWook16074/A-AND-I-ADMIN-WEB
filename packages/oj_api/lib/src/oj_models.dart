import 'package:freezed_annotation/freezed_annotation.dart';

part 'oj_models.freezed.dart';
part 'oj_models.g.dart';

@freezed
abstract class TestCase with _$TestCase {
  const factory TestCase({
    required int caseId,
    required List<dynamic> args,
    required List<String> argTypes,
    required dynamic expectedOutput,
    required String expectedOutputType,
  }) = _TestCase;

  factory TestCase.fromJson(Map<String, dynamic> json) => _$TestCaseFromJson(json);
}

@freezed
abstract class ProblemTestCases with _$ProblemTestCases {
  const factory ProblemTestCases({
    required String problemId,
    required List<TestCase> testCases,
    required DateTime updatedAt,
  }) = _ProblemTestCases;

  factory ProblemTestCases.fromJson(Map<String, dynamic> json) => _$ProblemTestCasesFromJson(json);
}

@freezed
abstract class SubmissionTestCase with _$SubmissionTestCase {
  const factory SubmissionTestCase({
    required int caseId,
    required String status,
    required double timeMs,
    required double memoryMb,
    required dynamic output,
    required String? error,
  }) = _SubmissionTestCase;

  factory SubmissionTestCase.fromJson(Map<String, dynamic> json) => _$SubmissionTestCaseFromJson(json);
}

@freezed
abstract class Submission with _$Submission {
  const factory Submission({
    required String submissionId,
    required String submitterId,
    required String submitterPublicCode,
    required String problemId,
    required String language,
    required String code,
    required String status,
    required List<SubmissionTestCase> testCases,
    required DateTime createdAt,
    required DateTime? completedAt,
  }) = _Submission;

  factory Submission.fromJson(Map<String, dynamic> json) => _$SubmissionFromJson(json);
}
