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

_UpdateCourseRequest _$UpdateCourseRequestFromJson(Map<String, dynamic> json) =>
    _UpdateCourseRequest(
      fieldTag: json['fieldTag'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      phase: json['phase'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$UpdateCourseRequestToJson(
  _UpdateCourseRequest instance,
) => <String, dynamic>{
  'fieldTag': instance.fieldTag,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'title': instance.title,
  'description': instance.description,
  'phase': instance.phase,
  'status': instance.status,
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

_AssignmentMetadata _$AssignmentMetadataFromJson(Map<String, dynamic> json) =>
    _AssignmentMetadata(
      title: json['title'] as String,
      difficulty: json['difficulty'] as String? ?? 'MID',
      description: json['description'] as String?,
      timeLimitMinutes: (json['timeLimitMinutes'] as num?)?.toInt(),
      learningGoals:
          (json['learningGoals'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$AssignmentMetadataToJson(_AssignmentMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'difficulty': instance.difficulty,
      'description': instance.description,
      'timeLimitMinutes': instance.timeLimitMinutes,
      'learningGoals': instance.learningGoals,
      'attributes': instance.attributes,
    };

_AssignmentRequirement _$AssignmentRequirementFromJson(
  Map<String, dynamic> json,
) => _AssignmentRequirement(
  sortOrder: (json['sortOrder'] as num).toInt(),
  requirementText: json['requirementText'] as String,
);

Map<String, dynamic> _$AssignmentRequirementToJson(
  _AssignmentRequirement instance,
) => <String, dynamic>{
  'sortOrder': instance.sortOrder,
  'requirementText': instance.requirementText,
};

_AssignmentExample _$AssignmentExampleFromJson(Map<String, dynamic> json) =>
    _AssignmentExample(
      seq: (json['seq'] as num).toInt(),
      inputText: json['inputText'] as String?,
      outputText: json['outputText'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$AssignmentExampleToJson(_AssignmentExample instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'inputText': instance.inputText,
      'outputText': instance.outputText,
      'description': instance.description,
    };

_Assignment _$AssignmentFromJson(Map<String, dynamic> json) => _Assignment(
  id: json['id'] as String,
  courseSlug: json['courseSlug'] as String?,
  weekNo: (json['weekNo'] as num).toInt(),
  orderInWeek: (json['orderInWeek'] as num).toInt(),
  startAt: json['startAt'] as String,
  endAt: json['endAt'] as String,
  status: json['status'] as String,
  publishedAt: json['publishedAt'] as String?,
  metadata: AssignmentMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
  requirements:
      (json['requirements'] as List<dynamic>?)
          ?.map(
            (e) => AssignmentRequirement.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  examples:
      (json['examples'] as List<dynamic>?)
          ?.map((e) => AssignmentExample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$AssignmentToJson(_Assignment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseSlug': instance.courseSlug,
      'weekNo': instance.weekNo,
      'orderInWeek': instance.orderInWeek,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'status': instance.status,
      'publishedAt': instance.publishedAt,
      'metadata': instance.metadata,
      'requirements': instance.requirements,
      'examples': instance.examples,
    };

_CreateAssignmentRequest _$CreateAssignmentRequestFromJson(
  Map<String, dynamic> json,
) => _CreateAssignmentRequest(
  weekNo: (json['weekNo'] as num).toInt(),
  orderInWeek: (json['orderInWeek'] as num).toInt(),
  startAt: json['startAt'] as String,
  endAt: json['endAt'] as String,
  metadata: AssignmentMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
  requirements:
      (json['requirements'] as List<dynamic>?)
          ?.map(
            (e) => AssignmentRequirement.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  examples:
      (json['examples'] as List<dynamic>?)
          ?.map((e) => AssignmentExample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CreateAssignmentRequestToJson(
  _CreateAssignmentRequest instance,
) => <String, dynamic>{
  'weekNo': instance.weekNo,
  'orderInWeek': instance.orderInWeek,
  'startAt': instance.startAt,
  'endAt': instance.endAt,
  'metadata': instance.metadata,
  'requirements': instance.requirements,
  'examples': instance.examples,
};

_UpdateAssignmentRequest _$UpdateAssignmentRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateAssignmentRequest(
  orderInWeek: (json['orderInWeek'] as num).toInt(),
  startAt: json['startAt'] as String,
  endAt: json['endAt'] as String,
  metadata: AssignmentMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
  requirements:
      (json['requirements'] as List<dynamic>?)
          ?.map(
            (e) => AssignmentRequirement.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  examples:
      (json['examples'] as List<dynamic>?)
          ?.map((e) => AssignmentExample.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$UpdateAssignmentRequestToJson(
  _UpdateAssignmentRequest instance,
) => <String, dynamic>{
  'orderInWeek': instance.orderInWeek,
  'startAt': instance.startAt,
  'endAt': instance.endAt,
  'metadata': instance.metadata,
  'requirements': instance.requirements,
  'examples': instance.examples,
};

_DeliverAssignmentResult _$DeliverAssignmentResultFromJson(
  Map<String, dynamic> json,
) => _DeliverAssignmentResult(
  assignmentId: json['assignmentId'] as String,
  courseSlug: json['courseSlug'] as String,
  targetCount: (json['targetCount'] as num).toInt(),
  deliveredCount: (json['deliveredCount'] as num).toInt(),
  failedCount: (json['failedCount'] as num).toInt(),
);

Map<String, dynamic> _$DeliverAssignmentResultToJson(
  _DeliverAssignmentResult instance,
) => <String, dynamic>{
  'assignmentId': instance.assignmentId,
  'courseSlug': instance.courseSlug,
  'targetCount': instance.targetCount,
  'deliveredCount': instance.deliveredCount,
  'failedCount': instance.failedCount,
};

_AssignmentDelivery _$AssignmentDeliveryFromJson(Map<String, dynamic> json) =>
    _AssignmentDelivery(
      userId: json['userId'] as String,
      status: json['status'] as String,
      deliveredAt: json['deliveredAt'] as String?,
      failureReason: json['failureReason'] as String?,
    );

Map<String, dynamic> _$AssignmentDeliveryToJson(_AssignmentDelivery instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'status': instance.status,
      'deliveredAt': instance.deliveredAt,
      'failureReason': instance.failureReason,
    };
