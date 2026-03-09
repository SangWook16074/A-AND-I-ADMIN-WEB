// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CourseViewState {

 CourseListViewStatus get status; List<CourseSummary> get courses; String get errorMessage;
/// Create a copy of CourseViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseViewStateCopyWith<CourseViewState> get copyWith => _$CourseViewStateCopyWithImpl<CourseViewState>(this as CourseViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseViewState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.courses, courses)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(courses),errorMessage);

@override
String toString() {
  return 'CourseViewState(status: $status, courses: $courses, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CourseViewStateCopyWith<$Res>  {
  factory $CourseViewStateCopyWith(CourseViewState value, $Res Function(CourseViewState) _then) = _$CourseViewStateCopyWithImpl;
@useResult
$Res call({
 CourseListViewStatus status, List<CourseSummary> courses, String errorMessage
});




}
/// @nodoc
class _$CourseViewStateCopyWithImpl<$Res>
    implements $CourseViewStateCopyWith<$Res> {
  _$CourseViewStateCopyWithImpl(this._self, this._then);

  final CourseViewState _self;
  final $Res Function(CourseViewState) _then;

/// Create a copy of CourseViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? courses = null,Object? errorMessage = null,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CourseListViewStatus,courses: null == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<CourseSummary>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseViewState].
extension CourseViewStatePatterns on CourseViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseViewState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseViewState value)  $default,){
final _that = this;
switch (_that) {
case _CourseViewState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseViewState value)?  $default,){
final _that = this;
switch (_that) {
case _CourseViewState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CourseListViewStatus status,  List<CourseSummary> courses,  String errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseViewState() when $default != null:
return $default(_that.status,_that.courses,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CourseListViewStatus status,  List<CourseSummary> courses,  String errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CourseViewState():
return $default(_that.status,_that.courses,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CourseListViewStatus status,  List<CourseSummary> courses,  String errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CourseViewState() when $default != null:
return $default(_that.status,_that.courses,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CourseViewState implements CourseViewState {
  const _CourseViewState({this.status = CourseListViewStatus.init, final  List<CourseSummary> courses = const [], this.errorMessage = ""}): _courses = courses;
  

@override@JsonKey() final  CourseListViewStatus status;
 final  List<CourseSummary> _courses;
@override@JsonKey() List<CourseSummary> get courses {
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courses);
}

@override@JsonKey() final  String errorMessage;

/// Create a copy of CourseViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseViewStateCopyWith<_CourseViewState> get copyWith => __$CourseViewStateCopyWithImpl<_CourseViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseViewState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._courses, _courses)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_courses),errorMessage);

@override
String toString() {
  return 'CourseViewState(status: $status, courses: $courses, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CourseViewStateCopyWith<$Res> implements $CourseViewStateCopyWith<$Res> {
  factory _$CourseViewStateCopyWith(_CourseViewState value, $Res Function(_CourseViewState) _then) = __$CourseViewStateCopyWithImpl;
@override @useResult
$Res call({
 CourseListViewStatus status, List<CourseSummary> courses, String errorMessage
});




}
/// @nodoc
class __$CourseViewStateCopyWithImpl<$Res>
    implements _$CourseViewStateCopyWith<$Res> {
  __$CourseViewStateCopyWithImpl(this._self, this._then);

  final _CourseViewState _self;
  final $Res Function(_CourseViewState) _then;

/// Create a copy of CourseViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? courses = null,Object? errorMessage = null,}) {
  return _then(_CourseViewState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CourseListViewStatus,courses: null == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<CourseSummary>,errorMessage: null == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
