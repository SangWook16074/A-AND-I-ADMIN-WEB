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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TasksManagementStarted value)?  started,TResult Function( TasksManagementRefreshRequested value)?  refreshRequested,TResult Function( TasksManagementCourseSelected value)?  courseSelected,TResult Function( TasksManagementEnrollmentsRequested value)?  enrollmentsRequested,TResult Function( TasksManagementCreateCourseRequested value)?  createCourseRequested,TResult Function( TasksManagementAssignmentsRequested value)?  assignmentsRequested,TResult Function( TasksManagementCreateAssignmentRequested value)?  createAssignmentRequested,TResult Function( TasksManagementCourseDeletedRequested value)?  courseDeletedRequested,TResult Function( TasksManagementUpdateCourseRequested value)?  updateCourseRequested,TResult Function( TasksManagementAssignmentDetailsRequested value)?  assignmentDetailsRequested,TResult Function( TasksManagementAssignmentSubmissionStatusesRequested value)?  assignmentSubmissionStatusesRequested,TResult Function( TasksManagementAssignmentDeletedRequested value)?  assignmentDeletedRequested,TResult Function( TasksManagementUpdateAssignmentRequested value)?  updateAssignmentRequested,TResult Function( TasksManagementAddEnrollmentRequested value)?  addEnrollmentRequested,TResult Function( TasksManagementUpdateEnrollmentStatusRequested value)?  updateEnrollmentStatusRequested,TResult Function( TasksManagementDeleteEnrollmentRequested value)?  deleteEnrollmentRequested,TResult Function( TasksManagementUserSearchRequested value)?  userSearchRequested,TResult Function( TasksManagementClearUserSearch value)?  clearUserSearch,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started(_that);case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that);case TasksManagementCourseDeletedRequested() when courseDeletedRequested != null:
return courseDeletedRequested(_that);case TasksManagementUpdateCourseRequested() when updateCourseRequested != null:
return updateCourseRequested(_that);case TasksManagementAssignmentDetailsRequested() when assignmentDetailsRequested != null:
return assignmentDetailsRequested(_that);case TasksManagementAssignmentSubmissionStatusesRequested() when assignmentSubmissionStatusesRequested != null:
return assignmentSubmissionStatusesRequested(_that);case TasksManagementAssignmentDeletedRequested() when assignmentDeletedRequested != null:
return assignmentDeletedRequested(_that);case TasksManagementUpdateAssignmentRequested() when updateAssignmentRequested != null:
return updateAssignmentRequested(_that);case TasksManagementAddEnrollmentRequested() when addEnrollmentRequested != null:
return addEnrollmentRequested(_that);case TasksManagementUpdateEnrollmentStatusRequested() when updateEnrollmentStatusRequested != null:
return updateEnrollmentStatusRequested(_that);case TasksManagementDeleteEnrollmentRequested() when deleteEnrollmentRequested != null:
return deleteEnrollmentRequested(_that);case TasksManagementUserSearchRequested() when userSearchRequested != null:
return userSearchRequested(_that);case TasksManagementClearUserSearch() when clearUserSearch != null:
return clearUserSearch(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TasksManagementStarted value)  started,required TResult Function( TasksManagementRefreshRequested value)  refreshRequested,required TResult Function( TasksManagementCourseSelected value)  courseSelected,required TResult Function( TasksManagementEnrollmentsRequested value)  enrollmentsRequested,required TResult Function( TasksManagementCreateCourseRequested value)  createCourseRequested,required TResult Function( TasksManagementAssignmentsRequested value)  assignmentsRequested,required TResult Function( TasksManagementCreateAssignmentRequested value)  createAssignmentRequested,required TResult Function( TasksManagementCourseDeletedRequested value)  courseDeletedRequested,required TResult Function( TasksManagementUpdateCourseRequested value)  updateCourseRequested,required TResult Function( TasksManagementAssignmentDetailsRequested value)  assignmentDetailsRequested,required TResult Function( TasksManagementAssignmentSubmissionStatusesRequested value)  assignmentSubmissionStatusesRequested,required TResult Function( TasksManagementAssignmentDeletedRequested value)  assignmentDeletedRequested,required TResult Function( TasksManagementUpdateAssignmentRequested value)  updateAssignmentRequested,required TResult Function( TasksManagementAddEnrollmentRequested value)  addEnrollmentRequested,required TResult Function( TasksManagementUpdateEnrollmentStatusRequested value)  updateEnrollmentStatusRequested,required TResult Function( TasksManagementDeleteEnrollmentRequested value)  deleteEnrollmentRequested,required TResult Function( TasksManagementUserSearchRequested value)  userSearchRequested,required TResult Function( TasksManagementClearUserSearch value)  clearUserSearch,}){
final _that = this;
switch (_that) {
case TasksManagementStarted():
return started(_that);case TasksManagementRefreshRequested():
return refreshRequested(_that);case TasksManagementCourseSelected():
return courseSelected(_that);case TasksManagementEnrollmentsRequested():
return enrollmentsRequested(_that);case TasksManagementCreateCourseRequested():
return createCourseRequested(_that);case TasksManagementAssignmentsRequested():
return assignmentsRequested(_that);case TasksManagementCreateAssignmentRequested():
return createAssignmentRequested(_that);case TasksManagementCourseDeletedRequested():
return courseDeletedRequested(_that);case TasksManagementUpdateCourseRequested():
return updateCourseRequested(_that);case TasksManagementAssignmentDetailsRequested():
return assignmentDetailsRequested(_that);case TasksManagementAssignmentSubmissionStatusesRequested():
return assignmentSubmissionStatusesRequested(_that);case TasksManagementAssignmentDeletedRequested():
return assignmentDeletedRequested(_that);case TasksManagementUpdateAssignmentRequested():
return updateAssignmentRequested(_that);case TasksManagementAddEnrollmentRequested():
return addEnrollmentRequested(_that);case TasksManagementUpdateEnrollmentStatusRequested():
return updateEnrollmentStatusRequested(_that);case TasksManagementDeleteEnrollmentRequested():
return deleteEnrollmentRequested(_that);case TasksManagementUserSearchRequested():
return userSearchRequested(_that);case TasksManagementClearUserSearch():
return clearUserSearch(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TasksManagementStarted value)?  started,TResult? Function( TasksManagementRefreshRequested value)?  refreshRequested,TResult? Function( TasksManagementCourseSelected value)?  courseSelected,TResult? Function( TasksManagementEnrollmentsRequested value)?  enrollmentsRequested,TResult? Function( TasksManagementCreateCourseRequested value)?  createCourseRequested,TResult? Function( TasksManagementAssignmentsRequested value)?  assignmentsRequested,TResult? Function( TasksManagementCreateAssignmentRequested value)?  createAssignmentRequested,TResult? Function( TasksManagementCourseDeletedRequested value)?  courseDeletedRequested,TResult? Function( TasksManagementUpdateCourseRequested value)?  updateCourseRequested,TResult? Function( TasksManagementAssignmentDetailsRequested value)?  assignmentDetailsRequested,TResult? Function( TasksManagementAssignmentSubmissionStatusesRequested value)?  assignmentSubmissionStatusesRequested,TResult? Function( TasksManagementAssignmentDeletedRequested value)?  assignmentDeletedRequested,TResult? Function( TasksManagementUpdateAssignmentRequested value)?  updateAssignmentRequested,TResult? Function( TasksManagementAddEnrollmentRequested value)?  addEnrollmentRequested,TResult? Function( TasksManagementUpdateEnrollmentStatusRequested value)?  updateEnrollmentStatusRequested,TResult? Function( TasksManagementDeleteEnrollmentRequested value)?  deleteEnrollmentRequested,TResult? Function( TasksManagementUserSearchRequested value)?  userSearchRequested,TResult? Function( TasksManagementClearUserSearch value)?  clearUserSearch,}){
final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started(_that);case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that);case TasksManagementCourseDeletedRequested() when courseDeletedRequested != null:
return courseDeletedRequested(_that);case TasksManagementUpdateCourseRequested() when updateCourseRequested != null:
return updateCourseRequested(_that);case TasksManagementAssignmentDetailsRequested() when assignmentDetailsRequested != null:
return assignmentDetailsRequested(_that);case TasksManagementAssignmentSubmissionStatusesRequested() when assignmentSubmissionStatusesRequested != null:
return assignmentSubmissionStatusesRequested(_that);case TasksManagementAssignmentDeletedRequested() when assignmentDeletedRequested != null:
return assignmentDeletedRequested(_that);case TasksManagementUpdateAssignmentRequested() when updateAssignmentRequested != null:
return updateAssignmentRequested(_that);case TasksManagementAddEnrollmentRequested() when addEnrollmentRequested != null:
return addEnrollmentRequested(_that);case TasksManagementUpdateEnrollmentStatusRequested() when updateEnrollmentStatusRequested != null:
return updateEnrollmentStatusRequested(_that);case TasksManagementDeleteEnrollmentRequested() when deleteEnrollmentRequested != null:
return deleteEnrollmentRequested(_that);case TasksManagementUserSearchRequested() when userSearchRequested != null:
return userSearchRequested(_that);case TasksManagementClearUserSearch() when clearUserSearch != null:
return clearUserSearch(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( CourseSummary course)?  courseSelected,TResult Function( String courseSlug)?  enrollmentsRequested,TResult Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  createCourseRequested,TResult Function( String courseSlug,  int? weekNo,  String? status)?  assignmentsRequested,TResult Function( String courseSlug,  CreateAssignmentRequest request)?  createAssignmentRequested,TResult Function( String courseSlug)?  courseDeletedRequested,TResult Function( String courseSlug,  UpdateCourseRequest request)?  updateCourseRequested,TResult Function( String courseSlug,  String assignmentId)?  assignmentDetailsRequested,TResult Function( String courseSlug,  String assignmentId)?  assignmentSubmissionStatusesRequested,TResult Function( String courseSlug,  String assignmentId)?  assignmentDeletedRequested,TResult Function( String courseSlug,  String assignmentId,  UpdateAssignmentRequest request)?  updateAssignmentRequested,TResult Function( String courseSlug,  AddEnrollmentRequest request)?  addEnrollmentRequested,TResult Function( String courseSlug,  String userId,  UpdateEnrollmentStatusRequest request)?  updateEnrollmentStatusRequested,TResult Function( String courseSlug,  String userId)?  deleteEnrollmentRequested,TResult Function( String query)?  userSearchRequested,TResult Function()?  clearUserSearch,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started();case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested();case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that.course);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that.courseSlug);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that.courseSlug,_that.weekNo,_that.status);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that.courseSlug,_that.request);case TasksManagementCourseDeletedRequested() when courseDeletedRequested != null:
return courseDeletedRequested(_that.courseSlug);case TasksManagementUpdateCourseRequested() when updateCourseRequested != null:
return updateCourseRequested(_that.courseSlug,_that.request);case TasksManagementAssignmentDetailsRequested() when assignmentDetailsRequested != null:
return assignmentDetailsRequested(_that.courseSlug,_that.assignmentId);case TasksManagementAssignmentSubmissionStatusesRequested() when assignmentSubmissionStatusesRequested != null:
return assignmentSubmissionStatusesRequested(_that.courseSlug,_that.assignmentId);case TasksManagementAssignmentDeletedRequested() when assignmentDeletedRequested != null:
return assignmentDeletedRequested(_that.courseSlug,_that.assignmentId);case TasksManagementUpdateAssignmentRequested() when updateAssignmentRequested != null:
return updateAssignmentRequested(_that.courseSlug,_that.assignmentId,_that.request);case TasksManagementAddEnrollmentRequested() when addEnrollmentRequested != null:
return addEnrollmentRequested(_that.courseSlug,_that.request);case TasksManagementUpdateEnrollmentStatusRequested() when updateEnrollmentStatusRequested != null:
return updateEnrollmentStatusRequested(_that.courseSlug,_that.userId,_that.request);case TasksManagementDeleteEnrollmentRequested() when deleteEnrollmentRequested != null:
return deleteEnrollmentRequested(_that.courseSlug,_that.userId);case TasksManagementUserSearchRequested() when userSearchRequested != null:
return userSearchRequested(_that.query);case TasksManagementClearUserSearch() when clearUserSearch != null:
return clearUserSearch();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( CourseSummary course)  courseSelected,required TResult Function( String courseSlug)  enrollmentsRequested,required TResult Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)  createCourseRequested,required TResult Function( String courseSlug,  int? weekNo,  String? status)  assignmentsRequested,required TResult Function( String courseSlug,  CreateAssignmentRequest request)  createAssignmentRequested,required TResult Function( String courseSlug)  courseDeletedRequested,required TResult Function( String courseSlug,  UpdateCourseRequest request)  updateCourseRequested,required TResult Function( String courseSlug,  String assignmentId)  assignmentDetailsRequested,required TResult Function( String courseSlug,  String assignmentId)  assignmentSubmissionStatusesRequested,required TResult Function( String courseSlug,  String assignmentId)  assignmentDeletedRequested,required TResult Function( String courseSlug,  String assignmentId,  UpdateAssignmentRequest request)  updateAssignmentRequested,required TResult Function( String courseSlug,  AddEnrollmentRequest request)  addEnrollmentRequested,required TResult Function( String courseSlug,  String userId,  UpdateEnrollmentStatusRequest request)  updateEnrollmentStatusRequested,required TResult Function( String courseSlug,  String userId)  deleteEnrollmentRequested,required TResult Function( String query)  userSearchRequested,required TResult Function()  clearUserSearch,}) {final _that = this;
switch (_that) {
case TasksManagementStarted():
return started();case TasksManagementRefreshRequested():
return refreshRequested();case TasksManagementCourseSelected():
return courseSelected(_that.course);case TasksManagementEnrollmentsRequested():
return enrollmentsRequested(_that.courseSlug);case TasksManagementCreateCourseRequested():
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case TasksManagementAssignmentsRequested():
return assignmentsRequested(_that.courseSlug,_that.weekNo,_that.status);case TasksManagementCreateAssignmentRequested():
return createAssignmentRequested(_that.courseSlug,_that.request);case TasksManagementCourseDeletedRequested():
return courseDeletedRequested(_that.courseSlug);case TasksManagementUpdateCourseRequested():
return updateCourseRequested(_that.courseSlug,_that.request);case TasksManagementAssignmentDetailsRequested():
return assignmentDetailsRequested(_that.courseSlug,_that.assignmentId);case TasksManagementAssignmentSubmissionStatusesRequested():
return assignmentSubmissionStatusesRequested(_that.courseSlug,_that.assignmentId);case TasksManagementAssignmentDeletedRequested():
return assignmentDeletedRequested(_that.courseSlug,_that.assignmentId);case TasksManagementUpdateAssignmentRequested():
return updateAssignmentRequested(_that.courseSlug,_that.assignmentId,_that.request);case TasksManagementAddEnrollmentRequested():
return addEnrollmentRequested(_that.courseSlug,_that.request);case TasksManagementUpdateEnrollmentStatusRequested():
return updateEnrollmentStatusRequested(_that.courseSlug,_that.userId,_that.request);case TasksManagementDeleteEnrollmentRequested():
return deleteEnrollmentRequested(_that.courseSlug,_that.userId);case TasksManagementUserSearchRequested():
return userSearchRequested(_that.query);case TasksManagementClearUserSearch():
return clearUserSearch();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( CourseSummary course)?  courseSelected,TResult? Function( String courseSlug)?  enrollmentsRequested,TResult? Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  createCourseRequested,TResult? Function( String courseSlug,  int? weekNo,  String? status)?  assignmentsRequested,TResult? Function( String courseSlug,  CreateAssignmentRequest request)?  createAssignmentRequested,TResult? Function( String courseSlug)?  courseDeletedRequested,TResult? Function( String courseSlug,  UpdateCourseRequest request)?  updateCourseRequested,TResult? Function( String courseSlug,  String assignmentId)?  assignmentDetailsRequested,TResult? Function( String courseSlug,  String assignmentId)?  assignmentSubmissionStatusesRequested,TResult? Function( String courseSlug,  String assignmentId)?  assignmentDeletedRequested,TResult? Function( String courseSlug,  String assignmentId,  UpdateAssignmentRequest request)?  updateAssignmentRequested,TResult? Function( String courseSlug,  AddEnrollmentRequest request)?  addEnrollmentRequested,TResult? Function( String courseSlug,  String userId,  UpdateEnrollmentStatusRequest request)?  updateEnrollmentStatusRequested,TResult? Function( String courseSlug,  String userId)?  deleteEnrollmentRequested,TResult? Function( String query)?  userSearchRequested,TResult? Function()?  clearUserSearch,}) {final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started();case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested();case TasksManagementCourseSelected() when courseSelected != null:
return courseSelected(_that.course);case TasksManagementEnrollmentsRequested() when enrollmentsRequested != null:
return enrollmentsRequested(_that.courseSlug);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case TasksManagementAssignmentsRequested() when assignmentsRequested != null:
return assignmentsRequested(_that.courseSlug,_that.weekNo,_that.status);case TasksManagementCreateAssignmentRequested() when createAssignmentRequested != null:
return createAssignmentRequested(_that.courseSlug,_that.request);case TasksManagementCourseDeletedRequested() when courseDeletedRequested != null:
return courseDeletedRequested(_that.courseSlug);case TasksManagementUpdateCourseRequested() when updateCourseRequested != null:
return updateCourseRequested(_that.courseSlug,_that.request);case TasksManagementAssignmentDetailsRequested() when assignmentDetailsRequested != null:
return assignmentDetailsRequested(_that.courseSlug,_that.assignmentId);case TasksManagementAssignmentSubmissionStatusesRequested() when assignmentSubmissionStatusesRequested != null:
return assignmentSubmissionStatusesRequested(_that.courseSlug,_that.assignmentId);case TasksManagementAssignmentDeletedRequested() when assignmentDeletedRequested != null:
return assignmentDeletedRequested(_that.courseSlug,_that.assignmentId);case TasksManagementUpdateAssignmentRequested() when updateAssignmentRequested != null:
return updateAssignmentRequested(_that.courseSlug,_that.assignmentId,_that.request);case TasksManagementAddEnrollmentRequested() when addEnrollmentRequested != null:
return addEnrollmentRequested(_that.courseSlug,_that.request);case TasksManagementUpdateEnrollmentStatusRequested() when updateEnrollmentStatusRequested != null:
return updateEnrollmentStatusRequested(_that.courseSlug,_that.userId,_that.request);case TasksManagementDeleteEnrollmentRequested() when deleteEnrollmentRequested != null:
return deleteEnrollmentRequested(_that.courseSlug,_that.userId);case TasksManagementUserSearchRequested() when userSearchRequested != null:
return userSearchRequested(_that.query);case TasksManagementClearUserSearch() when clearUserSearch != null:
return clearUserSearch();case _:
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

/// @nodoc


class TasksManagementCourseDeletedRequested implements TasksManagementEvent {
  const TasksManagementCourseDeletedRequested({required this.courseSlug});
  

 final  String courseSlug;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementCourseDeletedRequestedCopyWith<TasksManagementCourseDeletedRequested> get copyWith => _$TasksManagementCourseDeletedRequestedCopyWithImpl<TasksManagementCourseDeletedRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementCourseDeletedRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug);

@override
String toString() {
  return 'TasksManagementEvent.courseDeletedRequested(courseSlug: $courseSlug)';
}


}

