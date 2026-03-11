// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_management_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksManagementEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksManagementEvent()';
}


}

/// @nodoc
class $TasksManagementEventCopyWith<$Res>  {
$TasksManagementEventCopyWith(TasksManagementEvent _, $Res Function(TasksManagementEvent) __);
}


/// Adds pattern-matching-related methods to [TasksManagementEvent].
extension TasksManagementEventPatterns on TasksManagementEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TasksManagementStarted value)?  started,TResult Function( TasksManagementRefreshRequested value)?  refreshRequested,TResult Function( TasksManagementCourseSelected value)?  courseSelected,TResult Function( TasksManagementEnrollmentsRequested value)?  enrollmentsRequested,TResult Function( TasksManagementCreateWeekRequested value)?  createWeekRequested,TResult Function( TasksManagementCreateCourseRequested value)?  createCourseRequested,TResult Function( TasksManagementAssignmentsRequested value)?  assignmentsRequested,TResult Function( TasksManagementCreateAssignmentRequested value)?  createAssignmentRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started(_that);case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that);case TasksManagementCreateWeekRequested() when createWeekRequested != null:
return createWeekRequested(_that);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TasksManagementStarted value)  started,required TResult Function( TasksManagementRefreshRequested value)  refreshRequested,required TResult Function( TasksManagementCourseSelected value)  courseSelected,required TResult Function( TasksManagementEnrollmentsRequested value)  enrollmentsRequested,required TResult Function( TasksManagementCreateWeekRequested value)  createWeekRequested,required TResult Function( TasksManagementCreateCourseRequested value)  createCourseRequested,required TResult Function( TasksManagementAssignmentsRequested value)  assignmentsRequested,required TResult Function( TasksManagementCreateAssignmentRequested value)  createAssignmentRequested,}){
final _that = this;
switch (_that) {
case TasksManagementStarted():
return started(_that);case TasksManagementRefreshRequested():
return refreshRequested(_that);case TasksManagementCourseSelected():
return courseSelected(_that);case TasksManagementEnrollmentsRequested():
return enrollmentsRequested(_that);case TasksManagementCreateWeekRequested():
return createWeekRequested(_that);case TasksManagementCreateCourseRequested():
return createCourseRequested(_that);case TasksManagementAssignmentsRequested():
return assignmentsRequested(_that);case TasksManagementCreateAssignmentRequested():
return createAssignmentRequested(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TasksManagementStarted value)?  started,TResult? Function( TasksManagementRefreshRequested value)?  refreshRequested,TResult? Function( TasksManagementCourseSelected value)?  courseSelected,TResult? Function( TasksManagementEnrollmentsRequested value)?  enrollmentsRequested,TResult? Function( TasksManagementCreateWeekRequested value)?  createWeekRequested,TResult? Function( TasksManagementCreateCourseRequested value)?  createCourseRequested,TResult? Function( TasksManagementAssignmentsRequested value)?  assignmentsRequested,TResult? Function( TasksManagementCreateAssignmentRequested value)?  createAssignmentRequested,}){
final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started(_that);case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that);case TasksManagementCreateWeekRequested() when createWeekRequested != null:
return createWeekRequested(_that);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( CourseSummary course)?  courseSelected,TResult Function( String courseSlug)?  enrollmentsRequested,TResult Function( String courseSlug,  int weekNo,  String title,  String startDate,  String endDate)?  createWeekRequested,TResult Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  createCourseRequested,TResult Function( String courseSlug,  int? weekNo,  String? status)?  assignmentsRequested,TResult Function( String courseSlug,  CreateAssignmentRequest request)?  createAssignmentRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started();case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested();case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that.course);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that.courseSlug);case TasksManagementCreateWeekRequested() when createWeekRequested != null:
return createWeekRequested(_that.courseSlug,_that.weekNo,_that.title,_that.startDate,_that.endDate);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that.courseSlug,_that.weekNo,_that.status);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that.courseSlug,_that.request);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( CourseSummary course)  courseSelected,required TResult Function( String courseSlug)  enrollmentsRequested,required TResult Function( String courseSlug,  int weekNo,  String title,  String startDate,  String endDate)  createWeekRequested,required TResult Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)  createCourseRequested,required TResult Function( String courseSlug,  int? weekNo,  String? status)  assignmentsRequested,required TResult Function( String courseSlug,  CreateAssignmentRequest request)  createAssignmentRequested,}) {final _that = this;
switch (_that) {
case TasksManagementStarted():
return started();case TasksManagementRefreshRequested():
return refreshRequested();case TasksManagementCourseSelected():
return courseSelected(_that.course);case TasksManagementEnrollmentsRequested():
return enrollmentsRequested(_that.courseSlug);case TasksManagementCreateWeekRequested():
return createWeekRequested(_that.courseSlug,_that.weekNo,_that.title,_that.startDate,_that.endDate);case TasksManagementCreateCourseRequested():
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case TasksManagementAssignmentsRequested():
return assignmentsRequested(_that.courseSlug,_that.weekNo,_that.status);case TasksManagementCreateAssignmentRequested():
return createAssignmentRequested(_that.courseSlug,_that.request);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( CourseSummary course)?  courseSelected,TResult? Function( String courseSlug)?  enrollmentsRequested,TResult? Function( String courseSlug,  int weekNo,  String title,  String startDate,  String endDate)?  createWeekRequested,TResult? Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  createCourseRequested,TResult? Function( String courseSlug,  int? weekNo,  String? status)?  assignmentsRequested,TResult? Function( String courseSlug,  CreateAssignmentRequest request)?  createAssignmentRequested,}) {final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started();case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested();case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that.course);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that.courseSlug);case TasksManagementCreateWeekRequested() when createWeekRequested != null:
return createWeekRequested(_that.courseSlug,_that.weekNo,_that.title,_that.startDate,_that.endDate);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that.courseSlug,_that.weekNo,_that.status);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that.courseSlug,_that.request);case _:
  return null;

}
}

}

