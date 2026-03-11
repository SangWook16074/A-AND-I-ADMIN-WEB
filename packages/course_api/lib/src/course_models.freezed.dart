// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourseSummary {

 String get id; String get title; String get slug; String? get description; String get phase; String get targetTrack; String get status; DateTime get createdAt; DateTime get updatedAt; String? get startDate; String? get endDate;
/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseSummaryCopyWith<CourseSummary> get copyWith => _$CourseSummaryCopyWithImpl<CourseSummary>(this as CourseSummary, _$identity);

  /// Serializes this CourseSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,description,phase,targetTrack,status,createdAt,updatedAt,startDate,endDate);

@override
String toString() {
  return 'CourseSummary(id: $id, title: $title, slug: $slug, description: $description, phase: $phase, targetTrack: $targetTrack, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CourseSummaryCopyWith<$Res>  {
  factory $CourseSummaryCopyWith(CourseSummary value, $Res Function(CourseSummary) _then) = _$CourseSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String slug, String? description, String phase, String targetTrack, String status, DateTime createdAt, DateTime updatedAt, String? startDate, String? endDate
});




}
/// @nodoc
class _$CourseSummaryCopyWithImpl<$Res>
    implements $CourseSummaryCopyWith<$Res> {
  _$CourseSummaryCopyWithImpl(this._self, this._then);

  final CourseSummary _self;
  final $Res Function(CourseSummary) _then;

/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? description = freezed,Object? phase = null,Object? targetTrack = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,targetTrack: null == targetTrack ? _self.targetTrack : targetTrack // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseSummary].
extension CourseSummaryPatterns on CourseSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseSummary value)  $default,){
final _that = this;
switch (_that) {
case _CourseSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CourseSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String slug,  String? description,  String phase,  String targetTrack,  String status,  DateTime createdAt,  DateTime updatedAt,  String? startDate,  String? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseSummary() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.phase,_that.targetTrack,_that.status,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String slug,  String? description,  String phase,  String targetTrack,  String status,  DateTime createdAt,  DateTime updatedAt,  String? startDate,  String? endDate)  $default,) {final _that = this;
switch (_that) {
case _CourseSummary():
return $default(_that.id,_that.title,_that.slug,_that.description,_that.phase,_that.targetTrack,_that.status,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String slug,  String? description,  String phase,  String targetTrack,  String status,  DateTime createdAt,  DateTime updatedAt,  String? startDate,  String? endDate)?  $default,) {final _that = this;
switch (_that) {
case _CourseSummary() when $default != null:
return $default(_that.id,_that.title,_that.slug,_that.description,_that.phase,_that.targetTrack,_that.status,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseSummary implements CourseSummary {
  const _CourseSummary({required this.id, required this.title, required this.slug, this.description, required this.phase, required this.targetTrack, required this.status, required this.createdAt, required this.updatedAt, this.startDate, this.endDate});
  factory _CourseSummary.fromJson(Map<String, dynamic> json) => _$CourseSummaryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String slug;
@override final  String? description;
@override final  String phase;
@override final  String targetTrack;
@override final  String status;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? startDate;
@override final  String? endDate;

/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseSummaryCopyWith<_CourseSummary> get copyWith => __$CourseSummaryCopyWithImpl<_CourseSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,slug,description,phase,targetTrack,status,createdAt,updatedAt,startDate,endDate);

@override
String toString() {
  return 'CourseSummary(id: $id, title: $title, slug: $slug, description: $description, phase: $phase, targetTrack: $targetTrack, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CourseSummaryCopyWith<$Res> implements $CourseSummaryCopyWith<$Res> {
  factory _$CourseSummaryCopyWith(_CourseSummary value, $Res Function(_CourseSummary) _then) = __$CourseSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String slug, String? description, String phase, String targetTrack, String status, DateTime createdAt, DateTime updatedAt, String? startDate, String? endDate
});




}
/// @nodoc
class __$CourseSummaryCopyWithImpl<$Res>
    implements _$CourseSummaryCopyWith<$Res> {
  __$CourseSummaryCopyWithImpl(this._self, this._then);

  final _CourseSummary _self;
  final $Res Function(_CourseSummary) _then;

/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? slug = null,Object? description = freezed,Object? phase = null,Object? targetTrack = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_CourseSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,targetTrack: null == targetTrack ? _self.targetTrack : targetTrack // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CreateCourseRequest {

 String get title; String get slug; String? get description; String get phase; String get targetTrack; String get startDate; String get endDate;
/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateCourseRequestCopyWith<CreateCourseRequest> get copyWith => _$CreateCourseRequestCopyWithImpl<CreateCourseRequest>(this as CreateCourseRequest, _$identity);

  /// Serializes this CreateCourseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateCourseRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,slug,description,phase,targetTrack,startDate,endDate);

@override
String toString() {
  return 'CreateCourseRequest(title: $title, slug: $slug, description: $description, phase: $phase, targetTrack: $targetTrack, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CreateCourseRequestCopyWith<$Res>  {
  factory $CreateCourseRequestCopyWith(CreateCourseRequest value, $Res Function(CreateCourseRequest) _then) = _$CreateCourseRequestCopyWithImpl;
@useResult
$Res call({
 String title, String slug, String? description, String phase, String targetTrack, String startDate, String endDate
});




}
/// @nodoc
class _$CreateCourseRequestCopyWithImpl<$Res>
    implements $CreateCourseRequestCopyWith<$Res> {
  _$CreateCourseRequestCopyWithImpl(this._self, this._then);

  final CreateCourseRequest _self;
  final $Res Function(CreateCourseRequest) _then;

/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? slug = null,Object? description = freezed,Object? phase = null,Object? targetTrack = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,targetTrack: null == targetTrack ? _self.targetTrack : targetTrack // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateCourseRequest].
extension CreateCourseRequestPatterns on CreateCourseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateCourseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateCourseRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateCourseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateCourseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String slug,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
return $default(_that.title,_that.slug,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String slug,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)  $default,) {final _that = this;
switch (_that) {
case _CreateCourseRequest():
return $default(_that.title,_that.slug,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String slug,  String? description,  String phase,  String targetTrack,  String startDate,  String endDate)?  $default,) {final _that = this;
switch (_that) {
case _CreateCourseRequest() when $default != null:
return $default(_that.title,_that.slug,_that.description,_that.phase,_that.targetTrack,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateCourseRequest implements CreateCourseRequest {
  const _CreateCourseRequest({required this.title, required this.slug, this.description, required this.phase, required this.targetTrack, required this.startDate, required this.endDate});
  factory _CreateCourseRequest.fromJson(Map<String, dynamic> json) => _$CreateCourseRequestFromJson(json);

@override final  String title;
@override final  String slug;
@override final  String? description;
@override final  String phase;
@override final  String targetTrack;
@override final  String startDate;
@override final  String endDate;

/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateCourseRequestCopyWith<_CreateCourseRequest> get copyWith => __$CreateCourseRequestCopyWithImpl<_CreateCourseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateCourseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateCourseRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,slug,description,phase,targetTrack,startDate,endDate);

@override
String toString() {
  return 'CreateCourseRequest(title: $title, slug: $slug, description: $description, phase: $phase, targetTrack: $targetTrack, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CreateCourseRequestCopyWith<$Res> implements $CreateCourseRequestCopyWith<$Res> {
  factory _$CreateCourseRequestCopyWith(_CreateCourseRequest value, $Res Function(_CreateCourseRequest) _then) = __$CreateCourseRequestCopyWithImpl;
@override @useResult
$Res call({
 String title, String slug, String? description, String phase, String targetTrack, String startDate, String endDate
});




}
/// @nodoc
class __$CreateCourseRequestCopyWithImpl<$Res>
    implements _$CreateCourseRequestCopyWith<$Res> {
  __$CreateCourseRequestCopyWithImpl(this._self, this._then);

  final _CreateCourseRequest _self;
  final $Res Function(_CreateCourseRequest) _then;

/// Create a copy of CreateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? slug = null,Object? description = freezed,Object? phase = null,Object? targetTrack = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_CreateCourseRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
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
mixin _$CourseWeek {

 String get id; int get weekNo; String get title; String get startDate; String get endDate;
/// Create a copy of CourseWeek
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseWeekCopyWith<CourseWeek> get copyWith => _$CourseWeekCopyWithImpl<CourseWeek>(this as CourseWeek, _$identity);

  /// Serializes this CourseWeek to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseWeek&&(identical(other.id, id) || other.id == id)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weekNo,title,startDate,endDate);

@override
String toString() {
  return 'CourseWeek(id: $id, weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CourseWeekCopyWith<$Res>  {
  factory $CourseWeekCopyWith(CourseWeek value, $Res Function(CourseWeek) _then) = _$CourseWeekCopyWithImpl;
@useResult
$Res call({
 String id, int weekNo, String title, String startDate, String endDate
});




}
/// @nodoc
class _$CourseWeekCopyWithImpl<$Res>
    implements $CourseWeekCopyWith<$Res> {
  _$CourseWeekCopyWithImpl(this._self, this._then);

  final CourseWeek _self;
  final $Res Function(CourseWeek) _then;

/// Create a copy of CourseWeek
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? weekNo = null,Object? title = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseWeek].
extension CourseWeekPatterns on CourseWeek {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseWeek value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseWeek() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseWeek value)  $default,){
final _that = this;
switch (_that) {
case _CourseWeek():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseWeek value)?  $default,){
final _that = this;
switch (_that) {
case _CourseWeek() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  int weekNo,  String title,  String startDate,  String endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseWeek() when $default != null:
return $default(_that.id,_that.weekNo,_that.title,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  int weekNo,  String title,  String startDate,  String endDate)  $default,) {final _that = this;
switch (_that) {
case _CourseWeek():
return $default(_that.id,_that.weekNo,_that.title,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  int weekNo,  String title,  String startDate,  String endDate)?  $default,) {final _that = this;
switch (_that) {
case _CourseWeek() when $default != null:
return $default(_that.id,_that.weekNo,_that.title,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseWeek implements CourseWeek {
  const _CourseWeek({required this.id, required this.weekNo, required this.title, required this.startDate, required this.endDate});
  factory _CourseWeek.fromJson(Map<String, dynamic> json) => _$CourseWeekFromJson(json);

@override final  String id;
@override final  int weekNo;
@override final  String title;
@override final  String startDate;
@override final  String endDate;

/// Create a copy of CourseWeek
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseWeekCopyWith<_CourseWeek> get copyWith => __$CourseWeekCopyWithImpl<_CourseWeek>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseWeekToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseWeek&&(identical(other.id, id) || other.id == id)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,weekNo,title,startDate,endDate);

@override
String toString() {
  return 'CourseWeek(id: $id, weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CourseWeekCopyWith<$Res> implements $CourseWeekCopyWith<$Res> {
  factory _$CourseWeekCopyWith(_CourseWeek value, $Res Function(_CourseWeek) _then) = __$CourseWeekCopyWithImpl;
@override @useResult
$Res call({
 String id, int weekNo, String title, String startDate, String endDate
});




}
/// @nodoc
class __$CourseWeekCopyWithImpl<$Res>
    implements _$CourseWeekCopyWith<$Res> {
  __$CourseWeekCopyWithImpl(this._self, this._then);

  final _CourseWeek _self;
  final $Res Function(_CourseWeek) _then;

/// Create a copy of CourseWeek
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? weekNo = null,Object? title = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_CourseWeek(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateWeekRequest {

 int get weekNo; String get title; String get startDate; String get endDate;
/// Create a copy of CreateWeekRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateWeekRequestCopyWith<CreateWeekRequest> get copyWith => _$CreateWeekRequestCopyWithImpl<CreateWeekRequest>(this as CreateWeekRequest, _$identity);

  /// Serializes this CreateWeekRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateWeekRequest&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNo,title,startDate,endDate);

@override
String toString() {
  return 'CreateWeekRequest(weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CreateWeekRequestCopyWith<$Res>  {
  factory $CreateWeekRequestCopyWith(CreateWeekRequest value, $Res Function(CreateWeekRequest) _then) = _$CreateWeekRequestCopyWithImpl;
@useResult
$Res call({
 int weekNo, String title, String startDate, String endDate
});




}
/// @nodoc
class _$CreateWeekRequestCopyWithImpl<$Res>
    implements $CreateWeekRequestCopyWith<$Res> {
  _$CreateWeekRequestCopyWithImpl(this._self, this._then);

  final CreateWeekRequest _self;
  final $Res Function(CreateWeekRequest) _then;

/// Create a copy of CreateWeekRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekNo = null,Object? title = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_self.copyWith(
weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateWeekRequest].
extension CreateWeekRequestPatterns on CreateWeekRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateWeekRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateWeekRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateWeekRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateWeekRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateWeekRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateWeekRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNo,  String title,  String startDate,  String endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateWeekRequest() when $default != null:
return $default(_that.weekNo,_that.title,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNo,  String title,  String startDate,  String endDate)  $default,) {final _that = this;
switch (_that) {
case _CreateWeekRequest():
return $default(_that.weekNo,_that.title,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNo,  String title,  String startDate,  String endDate)?  $default,) {final _that = this;
switch (_that) {
case _CreateWeekRequest() when $default != null:
return $default(_that.weekNo,_that.title,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateWeekRequest implements CreateWeekRequest {
  const _CreateWeekRequest({required this.weekNo, required this.title, required this.startDate, required this.endDate});
  factory _CreateWeekRequest.fromJson(Map<String, dynamic> json) => _$CreateWeekRequestFromJson(json);

@override final  int weekNo;
@override final  String title;
@override final  String startDate;
@override final  String endDate;

/// Create a copy of CreateWeekRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateWeekRequestCopyWith<_CreateWeekRequest> get copyWith => __$CreateWeekRequestCopyWithImpl<_CreateWeekRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateWeekRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateWeekRequest&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.title, title) || other.title == title)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNo,title,startDate,endDate);

@override
String toString() {
  return 'CreateWeekRequest(weekNo: $weekNo, title: $title, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CreateWeekRequestCopyWith<$Res> implements $CreateWeekRequestCopyWith<$Res> {
  factory _$CreateWeekRequestCopyWith(_CreateWeekRequest value, $Res Function(_CreateWeekRequest) _then) = __$CreateWeekRequestCopyWithImpl;
@override @useResult
$Res call({
 int weekNo, String title, String startDate, String endDate
});




}
/// @nodoc
class __$CreateWeekRequestCopyWithImpl<$Res>
    implements _$CreateWeekRequestCopyWith<$Res> {
  __$CreateWeekRequestCopyWithImpl(this._self, this._then);

  final _CreateWeekRequest _self;
  final $Res Function(_CreateWeekRequest) _then;

/// Create a copy of CreateWeekRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekNo = null,Object? title = null,Object? startDate = null,Object? endDate = null,}) {
  return _then(_CreateWeekRequest(
weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Enrollment {

 String get id; String get userId; String get status; DateTime get joinedAt; DateTime? get droppedAt; DateTime? get bannedAt; String? get banReason; DateTime get updatedAt;
/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentCopyWith<Enrollment> get copyWith => _$EnrollmentCopyWithImpl<Enrollment>(this as Enrollment, _$identity);

  /// Serializes this Enrollment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Enrollment&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.droppedAt, droppedAt) || other.droppedAt == droppedAt)&&(identical(other.bannedAt, bannedAt) || other.bannedAt == bannedAt)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,status,joinedAt,droppedAt,bannedAt,banReason,updatedAt);

@override
String toString() {
  return 'Enrollment(id: $id, userId: $userId, status: $status, joinedAt: $joinedAt, droppedAt: $droppedAt, bannedAt: $bannedAt, banReason: $banReason, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EnrollmentCopyWith<$Res>  {
  factory $EnrollmentCopyWith(Enrollment value, $Res Function(Enrollment) _then) = _$EnrollmentCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String status, DateTime joinedAt, DateTime? droppedAt, DateTime? bannedAt, String? banReason, DateTime updatedAt
});




}
/// @nodoc
class _$EnrollmentCopyWithImpl<$Res>
    implements $EnrollmentCopyWith<$Res> {
  _$EnrollmentCopyWithImpl(this._self, this._then);

  final Enrollment _self;
  final $Res Function(Enrollment) _then;

/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? status = null,Object? joinedAt = null,Object? droppedAt = freezed,Object? bannedAt = freezed,Object? banReason = freezed,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,droppedAt: freezed == droppedAt ? _self.droppedAt : droppedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bannedAt: freezed == bannedAt ? _self.bannedAt : bannedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Enrollment].
extension EnrollmentPatterns on Enrollment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Enrollment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Enrollment value)  $default,){
final _that = this;
switch (_that) {
case _Enrollment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Enrollment value)?  $default,){
final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String status,  DateTime joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
return $default(_that.id,_that.userId,_that.status,_that.joinedAt,_that.droppedAt,_that.bannedAt,_that.banReason,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String status,  DateTime joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Enrollment():
return $default(_that.id,_that.userId,_that.status,_that.joinedAt,_that.droppedAt,_that.bannedAt,_that.banReason,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String status,  DateTime joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
return $default(_that.id,_that.userId,_that.status,_that.joinedAt,_that.droppedAt,_that.bannedAt,_that.banReason,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Enrollment implements Enrollment {
  const _Enrollment({required this.id, required this.userId, required this.status, required this.joinedAt, this.droppedAt, this.bannedAt, this.banReason, required this.updatedAt});
  factory _Enrollment.fromJson(Map<String, dynamic> json) => _$EnrollmentFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String status;
@override final  DateTime joinedAt;
@override final  DateTime? droppedAt;
@override final  DateTime? bannedAt;
@override final  String? banReason;
@override final  DateTime updatedAt;

/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EnrollmentCopyWith<_Enrollment> get copyWith => __$EnrollmentCopyWithImpl<_Enrollment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnrollmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Enrollment&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.droppedAt, droppedAt) || other.droppedAt == droppedAt)&&(identical(other.bannedAt, bannedAt) || other.bannedAt == bannedAt)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,status,joinedAt,droppedAt,bannedAt,banReason,updatedAt);

@override
String toString() {
  return 'Enrollment(id: $id, userId: $userId, status: $status, joinedAt: $joinedAt, droppedAt: $droppedAt, bannedAt: $bannedAt, banReason: $banReason, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EnrollmentCopyWith<$Res> implements $EnrollmentCopyWith<$Res> {
  factory _$EnrollmentCopyWith(_Enrollment value, $Res Function(_Enrollment) _then) = __$EnrollmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String status, DateTime joinedAt, DateTime? droppedAt, DateTime? bannedAt, String? banReason, DateTime updatedAt
});




}
/// @nodoc
class __$EnrollmentCopyWithImpl<$Res>
    implements _$EnrollmentCopyWith<$Res> {
  __$EnrollmentCopyWithImpl(this._self, this._then);

  final _Enrollment _self;
  final $Res Function(_Enrollment) _then;

/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? status = null,Object? joinedAt = null,Object? droppedAt = freezed,Object? bannedAt = freezed,Object? banReason = freezed,Object? updatedAt = null,}) {
  return _then(_Enrollment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,joinedAt: null == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime,droppedAt: freezed == droppedAt ? _self.droppedAt : droppedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bannedAt: freezed == bannedAt ? _self.bannedAt : bannedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$AssignmentMetadata {

 String get title; String get difficulty; String? get description; int? get timeLimitMinutes; List<String> get learningGoals; Map<String, dynamic> get attributes;
/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<AssignmentMetadata> get copyWith => _$AssignmentMetadataCopyWithImpl<AssignmentMetadata>(this as AssignmentMetadata, _$identity);

  /// Serializes this AssignmentMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&const DeepCollectionEquality().equals(other.learningGoals, learningGoals)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,difficulty,description,timeLimitMinutes,const DeepCollectionEquality().hash(learningGoals),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'AssignmentMetadata(title: $title, difficulty: $difficulty, description: $description, timeLimitMinutes: $timeLimitMinutes, learningGoals: $learningGoals, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $AssignmentMetadataCopyWith<$Res>  {
  factory $AssignmentMetadataCopyWith(AssignmentMetadata value, $Res Function(AssignmentMetadata) _then) = _$AssignmentMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String difficulty, String? description, int? timeLimitMinutes, List<String> learningGoals, Map<String, dynamic> attributes
});




}
/// @nodoc
class _$AssignmentMetadataCopyWithImpl<$Res>
    implements $AssignmentMetadataCopyWith<$Res> {
  _$AssignmentMetadataCopyWithImpl(this._self, this._then);

  final AssignmentMetadata _self;
  final $Res Function(AssignmentMetadata) _then;

/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? difficulty = null,Object? description = freezed,Object? timeLimitMinutes = freezed,Object? learningGoals = null,Object? attributes = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timeLimitMinutes: freezed == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int?,learningGoals: null == learningGoals ? _self.learningGoals : learningGoals // ignore: cast_nullable_to_non_nullable
as List<String>,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentMetadata].
extension AssignmentMetadataPatterns on AssignmentMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentMetadata value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String difficulty,  String? description,  int? timeLimitMinutes,  List<String> learningGoals,  Map<String, dynamic> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
return $default(_that.title,_that.difficulty,_that.description,_that.timeLimitMinutes,_that.learningGoals,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String difficulty,  String? description,  int? timeLimitMinutes,  List<String> learningGoals,  Map<String, dynamic> attributes)  $default,) {final _that = this;
switch (_that) {
case _AssignmentMetadata():
return $default(_that.title,_that.difficulty,_that.description,_that.timeLimitMinutes,_that.learningGoals,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String difficulty,  String? description,  int? timeLimitMinutes,  List<String> learningGoals,  Map<String, dynamic> attributes)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
return $default(_that.title,_that.difficulty,_that.description,_that.timeLimitMinutes,_that.learningGoals,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentMetadata implements AssignmentMetadata {
  const _AssignmentMetadata({required this.title, this.difficulty = 'MID', this.description, this.timeLimitMinutes, final  List<String> learningGoals = const [], final  Map<String, dynamic> attributes = const {}}): _learningGoals = learningGoals,_attributes = attributes;
  factory _AssignmentMetadata.fromJson(Map<String, dynamic> json) => _$AssignmentMetadataFromJson(json);

@override final  String title;
@override@JsonKey() final  String difficulty;
@override final  String? description;
@override final  int? timeLimitMinutes;
 final  List<String> _learningGoals;
@override@JsonKey() List<String> get learningGoals {
  if (_learningGoals is EqualUnmodifiableListView) return _learningGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_learningGoals);
}

 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentMetadataCopyWith<_AssignmentMetadata> get copyWith => __$AssignmentMetadataCopyWithImpl<_AssignmentMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&const DeepCollectionEquality().equals(other._learningGoals, _learningGoals)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,difficulty,description,timeLimitMinutes,const DeepCollectionEquality().hash(_learningGoals),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'AssignmentMetadata(title: $title, difficulty: $difficulty, description: $description, timeLimitMinutes: $timeLimitMinutes, learningGoals: $learningGoals, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$AssignmentMetadataCopyWith<$Res> implements $AssignmentMetadataCopyWith<$Res> {
  factory _$AssignmentMetadataCopyWith(_AssignmentMetadata value, $Res Function(_AssignmentMetadata) _then) = __$AssignmentMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String difficulty, String? description, int? timeLimitMinutes, List<String> learningGoals, Map<String, dynamic> attributes
});




}
/// @nodoc
class __$AssignmentMetadataCopyWithImpl<$Res>
    implements _$AssignmentMetadataCopyWith<$Res> {
  __$AssignmentMetadataCopyWithImpl(this._self, this._then);

  final _AssignmentMetadata _self;
  final $Res Function(_AssignmentMetadata) _then;

/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? difficulty = null,Object? description = freezed,Object? timeLimitMinutes = freezed,Object? learningGoals = null,Object? attributes = null,}) {
  return _then(_AssignmentMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timeLimitMinutes: freezed == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int?,learningGoals: null == learningGoals ? _self._learningGoals : learningGoals // ignore: cast_nullable_to_non_nullable
as List<String>,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$AssignmentRequirement {

 int get sortOrder; String get requirementText;
/// Create a copy of AssignmentRequirement
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentRequirementCopyWith<AssignmentRequirement> get copyWith => _$AssignmentRequirementCopyWithImpl<AssignmentRequirement>(this as AssignmentRequirement, _$identity);

  /// Serializes this AssignmentRequirement to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentRequirement&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.requirementText, requirementText) || other.requirementText == requirementText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortOrder,requirementText);

@override
String toString() {
  return 'AssignmentRequirement(sortOrder: $sortOrder, requirementText: $requirementText)';
}


}

/// @nodoc
abstract mixin class $AssignmentRequirementCopyWith<$Res>  {
  factory $AssignmentRequirementCopyWith(AssignmentRequirement value, $Res Function(AssignmentRequirement) _then) = _$AssignmentRequirementCopyWithImpl;
@useResult
$Res call({
 int sortOrder, String requirementText
});




}
/// @nodoc
class _$AssignmentRequirementCopyWithImpl<$Res>
    implements $AssignmentRequirementCopyWith<$Res> {
  _$AssignmentRequirementCopyWithImpl(this._self, this._then);

  final AssignmentRequirement _self;
  final $Res Function(AssignmentRequirement) _then;

/// Create a copy of AssignmentRequirement
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sortOrder = null,Object? requirementText = null,}) {
  return _then(_self.copyWith(
sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,requirementText: null == requirementText ? _self.requirementText : requirementText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentRequirement].
extension AssignmentRequirementPatterns on AssignmentRequirement {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentRequirement value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentRequirement() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentRequirement value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentRequirement():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentRequirement value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentRequirement() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sortOrder,  String requirementText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentRequirement() when $default != null:
return $default(_that.sortOrder,_that.requirementText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sortOrder,  String requirementText)  $default,) {final _that = this;
switch (_that) {
case _AssignmentRequirement():
return $default(_that.sortOrder,_that.requirementText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sortOrder,  String requirementText)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentRequirement() when $default != null:
return $default(_that.sortOrder,_that.requirementText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentRequirement implements AssignmentRequirement {
  const _AssignmentRequirement({required this.sortOrder, required this.requirementText});
  factory _AssignmentRequirement.fromJson(Map<String, dynamic> json) => _$AssignmentRequirementFromJson(json);

@override final  int sortOrder;
@override final  String requirementText;

/// Create a copy of AssignmentRequirement
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentRequirementCopyWith<_AssignmentRequirement> get copyWith => __$AssignmentRequirementCopyWithImpl<_AssignmentRequirement>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentRequirementToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentRequirement&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.requirementText, requirementText) || other.requirementText == requirementText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortOrder,requirementText);

@override
String toString() {
  return 'AssignmentRequirement(sortOrder: $sortOrder, requirementText: $requirementText)';
}


}

/// @nodoc
abstract mixin class _$AssignmentRequirementCopyWith<$Res> implements $AssignmentRequirementCopyWith<$Res> {
  factory _$AssignmentRequirementCopyWith(_AssignmentRequirement value, $Res Function(_AssignmentRequirement) _then) = __$AssignmentRequirementCopyWithImpl;
@override @useResult
$Res call({
 int sortOrder, String requirementText
});




}
/// @nodoc
class __$AssignmentRequirementCopyWithImpl<$Res>
    implements _$AssignmentRequirementCopyWith<$Res> {
  __$AssignmentRequirementCopyWithImpl(this._self, this._then);

  final _AssignmentRequirement _self;
  final $Res Function(_AssignmentRequirement) _then;

/// Create a copy of AssignmentRequirement
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortOrder = null,Object? requirementText = null,}) {
  return _then(_AssignmentRequirement(
sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,requirementText: null == requirementText ? _self.requirementText : requirementText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$AssignmentExample {

 int get seq; String? get inputText; String? get outputText; String? get description;
/// Create a copy of AssignmentExample
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentExampleCopyWith<AssignmentExample> get copyWith => _$AssignmentExampleCopyWithImpl<AssignmentExample>(this as AssignmentExample, _$identity);

  /// Serializes this AssignmentExample to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentExample&&(identical(other.seq, seq) || other.seq == seq)&&(identical(other.inputText, inputText) || other.inputText == inputText)&&(identical(other.outputText, outputText) || other.outputText == outputText)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seq,inputText,outputText,description);

@override
String toString() {
  return 'AssignmentExample(seq: $seq, inputText: $inputText, outputText: $outputText, description: $description)';
}


}

/// @nodoc
abstract mixin class $AssignmentExampleCopyWith<$Res>  {
  factory $AssignmentExampleCopyWith(AssignmentExample value, $Res Function(AssignmentExample) _then) = _$AssignmentExampleCopyWithImpl;
@useResult
$Res call({
 int seq, String? inputText, String? outputText, String? description
});




}
/// @nodoc
class _$AssignmentExampleCopyWithImpl<$Res>
    implements $AssignmentExampleCopyWith<$Res> {
  _$AssignmentExampleCopyWithImpl(this._self, this._then);

  final AssignmentExample _self;
  final $Res Function(AssignmentExample) _then;

/// Create a copy of AssignmentExample
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seq = null,Object? inputText = freezed,Object? outputText = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,inputText: freezed == inputText ? _self.inputText : inputText // ignore: cast_nullable_to_non_nullable
as String?,outputText: freezed == outputText ? _self.outputText : outputText // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentExample].
extension AssignmentExamplePatterns on AssignmentExample {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentExample value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentExample() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentExample value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentExample():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentExample value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentExample() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seq,  String? inputText,  String? outputText,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentExample() when $default != null:
return $default(_that.seq,_that.inputText,_that.outputText,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seq,  String? inputText,  String? outputText,  String? description)  $default,) {final _that = this;
switch (_that) {
case _AssignmentExample():
return $default(_that.seq,_that.inputText,_that.outputText,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seq,  String? inputText,  String? outputText,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentExample() when $default != null:
return $default(_that.seq,_that.inputText,_that.outputText,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentExample implements AssignmentExample {
  const _AssignmentExample({required this.seq, this.inputText, this.outputText, this.description});
  factory _AssignmentExample.fromJson(Map<String, dynamic> json) => _$AssignmentExampleFromJson(json);

@override final  int seq;
@override final  String? inputText;
@override final  String? outputText;
@override final  String? description;

/// Create a copy of AssignmentExample
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentExampleCopyWith<_AssignmentExample> get copyWith => __$AssignmentExampleCopyWithImpl<_AssignmentExample>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentExampleToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentExample&&(identical(other.seq, seq) || other.seq == seq)&&(identical(other.inputText, inputText) || other.inputText == inputText)&&(identical(other.outputText, outputText) || other.outputText == outputText)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seq,inputText,outputText,description);

@override
String toString() {
  return 'AssignmentExample(seq: $seq, inputText: $inputText, outputText: $outputText, description: $description)';
}


}

/// @nodoc
abstract mixin class _$AssignmentExampleCopyWith<$Res> implements $AssignmentExampleCopyWith<$Res> {
  factory _$AssignmentExampleCopyWith(_AssignmentExample value, $Res Function(_AssignmentExample) _then) = __$AssignmentExampleCopyWithImpl;
@override @useResult
$Res call({
 int seq, String? inputText, String? outputText, String? description
});




}
/// @nodoc
class __$AssignmentExampleCopyWithImpl<$Res>
    implements _$AssignmentExampleCopyWith<$Res> {
  __$AssignmentExampleCopyWithImpl(this._self, this._then);

  final _AssignmentExample _self;
  final $Res Function(_AssignmentExample) _then;

/// Create a copy of AssignmentExample
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seq = null,Object? inputText = freezed,Object? outputText = freezed,Object? description = freezed,}) {
  return _then(_AssignmentExample(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,inputText: freezed == inputText ? _self.inputText : inputText // ignore: cast_nullable_to_non_nullable
as String?,outputText: freezed == outputText ? _self.outputText : outputText // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Assignment {

 String get id; String? get courseSlug; int get weekNo; int get orderInWeek; String get startAt; String get endAt; String get status; String? get publishedAt; AssignmentMetadata get metadata; List<AssignmentRequirement> get requirements; List<AssignmentExample> get examples;
/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentCopyWith<Assignment> get copyWith => _$AssignmentCopyWithImpl<Assignment>(this as Assignment, _$identity);

  /// Serializes this Assignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Assignment&&(identical(other.id, id) || other.id == id)&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.examples, examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseSlug,weekNo,orderInWeek,startAt,endAt,status,publishedAt,metadata,const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(examples));

@override
String toString() {
  return 'Assignment(id: $id, courseSlug: $courseSlug, weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, status: $status, publishedAt: $publishedAt, metadata: $metadata, requirements: $requirements, examples: $examples)';
}


}

/// @nodoc
abstract mixin class $AssignmentCopyWith<$Res>  {
  factory $AssignmentCopyWith(Assignment value, $Res Function(Assignment) _then) = _$AssignmentCopyWithImpl;
@useResult
$Res call({
 String id, String? courseSlug, int weekNo, int orderInWeek, String startAt, String endAt, String status, String? publishedAt, AssignmentMetadata metadata, List<AssignmentRequirement> requirements, List<AssignmentExample> examples
});


$AssignmentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$AssignmentCopyWithImpl<$Res>
    implements $AssignmentCopyWith<$Res> {
  _$AssignmentCopyWithImpl(this._self, this._then);

  final Assignment _self;
  final $Res Function(Assignment) _then;

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseSlug = freezed,Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? status = null,Object? publishedAt = freezed,Object? metadata = null,Object? requirements = null,Object? examples = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseSlug: freezed == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String?,weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<AssignmentExample>,
  ));
}
/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<$Res> get metadata {
  
  return $AssignmentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [Assignment].
extension AssignmentPatterns on Assignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Assignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Assignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Assignment value)  $default,){
final _that = this;
switch (_that) {
case _Assignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Assignment value)?  $default,){
final _that = this;
switch (_that) {
case _Assignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? courseSlug,  int weekNo,  int orderInWeek,  String startAt,  String endAt,  String status,  String? publishedAt,  AssignmentMetadata metadata,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Assignment() when $default != null:
return $default(_that.id,_that.courseSlug,_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.status,_that.publishedAt,_that.metadata,_that.requirements,_that.examples);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? courseSlug,  int weekNo,  int orderInWeek,  String startAt,  String endAt,  String status,  String? publishedAt,  AssignmentMetadata metadata,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples)  $default,) {final _that = this;
switch (_that) {
case _Assignment():
return $default(_that.id,_that.courseSlug,_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.status,_that.publishedAt,_that.metadata,_that.requirements,_that.examples);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? courseSlug,  int weekNo,  int orderInWeek,  String startAt,  String endAt,  String status,  String? publishedAt,  AssignmentMetadata metadata,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples)?  $default,) {final _that = this;
switch (_that) {
case _Assignment() when $default != null:
return $default(_that.id,_that.courseSlug,_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.status,_that.publishedAt,_that.metadata,_that.requirements,_that.examples);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Assignment implements Assignment {
  const _Assignment({required this.id, this.courseSlug, required this.weekNo, required this.orderInWeek, required this.startAt, required this.endAt, required this.status, this.publishedAt, required this.metadata, final  List<AssignmentRequirement> requirements = const [], final  List<AssignmentExample> examples = const []}): _requirements = requirements,_examples = examples;
  factory _Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);

@override final  String id;
@override final  String? courseSlug;
@override final  int weekNo;
@override final  int orderInWeek;
@override final  String startAt;
@override final  String endAt;
@override final  String status;
@override final  String? publishedAt;
@override final  AssignmentMetadata metadata;
 final  List<AssignmentRequirement> _requirements;
@override@JsonKey() List<AssignmentRequirement> get requirements {
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirements);
}

 final  List<AssignmentExample> _examples;
@override@JsonKey() List<AssignmentExample> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}


/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentCopyWith<_Assignment> get copyWith => __$AssignmentCopyWithImpl<_Assignment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Assignment&&(identical(other.id, id) || other.id == id)&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._examples, _examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseSlug,weekNo,orderInWeek,startAt,endAt,status,publishedAt,metadata,const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_examples));

@override
String toString() {
  return 'Assignment(id: $id, courseSlug: $courseSlug, weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, status: $status, publishedAt: $publishedAt, metadata: $metadata, requirements: $requirements, examples: $examples)';
}


}

/// @nodoc
abstract mixin class _$AssignmentCopyWith<$Res> implements $AssignmentCopyWith<$Res> {
  factory _$AssignmentCopyWith(_Assignment value, $Res Function(_Assignment) _then) = __$AssignmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String? courseSlug, int weekNo, int orderInWeek, String startAt, String endAt, String status, String? publishedAt, AssignmentMetadata metadata, List<AssignmentRequirement> requirements, List<AssignmentExample> examples
});


@override $AssignmentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$AssignmentCopyWithImpl<$Res>
    implements _$AssignmentCopyWith<$Res> {
  __$AssignmentCopyWithImpl(this._self, this._then);

  final _Assignment _self;
  final $Res Function(_Assignment) _then;

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseSlug = freezed,Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? status = null,Object? publishedAt = freezed,Object? metadata = null,Object? requirements = null,Object? examples = null,}) {
  return _then(_Assignment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,courseSlug: freezed == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String?,weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,publishedAt: freezed == publishedAt ? _self.publishedAt : publishedAt // ignore: cast_nullable_to_non_nullable
as String?,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<AssignmentExample>,
  ));
}

/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<$Res> get metadata {
  
  return $AssignmentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$CreateAssignmentRequest {

 int get weekNo; int get orderInWeek; String get startAt; String get endAt; AssignmentMetadata get metadata; List<AssignmentRequirement> get requirements; List<AssignmentExample> get examples;
/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAssignmentRequestCopyWith<CreateAssignmentRequest> get copyWith => _$CreateAssignmentRequestCopyWithImpl<CreateAssignmentRequest>(this as CreateAssignmentRequest, _$identity);

  /// Serializes this CreateAssignmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAssignmentRequest&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.examples, examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNo,orderInWeek,startAt,endAt,metadata,const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(examples));

@override
String toString() {
  return 'CreateAssignmentRequest(weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata, requirements: $requirements, examples: $examples)';
}


}

/// @nodoc
abstract mixin class $CreateAssignmentRequestCopyWith<$Res>  {
  factory $CreateAssignmentRequestCopyWith(CreateAssignmentRequest value, $Res Function(CreateAssignmentRequest) _then) = _$CreateAssignmentRequestCopyWithImpl;
@useResult
$Res call({
 int weekNo, int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata, List<AssignmentRequirement> requirements, List<AssignmentExample> examples
});


$AssignmentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$CreateAssignmentRequestCopyWithImpl<$Res>
    implements $CreateAssignmentRequestCopyWith<$Res> {
  _$CreateAssignmentRequestCopyWithImpl(this._self, this._then);

  final CreateAssignmentRequest _self;
  final $Res Function(CreateAssignmentRequest) _then;

/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,Object? requirements = null,Object? examples = null,}) {
  return _then(_self.copyWith(
weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<AssignmentExample>,
  ));
}
/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<$Res> get metadata {
  
  return $AssignmentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateAssignmentRequest].
extension CreateAssignmentRequestPatterns on CreateAssignmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateAssignmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateAssignmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateAssignmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateAssignmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNo,  int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
return $default(_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata,_that.requirements,_that.examples);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNo,  int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples)  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest():
return $default(_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata,_that.requirements,_that.examples);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNo,  int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples)?  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
return $default(_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata,_that.requirements,_that.examples);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAssignmentRequest implements CreateAssignmentRequest {
  const _CreateAssignmentRequest({required this.weekNo, required this.orderInWeek, required this.startAt, required this.endAt, required this.metadata, final  List<AssignmentRequirement> requirements = const [], final  List<AssignmentExample> examples = const []}): _requirements = requirements,_examples = examples;
  factory _CreateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$CreateAssignmentRequestFromJson(json);

@override final  int weekNo;
@override final  int orderInWeek;
@override final  String startAt;
@override final  String endAt;
@override final  AssignmentMetadata metadata;
 final  List<AssignmentRequirement> _requirements;
@override@JsonKey() List<AssignmentRequirement> get requirements {
  if (_requirements is EqualUnmodifiableListView) return _requirements;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_requirements);
}

 final  List<AssignmentExample> _examples;
@override@JsonKey() List<AssignmentExample> get examples {
  if (_examples is EqualUnmodifiableListView) return _examples;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_examples);
}


/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateAssignmentRequestCopyWith<_CreateAssignmentRequest> get copyWith => __$CreateAssignmentRequestCopyWithImpl<_CreateAssignmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAssignmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAssignmentRequest&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._examples, _examples));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNo,orderInWeek,startAt,endAt,metadata,const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_examples));

@override
String toString() {
  return 'CreateAssignmentRequest(weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata, requirements: $requirements, examples: $examples)';
}


}

/// @nodoc
abstract mixin class _$CreateAssignmentRequestCopyWith<$Res> implements $CreateAssignmentRequestCopyWith<$Res> {
  factory _$CreateAssignmentRequestCopyWith(_CreateAssignmentRequest value, $Res Function(_CreateAssignmentRequest) _then) = __$CreateAssignmentRequestCopyWithImpl;
@override @useResult
$Res call({
 int weekNo, int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata, List<AssignmentRequirement> requirements, List<AssignmentExample> examples
});


@override $AssignmentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$CreateAssignmentRequestCopyWithImpl<$Res>
    implements _$CreateAssignmentRequestCopyWith<$Res> {
  __$CreateAssignmentRequestCopyWithImpl(this._self, this._then);

  final _CreateAssignmentRequest _self;
  final $Res Function(_CreateAssignmentRequest) _then;

/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,Object? requirements = null,Object? examples = null,}) {
  return _then(_CreateAssignmentRequest(
weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<AssignmentExample>,
  ));
}

/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<$Res> get metadata {
  
  return $AssignmentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