/// @nodoc
abstract mixin class $TasksManagementCourseDeletedRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementCourseDeletedRequestedCopyWith(TasksManagementCourseDeletedRequested value, $Res Function(TasksManagementCourseDeletedRequested) _then) = _$TasksManagementCourseDeletedRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug
});




}
/// @nodoc
class _$TasksManagementCourseDeletedRequestedCopyWithImpl<$Res>
    implements $TasksManagementCourseDeletedRequestedCopyWith<$Res> {
  _$TasksManagementCourseDeletedRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementCourseDeletedRequested _self;
  final $Res Function(TasksManagementCourseDeletedRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,}) {
  return _then(TasksManagementCourseDeletedRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementUpdateCourseRequested implements TasksManagementEvent {
  const TasksManagementUpdateCourseRequested({required this.courseSlug, required this.request});
  

 final  String courseSlug;
 final  UpdateCourseRequest request;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementUpdateCourseRequestedCopyWith<TasksManagementUpdateCourseRequested> get copyWith => _$TasksManagementUpdateCourseRequestedCopyWithImpl<TasksManagementUpdateCourseRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementUpdateCourseRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,request);

@override
String toString() {
  return 'TasksManagementEvent.updateCourseRequested(courseSlug: $courseSlug, request: $request)';
}


}

/// @nodoc
abstract mixin class $TasksManagementUpdateCourseRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementUpdateCourseRequestedCopyWith(TasksManagementUpdateCourseRequested value, $Res Function(TasksManagementUpdateCourseRequested) _then) = _$TasksManagementUpdateCourseRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, UpdateCourseRequest request
});


$UpdateCourseRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TasksManagementUpdateCourseRequestedCopyWithImpl<$Res>
    implements $TasksManagementUpdateCourseRequestedCopyWith<$Res> {
  _$TasksManagementUpdateCourseRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementUpdateCourseRequested _self;
  final $Res Function(TasksManagementUpdateCourseRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? request = null,}) {
  return _then(TasksManagementUpdateCourseRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as UpdateCourseRequest,
  ));
}

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateCourseRequestCopyWith<$Res> get request {
  
  return $UpdateCourseRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class TasksManagementAssignmentDetailsRequested implements TasksManagementEvent {
  const TasksManagementAssignmentDetailsRequested({required this.courseSlug, required this.assignmentId});
  

 final  String courseSlug;
 final  String assignmentId;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementAssignmentDetailsRequestedCopyWith<TasksManagementAssignmentDetailsRequested> get copyWith => _$TasksManagementAssignmentDetailsRequestedCopyWithImpl<TasksManagementAssignmentDetailsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementAssignmentDetailsRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,assignmentId);

@override
String toString() {
  return 'TasksManagementEvent.assignmentDetailsRequested(courseSlug: $courseSlug, assignmentId: $assignmentId)';
}


}

/// @nodoc
abstract mixin class $TasksManagementAssignmentDetailsRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementAssignmentDetailsRequestedCopyWith(TasksManagementAssignmentDetailsRequested value, $Res Function(TasksManagementAssignmentDetailsRequested) _then) = _$TasksManagementAssignmentDetailsRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, String assignmentId
});




}
/// @nodoc
class _$TasksManagementAssignmentDetailsRequestedCopyWithImpl<$Res>
    implements $TasksManagementAssignmentDetailsRequestedCopyWith<$Res> {
  _$TasksManagementAssignmentDetailsRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementAssignmentDetailsRequested _self;
  final $Res Function(TasksManagementAssignmentDetailsRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? assignmentId = null,}) {
  return _then(TasksManagementAssignmentDetailsRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,assignmentId: null == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementAssignmentSubmissionStatusesRequested implements TasksManagementEvent {
  const TasksManagementAssignmentSubmissionStatusesRequested({required this.courseSlug, required this.assignmentId});
  

 final  String courseSlug;
 final  String assignmentId;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementAssignmentSubmissionStatusesRequestedCopyWith<TasksManagementAssignmentSubmissionStatusesRequested> get copyWith => _$TasksManagementAssignmentSubmissionStatusesRequestedCopyWithImpl<TasksManagementAssignmentSubmissionStatusesRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementAssignmentSubmissionStatusesRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,assignmentId);

@override
String toString() {
  return 'TasksManagementEvent.assignmentSubmissionStatusesRequested(courseSlug: $courseSlug, assignmentId: $assignmentId)';
}


}

/// @nodoc
abstract mixin class $TasksManagementAssignmentSubmissionStatusesRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementAssignmentSubmissionStatusesRequestedCopyWith(TasksManagementAssignmentSubmissionStatusesRequested value, $Res Function(TasksManagementAssignmentSubmissionStatusesRequested) _then) = _$TasksManagementAssignmentSubmissionStatusesRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, String assignmentId
});




}
/// @nodoc
class _$TasksManagementAssignmentSubmissionStatusesRequestedCopyWithImpl<$Res>
    implements $TasksManagementAssignmentSubmissionStatusesRequestedCopyWith<$Res> {
  _$TasksManagementAssignmentSubmissionStatusesRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementAssignmentSubmissionStatusesRequested _self;
  final $Res Function(TasksManagementAssignmentSubmissionStatusesRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? assignmentId = null,}) {
  return _then(TasksManagementAssignmentSubmissionStatusesRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,assignmentId: null == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementAssignmentDeletedRequested implements TasksManagementEvent {
  const TasksManagementAssignmentDeletedRequested({required this.courseSlug, required this.assignmentId});
  

 final  String courseSlug;
 final  String assignmentId;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementAssignmentDeletedRequestedCopyWith<TasksManagementAssignmentDeletedRequested> get copyWith => _$TasksManagementAssignmentDeletedRequestedCopyWithImpl<TasksManagementAssignmentDeletedRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementAssignmentDeletedRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,assignmentId);

@override
String toString() {
  return 'TasksManagementEvent.assignmentDeletedRequested(courseSlug: $courseSlug, assignmentId: $assignmentId)';
}


}

/// @nodoc
abstract mixin class $TasksManagementAssignmentDeletedRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementAssignmentDeletedRequestedCopyWith(TasksManagementAssignmentDeletedRequested value, $Res Function(TasksManagementAssignmentDeletedRequested) _then) = _$TasksManagementAssignmentDeletedRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, String assignmentId
});




}
/// @nodoc
class _$TasksManagementAssignmentDeletedRequestedCopyWithImpl<$Res>
    implements $TasksManagementAssignmentDeletedRequestedCopyWith<$Res> {
  _$TasksManagementAssignmentDeletedRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementAssignmentDeletedRequested _self;
  final $Res Function(TasksManagementAssignmentDeletedRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? assignmentId = null,}) {
  return _then(TasksManagementAssignmentDeletedRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,assignmentId: null == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementUpdateAssignmentRequested implements TasksManagementEvent {
  const TasksManagementUpdateAssignmentRequested({required this.courseSlug, required this.assignmentId, required this.request});
  

 final  String courseSlug;
 final  String assignmentId;
 final  UpdateAssignmentRequest request;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementUpdateAssignmentRequestedCopyWith<TasksManagementUpdateAssignmentRequested> get copyWith => _$TasksManagementUpdateAssignmentRequestedCopyWithImpl<TasksManagementUpdateAssignmentRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementUpdateAssignmentRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.assignmentId, assignmentId) || other.assignmentId == assignmentId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,assignmentId,request);

@override
String toString() {
  return 'TasksManagementEvent.updateAssignmentRequested(courseSlug: $courseSlug, assignmentId: $assignmentId, request: $request)';
}


}