/// @nodoc


class TasksManagementStarted implements TasksManagementEvent {
  const TasksManagementStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksManagementEvent.started()';
}


}




/// @nodoc


class TasksManagementRefreshRequested implements TasksManagementEvent {
  const TasksManagementRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksManagementEvent.refreshRequested()';
}


}




/// @nodoc


class TasksManagementCourseSelected implements TasksManagementEvent {
  const TasksManagementCourseSelected(this.course);
  

 final  CourseSummary course;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementCourseSelectedCopyWith<TasksManagementCourseSelected> get copyWith => _$TasksManagementCourseSelectedCopyWithImpl<TasksManagementCourseSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementCourseSelected&&(identical(other.course, course) || other.course == course));
}


@override
int get hashCode => Object.hash(runtimeType,course);

@override
String toString() {
  return 'TasksManagementEvent.courseSelected(course: $course)';
}


}

/// @nodoc
abstract mixin class $TasksManagementCourseSelectedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementCourseSelectedCopyWith(TasksManagementCourseSelected value, $Res Function(TasksManagementCourseSelected) _then) = _$TasksManagementCourseSelectedCopyWithImpl;
@useResult
$Res call({
 CourseSummary course
});


$CourseSummaryCopyWith<$Res> get course;

}
/// @nodoc
class _$TasksManagementCourseSelectedCopyWithImpl<$Res>
    implements $TasksManagementCourseSelectedCopyWith<$Res> {
  _$TasksManagementCourseSelectedCopyWithImpl(this._self, this._then);

  final TasksManagementCourseSelected _self;
  final $Res Function(TasksManagementCourseSelected) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? course = null,}) {
  return _then(TasksManagementCourseSelected(
null == course ? _self.course : course // ignore: cast_nullable_to_non_nullable
as CourseSummary,
  ));
}

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseSummaryCopyWith<$Res> get course {
  
  return $CourseSummaryCopyWith<$Res>(_self.course, (value) {
    return _then(_self.copyWith(course: value));
  });
}
}

/// @nodoc


class TasksManagementEnrollmentsRequested implements TasksManagementEvent {
  const TasksManagementEnrollmentsRequested(this.courseSlug);
  

 final  String courseSlug;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementEnrollmentsRequestedCopyWith<TasksManagementEnrollmentsRequested> get copyWith => _$TasksManagementEnrollmentsRequestedCopyWithImpl<TasksManagementEnrollmentsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementEnrollmentsRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug);

@override
String toString() {
  return 'TasksManagementEvent.enrollmentsRequested(courseSlug: $courseSlug)';
}


}

