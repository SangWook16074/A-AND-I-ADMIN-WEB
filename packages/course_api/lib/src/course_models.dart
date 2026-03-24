import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_models.freezed.dart';
part 'course_models.g.dart';

@freezed
abstract class CourseMetadata with _$CourseMetadata {
  const factory CourseMetadata({
    @Default('') String title,
    String? description,
    @Default('') String phase,
    @Default({}) Map<String, dynamic> attributes,
  }) = _CourseMetadata;

  factory CourseMetadata.fromJson(Map<String, dynamic> json) =>
      _$CourseMetadataFromJson(json);
}

@freezed
abstract class CourseSummary with _$CourseSummary {
  const factory CourseSummary({
    @Default('') String id,
    @Default('') String slug,
    @JsonKey(name: 'fieldTag') @Default('NO') String targetTrack,
    required CourseMetadata metadata,
    @Default('DRAFT') String status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? startDate,
    String? endDate,
  }) = _CourseSummary;

  factory CourseSummary.fromJson(Map<String, dynamic> json) =>
      _$CourseSummaryFromJson(json);
}

@freezed
abstract class CreateCourseRequest with _$CreateCourseRequest {
  const factory CreateCourseRequest({
    required String title,
    required String slug,
    String? description,
    required String phase,
    required String targetTrack,
    required String startDate,
    required String endDate,
  }) = _CreateCourseRequest;

  factory CreateCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCourseRequestFromJson(json);
}

@freezed
abstract class UpdateCourseRequest with _$UpdateCourseRequest {
  const factory UpdateCourseRequest({
    String? fieldTag,
    String? startDate,
    String? endDate,
    String? title,
    String? description,
    String? phase,
    String? status,
  }) = _UpdateCourseRequest;

  factory UpdateCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateCourseRequestFromJson(json);
}

@freezed
abstract class Enrollment with _$Enrollment {
  const factory Enrollment({
    String? courseId,
    String? courseSlug,
    @Default('') String userId,
    String? username,
    String? publicCode,
    @Default('ENABLED') String status,
    DateTime? joinedAt,
    DateTime? droppedAt,
    DateTime? bannedAt,
    String? banReason,
    DateTime? updatedAt,
  }) = _Enrollment;

  factory Enrollment.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentFromJson(json);
}

@freezed
abstract class AssignmentMetadata with _$AssignmentMetadata {
  const factory AssignmentMetadata({
    @Default('') String title,
    @Default('MID') String difficulty,
    String? description,
    @Default([]) List<LearningGoal> learningGoals,
    @Default([]) List<AssignmentRequirement> requirements,
    @Default([]) List<AssignmentTestCase> testCases,
    ProblemDetail? problemDetail,
    SubmissionGuide? submissionGuide,
    @Default([]) List<CodeTemplate> codeTemplates,
    @Default({}) Map<String, dynamic> attributes,
  }) = _AssignmentMetadata;

  factory AssignmentMetadata.fromJson(Map<String, dynamic> json) =>
      _$AssignmentMetadataFromJson(json);
}

@freezed
abstract class LearningGoal with _$LearningGoal {
  const factory LearningGoal({
    required int sortOrder,
    required String learningGoalText,
  }) = _LearningGoal;

  factory LearningGoal.fromJson(Map<String, dynamic> json) =>
      _$LearningGoalFromJson(json);
}

@freezed
abstract class AssignmentRequirement with _$AssignmentRequirement {
  const factory AssignmentRequirement({
    required int sortOrder,
    required String requirementText,
  }) = _AssignmentRequirement;

  factory AssignmentRequirement.fromJson(Map<String, dynamic> json) =>
      _$AssignmentRequirementFromJson(json);
}

@freezed
abstract class AssignmentTestCase with _$AssignmentTestCase {
  const factory AssignmentTestCase({
    required int seq,
    @JsonKey(name: 'inputValues', fromJson: _inputValuesFromJson)
    @Default([])
    List<dynamic> inputValues,
    String? outputText,
    @Default('PUBLIC') String visibility,
  }) = _AssignmentTestCase;

  factory AssignmentTestCase.fromJson(Map<String, dynamic> json) =>
      _$AssignmentTestCaseFromJson(json);
}