/// @nodoc
abstract mixin class $TasksManagementUpdateAssignmentRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementUpdateAssignmentRequestedCopyWith(TasksManagementUpdateAssignmentRequested value, $Res Function(TasksManagementUpdateAssignmentRequested) _then) = _$TasksManagementUpdateAssignmentRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, String assignmentId, UpdateAssignmentRequest request
});


$UpdateAssignmentRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TasksManagementUpdateAssignmentRequestedCopyWithImpl<$Res>
    implements $TasksManagementUpdateAssignmentRequestedCopyWith<$Res> {
  _$TasksManagementUpdateAssignmentRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementUpdateAssignmentRequested _self;
  final $Res Function(TasksManagementUpdateAssignmentRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? assignmentId = null,Object? request = null,}) {
  return _then(TasksManagementUpdateAssignmentRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,assignmentId: null == assignmentId ? _self.assignmentId : assignmentId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as UpdateAssignmentRequest,
  ));
}

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateAssignmentRequestCopyWith<$Res> get request {
  
  return $UpdateAssignmentRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class TasksManagementAddEnrollmentRequested implements TasksManagementEvent {
  const TasksManagementAddEnrollmentRequested({required this.courseSlug, required this.request});
  

 final  String courseSlug;
 final  AddEnrollmentRequest request;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementAddEnrollmentRequestedCopyWith<TasksManagementAddEnrollmentRequested> get copyWith => _$TasksManagementAddEnrollmentRequestedCopyWithImpl<TasksManagementAddEnrollmentRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementAddEnrollmentRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,request);

@override
String toString() {
  return 'TasksManagementEvent.addEnrollmentRequested(courseSlug: $courseSlug, request: $request)';
}


}

