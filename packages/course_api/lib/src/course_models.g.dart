// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourseMetadata _$CourseMetadataFromJson(Map<String, dynamic> json) =>
    _CourseMetadata(
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      phase: json['phase'] as String? ?? '',
      attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
    );

Map<String, dynamic> _$CourseMetadataToJson(_CourseMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'phase': instance.phase,
      'attributes': instance.attributes,
    };

_CourseSummary _$CourseSummaryFromJson(Map<String, dynamic> json) =>
    _CourseSummary(
      id: json['id'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      targetTrack: json['fieldTag'] as String? ?? 'NO',
      metadata: CourseMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      status: json['status'] as String? ?? 'DRAFT',
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$CourseSummaryToJson(_CourseSummary instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'fieldTag': instance.targetTrack,
      'metadata': instance.metadata,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
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

_Enrollment _$EnrollmentFromJson(Map<String, dynamic> json) => _Enrollment(
  courseId: json['courseId'] as String?,
  courseSlug: json['courseSlug'] as String?,
  userId: json['userId'] as String? ?? '',
  username: json['username'] as String?,
  publicCode: json['publicCode'] as String?,
  status: json['status'] as String? ?? 'ENABLED',
  joinedAt: json['joinedAt'] == null
      ? null
      : DateTime.parse(json['joinedAt'] as String),
  droppedAt: json['droppedAt'] == null
      ? null
      : DateTime.parse(json['droppedAt'] as String),
  bannedAt: json['bannedAt'] == null
      ? null
      : DateTime.parse(json['bannedAt'] as String),
  banReason: json['banReason'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$EnrollmentToJson(_Enrollment instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'courseSlug': instance.courseSlug,
      'userId': instance.userId,
      'username': instance.username,
      'publicCode': instance.publicCode,
      'status': instance.status,
      'joinedAt': instance.joinedAt?.toIso8601String(),
      'droppedAt': instance.droppedAt?.toIso8601String(),
      'bannedAt': instance.bannedAt?.toIso8601String(),
      'banReason': instance.banReason,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

_AssignmentMetadata _$AssignmentMetadataFromJson(
  Map<String, dynamic> json,
) => _AssignmentMetadata(
  title: json['title'] as String? ?? '',
  difficulty: json['difficulty'] as String? ?? 'MID',
  description: json['description'] as String?,
  learningGoals:
      (json['learningGoals'] as List<dynamic>?)
          ?.map((e) => LearningGoal.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  requirements:
      (json['requirements'] as List<dynamic>?)
          ?.map(
            (e) => AssignmentRequirement.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const [],
  testCases:
      (json['testCases'] as List<dynamic>?)
          ?.map((e) => AssignmentTestCase.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  problemDetail: json['problemDetail'] == null
      ? null
      : ProblemDetail.fromJson(json['problemDetail'] as Map<String, dynamic>),
  submissionGuide: json['submissionGuide'] == null
      ? null
      : SubmissionGuide.fromJson(
          json['submissionGuide'] as Map<String, dynamic>,
        ),
  codeTemplates:
      (json['codeTemplates'] as List<dynamic>?)
          ?.map((e) => CodeTemplate.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  attributes: json['attributes'] as Map<String, dynamic>? ?? const {},
);

Map<String, dynamic> _$AssignmentMetadataToJson(_AssignmentMetadata instance) =>
    <String, dynamic>{
      'title': instance.title,
      'difficulty': instance.difficulty,
      'description': instance.description,
      'learningGoals': instance.learningGoals,
      'requirements': instance.requirements,
      'testCases': instance.testCases,
      'problemDetail': instance.problemDetail,
      'submissionGuide': instance.submissionGuide,
      'codeTemplates': instance.codeTemplates,
      'attributes': instance.attributes,
    };

_LearningGoal _$LearningGoalFromJson(Map<String, dynamic> json) =>
    _LearningGoal(
      sortOrder: (json['sortOrder'] as num).toInt(),
      learningGoalText: json['learningGoalText'] as String,
    );

Map<String, dynamic> _$LearningGoalToJson(_LearningGoal instance) =>
    <String, dynamic>{
      'sortOrder': instance.sortOrder,
      'learningGoalText': instance.learningGoalText,
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

_AssignmentTestCase _$AssignmentTestCaseFromJson(Map<String, dynamic> json) =>
    _AssignmentTestCase(
      seq: (json['seq'] as num).toInt(),
      inputValues: json['inputValues'] == null
          ? const []
          : _inputValuesFromJson(json['inputValues']),
      outputText: json['outputText'] as String?,
      visibility: json['visibility'] as String? ?? 'PUBLIC',
    );

Map<String, dynamic> _$AssignmentTestCaseToJson(_AssignmentTestCase instance) =>
    <String, dynamic>{
      'seq': instance.seq,
      'inputValues': instance.inputValues,
      'outputText': instance.outputText,
      'visibility': instance.visibility,
    };

_ProblemDetail _$ProblemDetailFromJson(Map<String, dynamic> json) =>
    _ProblemDetail(
      inputDescription: json['inputDescription'] as String?,
      outputDescription: json['outputDescription'] as String?,
      classification: json['classification'] == null
          ? null
          : ProblemClassification.fromJson(
              json['classification'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ProblemDetailToJson(_ProblemDetail instance) =>
    <String, dynamic>{
      'inputDescription': instance.inputDescription,
      'outputDescription': instance.outputDescription,
      'classification': instance.classification,
    };

_ProblemClassification _$ProblemClassificationFromJson(
  Map<String, dynamic> json,
) => _ProblemClassification(
  algorithmStep: json['algorithmStep'] as String?,
  difficultyStep: (json['difficultyStep'] as num?)?.toInt(),
);

Map<String, dynamic> _$ProblemClassificationToJson(
  _ProblemClassification instance,
) => <String, dynamic>{
  'algorithmStep': instance.algorithmStep,
  'difficultyStep': instance.difficultyStep,
};

_SubmissionGuide _$SubmissionGuideFromJson(Map<String, dynamic> json) =>
    _SubmissionGuide(
      title: json['title'] as String?,
      description: json['description'] as String?,
      commentSections: json['commentSections'] == null
          ? const []
          : _commentSectionsFromJson(json['commentSections']),
    );

Map<String, dynamic> _$SubmissionGuideToJson(_SubmissionGuide instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'commentSections': instance.commentSections,
    };

_CodeTemplate _$CodeTemplateFromJson(Map<String, dynamic> json) =>
    _CodeTemplate(
      language: json['language'] as String,
      codeTemplate: json['codeTemplate'] as String?,
      runnableTemplate: json['runnableTemplate'] as String?,
      commentTemplate: json['commentTemplate'] as String?,
      functionTemplate: json['functionTemplate'] as String?,
    );

Map<String, dynamic> _$CodeTemplateToJson(_CodeTemplate instance) =>
    <String, dynamic>{
      'language': instance.language,
      'codeTemplate': instance.codeTemplate,
      'runnableTemplate': instance.runnableTemplate,
      'commentTemplate': instance.commentTemplate,
      'functionTemplate': instance.functionTemplate,
    };

_Assignment _$AssignmentFromJson(Map<String, dynamic> json) => _Assignment(
  id: json['assignmentId'] as String? ?? '',
  courseSlug: json['courseSlug'] as String?,
  weekNo: (json['weekNo'] as num?)?.toInt() ?? 0,
  orderInWeek: (json['orderInWeek'] as num?)?.toInt() ?? 0,
  startAt: json['startAt'] as String? ?? '',
  endAt: json['endAt'] as String? ?? '',
  status: json['status'] as String? ?? 'DRAFT',
  publishedAt: json['publishedAt'] as String?,
  metadata: AssignmentMetadata.fromJson(
    json['metadata'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$AssignmentToJson(_Assignment instance) =>
    <String, dynamic>{
      'assignmentId': instance.id,
      'courseSlug': instance.courseSlug,
      'weekNo': instance.weekNo,
      'orderInWeek': instance.orderInWeek,
      'startAt': instance.startAt,
      'endAt': instance.endAt,
      'status': instance.status,
      'publishedAt': instance.publishedAt,
      'metadata': instance.metadata,
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
);

Map<String, dynamic> _$CreateAssignmentRequestToJson(
  _CreateAssignmentRequest instance,
) => <String, dynamic>{
  'weekNo': instance.weekNo,
  'orderInWeek': instance.orderInWeek,
  'startAt': instance.startAt,
  'endAt': instance.endAt,
  'metadata': instance.metadata,
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
  status: json['status'] as String?,
);

Map<String, dynamic> _$UpdateAssignmentRequestToJson(
  _UpdateAssignmentRequest instance,
) => <String, dynamic>{
  'orderInWeek': instance.orderInWeek,
  'startAt': instance.startAt,
  'endAt': instance.endAt,
  'metadata': instance.metadata,
  'status': instance.status,
};

_AddEnrollmentRequest _$AddEnrollmentRequestFromJson(
  Map<String, dynamic> json,
) => _AddEnrollmentRequest(publicCode: json['publicCode'] as String);

Map<String, dynamic> _$AddEnrollmentRequestToJson(
  _AddEnrollmentRequest instance,
) => <String, dynamic>{'publicCode': instance.publicCode};

_UpdateEnrollmentStatusRequest _$UpdateEnrollmentStatusRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateEnrollmentStatusRequest(
  status: $enumDecode(_$EnrollmentStatusEnumMap, json['status']),
  banReason: json['banReason'] as String?,
);

Map<String, dynamic> _$UpdateEnrollmentStatusRequestToJson(
  _UpdateEnrollmentStatusRequest instance,
) => <String, dynamic>{
  'status': _$EnrollmentStatusEnumMap[instance.status]!,
  'banReason': instance.banReason,
};

const _$EnrollmentStatusEnumMap = {
  EnrollmentStatus.enabled: 'ENABLED',
  EnrollmentStatus.banned: 'BANNED',
};
