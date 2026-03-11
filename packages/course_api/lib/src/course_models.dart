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