/// @nodoc
abstract mixin class $TasksManagementAddEnrollmentRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementAddEnrollmentRequestedCopyWith(TasksManagementAddEnrollmentRequested value, $Res Function(TasksManagementAddEnrollmentRequested) _then) = _$TasksManagementAddEnrollmentRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, AddEnrollmentRequest request
});


$AddEnrollmentRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TasksManagementAddEnrollmentRequestedCopyWithImpl<$Res>
    implements $TasksManagementAddEnrollmentRequestedCopyWith<$Res> {
  _$TasksManagementAddEnrollmentRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementAddEnrollmentRequested _self;
  final $Res Function(TasksManagementAddEnrollmentRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? request = null,}) {
  return _then(TasksManagementAddEnrollmentRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as AddEnrollmentRequest,
  ));
}

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AddEnrollmentRequestCopyWith<$Res> get request {
  
  return $AddEnrollmentRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class TasksManagementUpdateEnrollmentStatusRequested implements TasksManagementEvent {
  const TasksManagementUpdateEnrollmentStatusRequested({required this.courseSlug, required this.userId, required this.request});
  

 final  String courseSlug;
 final  String userId;
 final  UpdateEnrollmentStatusRequest request;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementUpdateEnrollmentStatusRequestedCopyWith<TasksManagementUpdateEnrollmentStatusRequested> get copyWith => _$TasksManagementUpdateEnrollmentStatusRequestedCopyWithImpl<TasksManagementUpdateEnrollmentStatusRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementUpdateEnrollmentStatusRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.request, request) || other.request == request));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,userId,request);

