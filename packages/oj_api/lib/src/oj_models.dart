import 'package:freezed_annotation/freezed_annotation.dart';

part 'oj_models.freezed.dart';
part 'oj_models.g.dart';

@freezed
abstract class TestCase with _$TestCase {
  const factory TestCase({
    required int caseId,
    required List<dynamic> args,
    required String expectedOutput,
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
