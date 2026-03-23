// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oj_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TestCase _$TestCaseFromJson(Map<String, dynamic> json) => _TestCase(
  caseId: (json['caseId'] as num).toInt(),
  args: json['args'] as List<dynamic>,
  expectedOutput: json['expectedOutput'] as String,
);

Map<String, dynamic> _$TestCaseToJson(_TestCase instance) => <String, dynamic>{
  'caseId': instance.caseId,
  'args': instance.args,
  'expectedOutput': instance.expectedOutput,
};

_ProblemTestCases _$ProblemTestCasesFromJson(Map<String, dynamic> json) =>
    _ProblemTestCases(
      problemId: json['problemId'] as String,
      testCases: (json['testCases'] as List<dynamic>)
          .map((e) => TestCase.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProblemTestCasesToJson(_ProblemTestCases instance) =>
    <String, dynamic>{
      'problemId': instance.problemId,
      'testCases': instance.testCases,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