@override
String toString() {
  return 'TasksManagementEvent.updateEnrollmentStatusRequested(courseSlug: $courseSlug, userId: $userId, request: $request)';
}


}

/// @nodoc
abstract mixin class $TasksManagementUpdateEnrollmentStatusRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementUpdateEnrollmentStatusRequestedCopyWith(TasksManagementUpdateEnrollmentStatusRequested value, $Res Function(TasksManagementUpdateEnrollmentStatusRequested) _then) = _$TasksManagementUpdateEnrollmentStatusRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, String userId, UpdateEnrollmentStatusRequest request
});


$UpdateEnrollmentStatusRequestCopyWith<$Res> get request;

}
/// @nodoc
class _$TasksManagementUpdateEnrollmentStatusRequestedCopyWithImpl<$Res>
    implements $TasksManagementUpdateEnrollmentStatusRequestedCopyWith<$Res> {
  _$TasksManagementUpdateEnrollmentStatusRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementUpdateEnrollmentStatusRequested _self;
  final $Res Function(TasksManagementUpdateEnrollmentStatusRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? userId = null,Object? request = null,}) {
  return _then(TasksManagementUpdateEnrollmentStatusRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,request: null == request ? _self.request : request // ignore: cast_nullable_to_non_nullable
as UpdateEnrollmentStatusRequest,
  ));
}

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateEnrollmentStatusRequestCopyWith<$Res> get request {
  
  return $UpdateEnrollmentStatusRequestCopyWith<$Res>(_self.request, (value) {
    return _then(_self.copyWith(request: value));
  });
}
}

