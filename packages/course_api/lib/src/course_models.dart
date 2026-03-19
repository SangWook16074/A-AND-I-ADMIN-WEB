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
    @Default('') String id,
    @Default('') String userId,
    @Default('ACTIVE') String status,
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
    int? timeLimitMinutes,
    @Default([]) List<LearningGoal> learningGoals,
    @Default([]) List<AssignmentRequirement> requirements,
    @Default([]) List<AssignmentExample> examples,
    @Default({}) Map<String, dynamic> attributes,
    Map<String, dynamic>? problemDetail,
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
abstract class AssignmentExample with _$AssignmentExample {
  const factory AssignmentExample({
    required int seq,
    String? inputText,
    String? outputText,
    String? description,
  }) = _AssignmentExample;

  factory AssignmentExample.fromJson(Map<String, dynamic> json) =>
      _$AssignmentExampleFromJson(json);
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

@freezed
abstract class UpdateEnrollmentStatusRequest
    with _$UpdateEnrollmentStatusRequest {
  const factory UpdateEnrollmentStatusRequest({
    required String status,
    String? banReason,
  }) = _UpdateEnrollmentStatusRequest;

  factory UpdateEnrollmentStatusRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEnrollmentStatusRequestFromJson(json);
}
