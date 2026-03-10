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
  }) = _CreateCourseRequest;

  factory CreateCourseRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateCourseRequestFromJson(json);
}