/// @nodoc


class TasksManagementDeleteEnrollmentRequested implements TasksManagementEvent {
  const TasksManagementDeleteEnrollmentRequested({required this.courseSlug, required this.userId});
  

 final  String courseSlug;
 final  String userId;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementDeleteEnrollmentRequestedCopyWith<TasksManagementDeleteEnrollmentRequested> get copyWith => _$TasksManagementDeleteEnrollmentRequestedCopyWithImpl<TasksManagementDeleteEnrollmentRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementDeleteEnrollmentRequested&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,courseSlug,userId);

@override
String toString() {
  return 'TasksManagementEvent.deleteEnrollmentRequested(courseSlug: $courseSlug, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $TasksManagementDeleteEnrollmentRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementDeleteEnrollmentRequestedCopyWith(TasksManagementDeleteEnrollmentRequested value, $Res Function(TasksManagementDeleteEnrollmentRequested) _then) = _$TasksManagementDeleteEnrollmentRequestedCopyWithImpl;
@useResult
$Res call({
 String courseSlug, String userId
});




}
/// @nodoc
class _$TasksManagementDeleteEnrollmentRequestedCopyWithImpl<$Res>
    implements $TasksManagementDeleteEnrollmentRequestedCopyWith<$Res> {
  _$TasksManagementDeleteEnrollmentRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementDeleteEnrollmentRequested _self;
  final $Res Function(TasksManagementDeleteEnrollmentRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? courseSlug = null,Object? userId = null,}) {
  return _then(TasksManagementDeleteEnrollmentRequested(
courseSlug: null == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementUserSearchRequested implements TasksManagementEvent {
  const TasksManagementUserSearchRequested({required this.query});
  

 final  String query;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksManagementUserSearchRequestedCopyWith<TasksManagementUserSearchRequested> get copyWith => _$TasksManagementUserSearchRequestedCopyWithImpl<TasksManagementUserSearchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementUserSearchRequested&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'TasksManagementEvent.userSearchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class $TasksManagementUserSearchRequestedCopyWith<$Res> implements $TasksManagementEventCopyWith<$Res> {
  factory $TasksManagementUserSearchRequestedCopyWith(TasksManagementUserSearchRequested value, $Res Function(TasksManagementUserSearchRequested) _then) = _$TasksManagementUserSearchRequestedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$TasksManagementUserSearchRequestedCopyWithImpl<$Res>
    implements $TasksManagementUserSearchRequestedCopyWith<$Res> {
  _$TasksManagementUserSearchRequestedCopyWithImpl(this._self, this._then);

  final TasksManagementUserSearchRequested _self;
  final $Res Function(TasksManagementUserSearchRequested) _then;

/// Create a copy of TasksManagementEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(TasksManagementUserSearchRequested(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TasksManagementClearUserSearch implements TasksManagementEvent {
  const TasksManagementClearUserSearch();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksManagementClearUserSearch);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksManagementEvent.clearUserSearch()';
}


}




// dart format on