List<dynamic> _inputValuesFromJson(dynamic json) {
  if (json == null) return const <dynamic>[];
  if (json is List) {
    try {
      return List<dynamic>.from(json);
    } catch (_) {
      return const <dynamic>[];
    }
  }
  if (json is String) {
    if (json.trim().isEmpty) return const <dynamic>[];
    return <dynamic>[json];
  }
  return <dynamic>[json.toString()];
}

@freezed
abstract class ProblemDetail with _$ProblemDetail {
  const factory ProblemDetail({
    String? inputDescription,
    String? outputDescription,
    ProblemClassification? classification,
  }) = _ProblemDetail;

  factory ProblemDetail.fromJson(Map<String, dynamic> json) =>
      _$ProblemDetailFromJson(json);
}

@freezed
abstract class ProblemClassification with _$ProblemClassification {
  const factory ProblemClassification({
    String? algorithmStep,
    int? difficultyStep,
  }) = _ProblemClassification;

  factory ProblemClassification.fromJson(Map<String, dynamic> json) =>
      _$ProblemClassificationFromJson(json);
}

@freezed
abstract class SubmissionGuide with _$SubmissionGuide {
  const factory SubmissionGuide({
    String? title,
    String? description,
    @JsonKey(fromJson: _commentSectionsFromJson)
    @Default([])
    List<String> commentSections,
  }) = _SubmissionGuide;

  factory SubmissionGuide.fromJson(Map<String, dynamic> json) =>
      _$SubmissionGuideFromJson(json);
}

List<String> _commentSectionsFromJson(dynamic json) {
  if (json == null) return const [];
  if (json is List) {
    return json.map((e) => e?.toString() ?? '').toList();
  }
  if (json is String) {
    if (json.trim().isEmpty) return const [];
    return [json];
  }
  return const [];
}

@freezed
abstract class CodeTemplate with _$CodeTemplate {
  const factory CodeTemplate({
    required String language,
    String? codeTemplate,
    String? runnableTemplate,
    String? commentTemplate,
    String? functionTemplate,
  }) = _CodeTemplate;

  factory CodeTemplate.fromJson(Map<String, dynamic> json) =>
      _$CodeTemplateFromJson(json);
}

@freezed
abstract class Assignment with _$Assignment {
  const factory Assignment({
    @JsonKey(name: 'assignmentId') @Default('') String id,
    String? courseSlug,
    @Default(0) int weekNo,
    @Default(0) int orderInWeek,
    @Default('') String startAt,
    @Default('') String endAt,
    @Default('DRAFT') String status,
    String? publishedAt,
    required AssignmentMetadata metadata,
  }) = _Assignment;

  factory Assignment.fromJson(Map<String, dynamic> json) =>
      _$AssignmentFromJson(json);
}

@freezed
abstract class CreateAssignmentRequest with _$CreateAssignmentRequest {
  const factory CreateAssignmentRequest({
    required int weekNo,
    required int orderInWeek,
    required String startAt,
    required String endAt,
    required AssignmentMetadata metadata,
  }) = _CreateAssignmentRequest;

  factory CreateAssignmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssignmentRequestFromJson(json);
}

@freezed
abstract class UpdateAssignmentRequest with _$UpdateAssignmentRequest {
  const factory UpdateAssignmentRequest({
    required int orderInWeek,
    required String startAt,
    required String endAt,
    required AssignmentMetadata metadata,
    String? status,
  }) = _UpdateAssignmentRequest;

  factory UpdateAssignmentRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAssignmentRequestFromJson(json);
}

@freezed
abstract class AddEnrollmentRequest with _$AddEnrollmentRequest {
  const factory AddEnrollmentRequest({required String publicCode}) =
      _AddEnrollmentRequest;

  factory AddEnrollmentRequest.fromJson(Map<String, dynamic> json) =>
      _$AddEnrollmentRequestFromJson(json);
}

enum EnrollmentStatus {
  @JsonValue('ENABLED')
  enabled,
  @JsonValue('BANNED')
  banned,
}

@freezed
abstract class UpdateEnrollmentStatusRequest
    with _$UpdateEnrollmentStatusRequest {
  const factory UpdateEnrollmentStatusRequest({
    required EnrollmentStatus status,
    String? banReason,
  }) = _UpdateEnrollmentStatusRequest;

  factory UpdateEnrollmentStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEnrollmentStatusRequestFromJson(json);
}
