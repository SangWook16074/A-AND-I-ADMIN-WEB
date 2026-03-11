import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_models.freezed.dart';
part 'course_models.g.dart';

@freezed
abstract class CourseSummary with _$CourseSummary {
  const factory CourseSummary({
    required String id,
    required String title,
    required String slug,
    String? description,
    required String phase,
    required String targetTrack,
    required String status,
    required DateTime createdAt,
    required DateTime updatedAt,
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
abstract class CourseWeek with _$CourseWeek {
  const factory CourseWeek({
    required String id,
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  }) = _CourseWeek;

  factory CourseWeek.fromJson(Map<String, dynamic> json) =>
      _$CourseWeekFromJson(json);
}

@freezed
abstract class CreateWeekRequest with _$CreateWeekRequest {
  const factory CreateWeekRequest({
    required int weekNo,
    required String title,
    required String startDate,
    required String endDate,
  }) = _CreateWeekRequest;

  factory CreateWeekRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateWeekRequestFromJson(json);
}

@freezed
abstract class Enrollment with _$Enrollment {
  const factory Enrollment({
    required String id,
    required String userId,
    required String status,
    required DateTime joinedAt,
    DateTime? droppedAt,
    DateTime? bannedAt,
    String? banReason,
    required DateTime updatedAt,
  }) = _Enrollment;

  factory Enrollment.fromJson(Map<String, dynamic> json) =>
      _$EnrollmentFromJson(json);
}

@freezed
abstract class AssignmentMetadata with _$AssignmentMetadata {
  const factory AssignmentMetadata({
    required String title,
    @Default('MID') String difficulty,
    String? description,
    int? timeLimitMinutes,
    @Default([]) List<String> learningGoals,
    @Default({}) Map<String, dynamic> attributes,
  }) = _AssignmentMetadata;

  factory AssignmentMetadata.fromJson(Map<String, dynamic> json) =>
      _$AssignmentMetadataFromJson(json);
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
    required String id,
    String? courseSlug,
    required int weekNo,
    required int orderInWeek,
    required String startAt,
    required String endAt,
    required String status,
    String? publishedAt,
    required AssignmentMetadata metadata,
    @Default([]) List<AssignmentRequirement> requirements,
    @Default([]) List<AssignmentExample> examples,
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
    @Default([]) List<AssignmentRequirement> requirements,
    @Default([]) List<AssignmentExample> examples,
  }) = _CreateAssignmentRequest;

  factory CreateAssignmentRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAssignmentRequestFromJson(json);
}