/// @nodoc
abstract mixin class $TasksManagementEnrollmentsRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementEnrollmentsRequestedCopyWith(TasksManagementEnrollmentsRequested value, $Res Function(TasksManagementEnrollmentsRequested) _then) = _$TasksManagementEnrollmentsRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug
});




}
/// @nodoc
class _$TasksManagementEnrollmentsRequestedCopyWithImpl<$Res>
    implements $TasksManagementEnrollmentsRequestedCopyWith<$Res> {
  _$TasksManagementEnrollmentsRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementEnrollmentsRequested _self;
  final $Res Function(TasksManagementEnrollmentsRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,}) {
  return _then(TasksManagementEnrollmentsRequested(
null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementCreateWeekRequested implements TasksManagementEvent {
  const TasksManagementCreateWeekRequested({required this.courseSlug, required this.weekNo, required this.title, required this.startDate, required this.endDate});
  

 final  String courseSlug;
 final  int weekNo;
 final  String title;
 final  String startDate;
 final  String endDate;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementCreateWeekRequestedCopyWith<TasksManagementCreateWeekRequested> get copyWith => _$TasksManagementCreateWeekRequestedCopyWithImpl<TasksManagementCreateWeekRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementCreateWeekRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,weekNo,title,startDate,endDate);

@override
String toString() {
  return 'TasksManagementEvent.createWeekRequested(courseSlug: $courseSlug, weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $TasksManagementCreateWeekRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementCreateWeekRequestedCopyWith(TasksManagementCreateWeekRequested value, $Res Function(TasksManagementCreateWeekRequested) _then) = _$TasksManagementCreateWeekRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, int weekNo, String title, String startDate, String endDate
});




}
/// @nodoc
class _$TasksManagementCreateWeekRequestedCopyWithImpl<$Res>
    implements $TasksManagementCreateWeekRequestedCopyWith<$Res> {
  _$TasksManagementCreateWeekRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementCreateWeekRequested _self;
  final $Res Function(TasksManagementCreateWeekRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? weekNo = null,Object? title = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(TasksManagementCreateWeekRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementCreateCourseRequested implements TasksManagementEvent {
  const TasksManagementCreateCourseRequested({required this.slug, required this.title, this.description, required this.phase, required this.targetTrack, required this.startDate, required this.endDate});
  

 final  String slug;
 final  String title;
 final  String? description;
 final  String phase;
 final  String targetTrack;
 final  String startDate;
 final  String endDate;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementCreateCourseRequestedCopyWith<TasksManagementCreateCourseRequested> get copyWith => _$TasksManagementCreateCourseRequestedCopyWithImpl<TasksManagementCreateCourseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementCreateCourseRequested&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}


@override
int get hashCode => Object.hash(runtimeType,slug,title,description,phase,targetTrack,startDate,endDate);

@override
String toString() {
  return 'TasksManagementEvent.createCourseRequested(slug: $slug, title: $title, description: $description, phase: $phase, targetTrack: $targetTrack, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $TasksManagementCreateCourseRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementCreateCourseRequestedCopyWith(TasksManagementCreateCourseRequested value, $Res Function(TasksManagementCreateCourseRequested) _then) = _$TasksManagementCreateCourseRequestedCopyWithImpl;
@useResult
$Res call({
 String slug, String title, String? description, String phase, String targetTrack, String startDate, String endDate
});




}
/// @nodoc
class _$TasksManagementCreateCourseRequestedCopyWithImpl<$Res>
    implements $TasksManagementCreateCourseRequestedCopyWith<$Res> {
  _$TasksManagementCreateCourseRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementCreateCourseRequested _self;
  final $Res Function(TasksManagementCreateCourseRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? title = null,Object? description = freezed,Object? phase = null,Object? targetTrack = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(TasksManagementCreateCourseRequested(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,targetTrack: null == targetTrack ? _self.targetTrack : targetTrack // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementAssignmentsRequested implements TasksManagementEvent {
  const TasksManagementAssignmentsRequested({required this.courseSlug, this.weekNo, this.status});
  

 final  String courseSlug;
 final  int? weekNo;
 final  String? status;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementAssignmentsRequestedCopyWith<TasksManagementAssignmentsRequested> get copyWith => _$TasksManagementAssignmentsRequestedCopyWithImpl<TasksManagementAssignmentsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementAssignmentsRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,weekNo,status);

@override
String toString() {
  return 'TasksManagementEvent.assignmentsRequested(courseSlug: $courseSlug, weekNo: $weekNo, status: $status)';
}


}

/// @nodoc
abstract mixin class $TasksManagementAssignmentsRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementAssignmentsRequestedCopyWith(TasksManagementAssignmentsRequested value, $Res Function(TasksManagementAssignmentsRequested) _then) = _$TasksManagementAssignmentsRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, int? weekNo, String? status
});




}
/// @nodoc
class _$TasksManagementAssignmentsRequestedCopyWithImpl<$Res>
    implements $TasksManagementAssignmentsRequestedCopyWith<$Res> {
  _$TasksManagementAssignmentsRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementAssignmentsRequested _self;
  final $Res Function(TasksManagementAssignmentsRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? weekNo = freezed,Object? status = freezed,}) {
  return _then(TasksManagementAssignmentsRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,weekNo: freezed == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TasksManagementCreateAssignmentRequested implements TasksManagementEvent {
  const TasksManagementCreateAssignmentRequested({required this.courseSlug, required this.request});
  

 final  String courseSlug;
 final  CreateAssignmentRequest request;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementCreateAssignmentRequestedCopyWith<TasksManagementCreateAssignmentRequested> get copyWith => _$TasksManagementCreateAssignmentRequestedCopyWithImpl<TasksManagementCreateAssignmentRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementCreateAssignmentRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,request);

@override
String toString() {
  return 'TasksManagementEvent.createAssignmentRequested(courseSlug: $courseSlug, request: $request)';
}


}

/// @nodoc
abstract mixin class $TasksManagementCreateAssignmentRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementCreateAssignmentRequestedCopyWith(TasksManagementCreateAssignmentRequested value, $Res Function(TasksManagementCreateAssignmentRequested) _then) = _$TasksManagementCreateAssignmentRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, CreateAssignmentRequest request
});


$CreateAssignmentRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TasksManagementCreateAssignmentRequestedCopyWithImpl<$Res>
    implements $TasksManagementCreateAssignmentRequestedCopyWith<$Res> {
  _$TasksManagementCreateAssignmentRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementCreateAssignmentRequested _self;
  final $Res Function(TasksManagementCreateAssignmentRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? request = null,}) {
  return _then(TasksManagementCreateAssignmentRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as CreateAssignmentRequest,
  ));
}

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateAssignmentRequestCopyWith<$Res> get request {
  
  return $CreateAssignmentRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

// dart format on
