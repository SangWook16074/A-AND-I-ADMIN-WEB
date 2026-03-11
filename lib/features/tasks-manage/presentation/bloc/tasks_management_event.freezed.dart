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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TasksManagementStarted value)?  started,TResult Function( TasksManagementRefreshRequested value)?  refreshRequested,TResult Function( TasksManagementCreateCourseRequested value)?  createCourseRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started(_that);case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TasksManagementStarted value)  started,required TResult Function( TasksManagementRefreshRequested value)  refreshRequested,required TResult Function( TasksManagementCreateCourseRequested value)  createCourseRequested,}){
final _that = this;
switch (_that) {
case TasksManagementStarted():
return started(_that);case TasksManagementRefreshRequested():
return refreshRequested(_that);case TasksManagementCreateCourseRequested():
return createCourseRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TasksManagementStarted value)?  started,TResult? Function( TasksManagementRefreshRequested value)?  refreshRequested,TResult? Function( TasksManagementCreateCourseRequested value)?  createCourseRequested,}){
final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started(_that);case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function()?  refreshRequested,TResult Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  createCourseRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started();case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested();case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function()  refreshRequested,required TResult Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)  createCourseRequested,}) {final _that = this;
switch (_that) {
case TasksManagementStarted():
return started();case TasksManagementRefreshRequested():
return refreshRequested();case TasksManagementCreateCourseRequested():
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function()?  refreshRequested,TResult? Function( String slug,  String title,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  createCourseRequested,}) {final _that = this;
switch (_that) {
case TasksManagementStarted() when started != null:
return started();case TasksManagementRefreshRequested() when refreshRequested != null:
return refreshRequested();case TasksManagementCreateCourseRequested() when createCourseRequested != null:
return createCourseRequested(_that.slug,_that.title,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case _:
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

// dart format on
