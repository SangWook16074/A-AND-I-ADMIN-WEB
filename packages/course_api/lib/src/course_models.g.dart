// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseSummary _$CourseSummaryFromJson(Map<String, dynamic> json) =>
    _CourseSummary(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      phase: json['phase'] as String,
      targetTrack: json['targetTrack'] as String,
      status: json['status'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$CourseSummaryToJson(_CourseSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'phase': instance.phase,
      'targetTrack': instance.targetTrack,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_CreateCourseRequest _$CreateCourseRequestFromJson(Map<String, dynamic> json) =>
    _CreateCourseRequest(
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      phase: json['phase'] as String,
      targetTrack: json['targetTrack'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$CreateCourseRequestToJson(
  _CreateCourseRequest instance,
) => <String, dynamic>{
  'title': instance.title,
  'slug': instance.slug,
  'description': instance.description,
  'phase': instance.phase,
  'targetTrack': instance.targetTrack,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
};

_CourseWeek _$CourseWeekFromJson(Map<String, dynamic> json) => _CourseWeek(
  id: json['id'] as String,
  weekNo: (json['weekNo'] as num).toInt(),
  title: json['title'] as String,
  startDate: json['startDate'] as String,
  endDate: json['endDate'] as String,
);

Map<String, dynamic> _$CourseWeekToJson(_CourseWeek instance) =>
    <String, dynamic>{
      'id': instance.id,
      'weekNo': instance.weekNo,
      'title': instance.title,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_CreateWeekRequest _$CreateWeekRequestFromJson(Map<String, dynamic> json) =>
    _CreateWeekRequest(
      weekNo: (json['weekNo'] as num).toInt(),
      title: json['title'] as String,
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
    );

Map<String, dynamic> _$CreateWeekRequestToJson(_CreateWeekRequest instance) =>
    <String, dynamic>{
      'weekNo': instance.weekNo,
      'title': instance.title,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };

_Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) => _Enrollment(
  id: json['id'] as String,
  userId: json['userId'] as String,
  status: json['status'] as String,
  joinedAt: DateTime.parse(json['joinedAt'] as String),
  droppedAt: json['droppedAt'] == null
      ? null
      : DateTime.parse(json['droppedAt'] as String),
  bannedAt: json['bannedAt'] == null
      ? null
      : DateTime.parse(json['bannedAt'] as String),
  banReason: json['banReason'] as String?,
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$EnrollmentToJson(_Enrollment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'status': instance.status,
      'joinedAt': instance.joinedAt.toIso8601String(),
      'droppedAt': instance.droppedAt?.toIso8601String(),
      'bannedAt': instance.bannedAt?.toIso8601String(),
      'banReason': instance.banReason,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
