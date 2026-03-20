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
mixin _$CourseMetadata {

 String get title; String? get description; String get phase; Map<String, dynamic> get attributes;
/// Create a copy of CourseMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseMetadataCopyWith<CourseMetadata> get copyWith => _$CourseMetadataCopyWithImpl<CourseMetadata>(this as CourseMetadata, _$identity);

  /// Serializes this CourseMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,phase,const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'CourseMetadata(title: $title, description: $description, phase: $phase, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $CourseMetadataCopyWith<$Res>  {
  factory $CourseMetadataCopyWith(CourseMetadata value, $Res Function(CourseMetadata) _then) = _$CourseMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String? description, String phase, Map<String, dynamic> attributes
});




}
/// @nodoc
class _$CourseMetadataCopyWithImpl<$Res>
    implements $CourseMetadataCopyWith<$Res> {
  _$CourseMetadataCopyWithImpl(this._self, this._then);

  final CourseMetadata _self;
  final $Res Function(CourseMetadata) _then;

/// Create a copy of CourseMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = freezed,Object? phase = null,Object? attributes = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [CourseMetadata].
extension CourseMetadataPatterns on CourseMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourseMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourseMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourseMetadata value)  $default,){
final _that = this;
switch (_that) {
case _CourseMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourseMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _CourseMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String? description,  String phase,  Map<String, dynamic> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseMetadata() when $default != null:
return $default(_that.title,_that.description,_that.phase,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String? description,  String phase,  Map<String, dynamic> attributes)  $default,) {final _that = this;
switch (_that) {
case _CourseMetadata():
return $default(_that.title,_that.description,_that.phase,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String? description,  String phase,  Map<String, dynamic> attributes)?  $default,) {final _that = this;
switch (_that) {
case _CourseMetadata() when $default != null:
return $default(_that.title,_that.description,_that.phase,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseMetadata implements CourseMetadata {
  const _CourseMetadata({this.title = '', this.description, this.phase = '', final  Map<String, dynamic> attributes = const {}}): _attributes = attributes;
  factory _CourseMetadata.fromJson(Map<String, dynamic> json) => _$CourseMetadataFromJson(json);

@override@JsonKey() final  String title;
@override final  String? description;
@override@JsonKey() final  String phase;
 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}


/// Create a copy of CourseMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourseMetadataCopyWith<_CourseMetadata> get copyWith => __$CourseMetadataCopyWithImpl<_CourseMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourseMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,phase,const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'CourseMetadata(title: $title, description: $description, phase: $phase, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$CourseMetadataCopyWith<$Res> implements $CourseMetadataCopyWith<$Res> {
  factory _$CourseMetadataCopyWith(_CourseMetadata value, $Res Function(_CourseMetadata) _then) = __$CourseMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String? description, String phase, Map<String, dynamic> attributes
});




}
/// @nodoc
class __$CourseMetadataCopyWithImpl<$Res>
    implements _$CourseMetadataCopyWith<$Res> {
  __$CourseMetadataCopyWithImpl(this._self, this._then);

  final _CourseMetadata _self;
  final $Res Function(_CourseMetadata) _then;

/// Create a copy of CourseMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = freezed,Object? phase = null,Object? attributes = null,}) {
  return _then(_CourseMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: null == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}


/// @nodoc
mixin _$CourseSummary {

 String get id; String get slug;@JsonKey(name: 'fieldTag') String get targetTrack; CourseMetadata get metadata; String get status; DateTime? get createdAt; DateTime? get updatedAt; String? get startDate; String? get endDate;
/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourseSummaryCopyWith<CourseSummary> get copyWith => _$CourseSummaryCopyWithImpl<CourseSummary>(this as CourseSummary, _$identity);

  /// Serializes this CourseSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourseSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,targetTrack,metadata,status,createdAt,updatedAt,startDate,endDate);

@override
String toString() {
  return 'CourseSummary(id: $id, slug: $slug, targetTrack: $targetTrack, metadata: $metadata, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class $CourseSummaryCopyWith<$Res>  {
  factory $CourseSummaryCopyWith(CourseSummary value, $Res Function(CourseSummary) _then) = _$CourseSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String slug,@JsonKey(name: 'fieldTag') String targetTrack, CourseMetadata metadata, String status, DateTime? createdAt, DateTime? updatedAt, String? startDate, String? endDate
});


$CourseMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$CourseSummaryCopyWithImpl<$Res>
    implements $CourseSummaryCopyWith<$Res> {
  _$CourseSummaryCopyWithImpl(this._self, this._then);

  final CourseSummary _self;
  final $Res Function(CourseSummary) _then;

/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? targetTrack = null,Object? metadata = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,targetTrack: null == targetTrack ? _self.targetTrack : targetTrack // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CourseMetadata,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseMetadataCopyWith<$Res> get metadata {
  
  return $CourseMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug, @JsonKey(name: 'fieldTag')  String targetTrack,  CourseMetadata metadata,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? startDate,  String? endDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourseSummary() when $default != null:
return $default(_that.id,_that.slug,_that.targetTrack,_that.metadata,_that.status,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug, @JsonKey(name: 'fieldTag')  String targetTrack,  CourseMetadata metadata,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? startDate,  String? endDate)  $default,) {final _that = this;
switch (_that) {
case _CourseSummary():
return $default(_that.id,_that.slug,_that.targetTrack,_that.metadata,_that.status,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug, @JsonKey(name: 'fieldTag')  String targetTrack,  CourseMetadata metadata,  String status,  DateTime? createdAt,  DateTime? updatedAt,  String? startDate,  String? endDate)?  $default,) {final _that = this;
switch (_that) {
case _CourseSummary() when $default != null:
return $default(_that.id,_that.slug,_that.targetTrack,_that.metadata,_that.status,_that.createdAt,_that.updatedAt,_that.startDate,_that.endDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourseSummary implements CourseSummary {
  const _CourseSummary({this.id = '', this.slug = '', @JsonKey(name: 'fieldTag') this.targetTrack = 'NO', required this.metadata, this.status = 'DRAFT', this.createdAt, this.updatedAt, this.startDate, this.endDate});
  factory _CourseSummary.fromJson(Map<String, dynamic> json) => _$CourseSummaryFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String slug;
@override@JsonKey(name: 'fieldTag') final  String targetTrack;
@override final  CourseMetadata metadata;
@override@JsonKey() final  String status;
@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourseSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.targetTrack, targetTrack) || other.targetTrack == targetTrack)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,targetTrack,metadata,status,createdAt,updatedAt,startDate,endDate);

@override
String toString() {
  return 'CourseSummary(id: $id, slug: $slug, targetTrack: $targetTrack, metadata: $metadata, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, startDate: $startDate, endDate: $endDate)';
}


}

/// @nodoc
abstract mixin class _$CourseSummaryCopyWith<$Res> implements $CourseSummaryCopyWith<$Res> {
  factory _$CourseSummaryCopyWith(_CourseSummary value, $Res Function(_CourseSummary) _then) = __$CourseSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug,@JsonKey(name: 'fieldTag') String targetTrack, CourseMetadata metadata, String status, DateTime? createdAt, DateTime? updatedAt, String? startDate, String? endDate
});


@override $CourseMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$CourseSummaryCopyWithImpl<$Res>
    implements _$CourseSummaryCopyWith<$Res> {
  __$CourseSummaryCopyWithImpl(this._self, this._then);

  final _CourseSummary _self;
  final $Res Function(_CourseSummary) _then;

/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? targetTrack = null,Object? metadata = null,Object? status = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? startDate = freezed,Object? endDate = freezed,}) {
  return _then(_CourseSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,targetTrack: null == targetTrack ? _self.targetTrack : targetTrack // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as CourseMetadata,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CourseSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourseMetadataCopyWith<$Res> get metadata {
  
  return $CourseMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
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
mixin _$UpdateCourseRequest {

 String? get fieldTag; String? get startDate; String? get endDate; String? get title; String? get description; String? get phase; String? get status;
/// Create a copy of UpdateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCourseRequestCopyWith<UpdateCourseRequest> get copyWith => _$UpdateCourseRequestCopyWithImpl<UpdateCourseRequest>(this as UpdateCourseRequest, _$identity);

  /// Serializes this UpdateCourseRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCourseRequest&&(identical(other.fieldTag, fieldTag) || other.fieldTag == fieldTag)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldTag,startDate,endDate,title,description,phase,status);

@override
String toString() {
  return 'UpdateCourseRequest(fieldTag: $fieldTag, startDate: $startDate, endDate: $endDate, title: $title, description: $description, phase: $phase, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateCourseRequestCopyWith<$Res>  {
  factory $UpdateCourseRequestCopyWith(UpdateCourseRequest value, $Res Function(UpdateCourseRequest) _then) = _$UpdateCourseRequestCopyWithImpl;
@useResult
$Res call({
 String? fieldTag, String? startDate, String? endDate, String? title, String? description, String? phase, String? status
});




}
/// @nodoc
class _$UpdateCourseRequestCopyWithImpl<$Res>
    implements $UpdateCourseRequestCopyWith<$Res> {
  _$UpdateCourseRequestCopyWithImpl(this._self, this._then);

  final UpdateCourseRequest _self;
  final $Res Function(UpdateCourseRequest) _then;

/// Create a copy of UpdateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fieldTag = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? title = freezed,Object? description = freezed,Object? phase = freezed,Object? status = freezed,}) {
  return _then(_self.copyWith(
fieldTag: freezed == fieldTag ? _self.fieldTag : fieldTag // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCourseRequest].
extension UpdateCourseRequestPatterns on UpdateCourseRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCourseRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCourseRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCourseRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCourseRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCourseRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCourseRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? fieldTag,  String? startDate,  String? endDate,  String? title,  String? description,  String? phase,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCourseRequest() when $default != null:
return $default(_that.fieldTag,_that.startDate,_that.endDate,_that.title,_that.description,_that.phase,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? fieldTag,  String? startDate,  String? endDate,  String? title,  String? description,  String? phase,  String? status)  $default,) {final _that = this;
switch (_that) {
case _UpdateCourseRequest():
return $default(_that.fieldTag,_that.startDate,_that.endDate,_that.title,_that.description,_that.phase,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? fieldTag,  String? startDate,  String? endDate,  String? title,  String? description,  String? phase,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCourseRequest() when $default != null:
return $default(_that.fieldTag,_that.startDate,_that.endDate,_that.title,_that.description,_that.phase,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCourseRequest implements UpdateCourseRequest {
  const _UpdateCourseRequest({this.fieldTag, this.startDate, this.endDate, this.title, this.description, this.phase, this.status});
  factory _UpdateCourseRequest.fromJson(Map<String, dynamic> json) => _$UpdateCourseRequestFromJson(json);

@override final  String? fieldTag;
@override final  String? startDate;
@override final  String? endDate;
@override final  String? title;
@override final  String? description;
@override final  String? phase;
@override final  String? status;

/// Create a copy of UpdateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCourseRequestCopyWith<_UpdateCourseRequest> get copyWith => __$UpdateCourseRequestCopyWithImpl<_UpdateCourseRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCourseRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCourseRequest&&(identical(other.fieldTag, fieldTag) || other.fieldTag == fieldTag)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.phase, phase) || other.phase == phase)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fieldTag,startDate,endDate,title,description,phase,status);

@override
String toString() {
  return 'UpdateCourseRequest(fieldTag: $fieldTag, startDate: $startDate, endDate: $endDate, title: $title, description: $description, phase: $phase, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateCourseRequestCopyWith<$Res> implements $UpdateCourseRequestCopyWith<$Res> {
  factory _$UpdateCourseRequestCopyWith(_UpdateCourseRequest value, $Res Function(_UpdateCourseRequest) _then) = __$UpdateCourseRequestCopyWithImpl;
@override @useResult
$Res call({
 String? fieldTag, String? startDate, String? endDate, String? title, String? description, String? phase, String? status
});




}
/// @nodoc
class __$UpdateCourseRequestCopyWithImpl<$Res>
    implements _$UpdateCourseRequestCopyWith<$Res> {
  __$UpdateCourseRequestCopyWithImpl(this._self, this._then);

  final _UpdateCourseRequest _self;
  final $Res Function(_UpdateCourseRequest) _then;

/// Create a copy of UpdateCourseRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fieldTag = freezed,Object? startDate = freezed,Object? endDate = freezed,Object? title = freezed,Object? description = freezed,Object? phase = freezed,Object? status = freezed,}) {
  return _then(_UpdateCourseRequest(
fieldTag: freezed == fieldTag ? _self.fieldTag : fieldTag // ignore: cast_nullable_to_non_nullable
as String?,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String?,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,phase: freezed == phase ? _self.phase : phase // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Enrollment {

 String get id; String get userId; String get status; DateTime? get joinedAt; DateTime? get droppedAt; DateTime? get bannedAt; String? get banReason; DateTime? get updatedAt;
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
 String id, String userId, String status, DateTime? joinedAt, DateTime? droppedAt, DateTime? bannedAt, String? banReason, DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? status = null,Object? joinedAt = freezed,Object? droppedAt = freezed,Object? bannedAt = freezed,Object? banReason = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,droppedAt: freezed == droppedAt ? _self.droppedAt : droppedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bannedAt: freezed == bannedAt ? _self.bannedAt : bannedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String status,  DateTime? joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String status,  DateTime? joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime? updatedAt)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String status,  DateTime? joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime? updatedAt)?  $default,) {final _that = this;
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
  const _Enrollment({this.id = '', this.userId = '', this.status = 'ACTIVE', this.joinedAt, this.droppedAt, this.bannedAt, this.banReason, this.updatedAt});
  factory _Enrollment.fromJson(Map<String, dynamic> json) => _$EnrollmentFromJson(json);

@override@JsonKey() final  String id;
@override@JsonKey() final  String userId;
@override@JsonKey() final  String status;
@override final  DateTime? joinedAt;
@override final  DateTime? droppedAt;
@override final  DateTime? bannedAt;
@override final  String? banReason;
@override final  DateTime? updatedAt;

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
 String id, String userId, String status, DateTime? joinedAt, DateTime? droppedAt, DateTime? bannedAt, String? banReason, DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? status = null,Object? joinedAt = freezed,Object? droppedAt = freezed,Object? bannedAt = freezed,Object? banReason = freezed,Object? updatedAt = freezed,}) {
  return _then(_Enrollment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,joinedAt: freezed == joinedAt ? _self.joinedAt : joinedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,droppedAt: freezed == droppedAt ? _self.droppedAt : droppedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,bannedAt: freezed == bannedAt ? _self.bannedAt : bannedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$AssignmentMetadata {

 String get title; String get difficulty; String? get description; int? get timeLimitMinutes; List<LearningGoal> get learningGoals; List<AssignmentRequirement> get requirements; List<AssignmentExample> get examples; Map<String, dynamic> get attributes; Map<String, dynamic>? get problemDetail;
/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<AssignmentMetadata> get copyWith => _$AssignmentMetadataCopyWithImpl<AssignmentMetadata>(this as AssignmentMetadata, _$identity);

  /// Serializes this AssignmentMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&const DeepCollectionEquality().equals(other.learningGoals, learningGoals)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.examples, examples)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.problemDetail, problemDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,difficulty,description,timeLimitMinutes,const DeepCollectionEquality().hash(learningGoals),const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(examples),const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(problemDetail));

@override
String toString() {
  return 'AssignmentMetadata(title: $title, difficulty: $difficulty, description: $description, timeLimitMinutes: $timeLimitMinutes, learningGoals: $learningGoals, requirements: $requirements, examples: $examples, attributes: $attributes, problemDetail: $problemDetail)';
}


}

/// @nodoc
abstract mixin class $AssignmentMetadataCopyWith<$Res>  {
  factory $AssignmentMetadataCopyWith(AssignmentMetadata value, $Res Function(AssignmentMetadata) _then) = _$AssignmentMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String difficulty, String? description, int? timeLimitMinutes, List<LearningGoal> learningGoals, List<AssignmentRequirement> requirements, List<AssignmentExample> examples, Map<String, dynamic> attributes, Map<String, dynamic>? problemDetail
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
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? difficulty = null,Object? description = freezed,Object? timeLimitMinutes = freezed,Object? learningGoals = null,Object? requirements = null,Object? examples = null,Object? attributes = null,Object? problemDetail = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timeLimitMinutes: freezed == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int?,learningGoals: null == learningGoals ? _self.learningGoals : learningGoals // ignore: cast_nullable_to_non_nullable
as List<LearningGoal>,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,examples: null == examples ? _self.examples : examples // ignore: cast_nullable_to_non_nullable
as List<AssignmentExample>,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,problemDetail: freezed == problemDetail ? _self.problemDetail : problemDetail // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String difficulty,  String? description,  int? timeLimitMinutes,  List<LearningGoal> learningGoals,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples,  Map<String, dynamic> attributes,  Map<String, dynamic>? problemDetail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
return $default(_that.title,_that.difficulty,_that.description,_that.timeLimitMinutes,_that.learningGoals,_that.requirements,_that.examples,_that.attributes,_that.problemDetail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String difficulty,  String? description,  int? timeLimitMinutes,  List<LearningGoal> learningGoals,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples,  Map<String, dynamic> attributes,  Map<String, dynamic>? problemDetail)  $default,) {final _that = this;
switch (_that) {
case _AssignmentMetadata():
return $default(_that.title,_that.difficulty,_that.description,_that.timeLimitMinutes,_that.learningGoals,_that.requirements,_that.examples,_that.attributes,_that.problemDetail);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String difficulty,  String? description,  int? timeLimitMinutes,  List<LearningGoal> learningGoals,  List<AssignmentRequirement> requirements,  List<AssignmentExample> examples,  Map<String, dynamic> attributes,  Map<String, dynamic>? problemDetail)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
return $default(_that.title,_that.difficulty,_that.description,_that.timeLimitMinutes,_that.learningGoals,_that.requirements,_that.examples,_that.attributes,_that.problemDetail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentMetadata implements AssignmentMetadata {
  const _AssignmentMetadata({this.title = '', this.difficulty = 'MID', this.description, this.timeLimitMinutes, final  List<LearningGoal> learningGoals = const [], final  List<AssignmentRequirement> requirements = const [], final  List<AssignmentExample> examples = const [], final  Map<String, dynamic> attributes = const {}, final  Map<String, dynamic>? problemDetail}): _learningGoals = learningGoals,_requirements = requirements,_examples = examples,_attributes = attributes,_problemDetail = problemDetail;
  factory _AssignmentMetadata.fromJson(Map<String, dynamic> json) => _$AssignmentMetadataFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String difficulty;
@override final  String? description;
@override final  int? timeLimitMinutes;
 final  List<LearningGoal> _learningGoals;
@override@JsonKey() List<LearningGoal> get learningGoals {
  if (_learningGoals is EqualUnmodifiableListView) return _learningGoals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_learningGoals);
}

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

 final  Map<String, dynamic> _attributes;
@override@JsonKey() Map<String, dynamic> get attributes {
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_attributes);
}

 final  Map<String, dynamic>? _problemDetail;
@override Map<String, dynamic>? get problemDetail {
  final value = _problemDetail;
  if (value == null) return null;
  if (_problemDetail is EqualUnmodifiableMapView) return _problemDetail;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&(identical(other.timeLimitMinutes, timeLimitMinutes) || other.timeLimitMinutes == timeLimitMinutes)&&const DeepCollectionEquality().equals(other._learningGoals, _learningGoals)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._examples, _examples)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._problemDetail, _problemDetail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,difficulty,description,timeLimitMinutes,const DeepCollectionEquality().hash(_learningGoals),const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_examples),const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_problemDetail));

@override
String toString() {
  return 'AssignmentMetadata(title: $title, difficulty: $difficulty, description: $description, timeLimitMinutes: $timeLimitMinutes, learningGoals: $learningGoals, requirements: $requirements, examples: $examples, attributes: $attributes, problemDetail: $problemDetail)';
}


}

/// @nodoc
abstract mixin class _$AssignmentMetadataCopyWith<$Res> implements $AssignmentMetadataCopyWith<$Res> {
  factory _$AssignmentMetadataCopyWith(_AssignmentMetadata value, $Res Function(_AssignmentMetadata) _then) = __$AssignmentMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String difficulty, String? description, int? timeLimitMinutes, List<LearningGoal> learningGoals, List<AssignmentRequirement> requirements, List<AssignmentExample> examples, Map<String, dynamic> attributes, Map<String, dynamic>? problemDetail
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
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? difficulty = null,Object? description = freezed,Object? timeLimitMinutes = freezed,Object? learningGoals = null,Object? requirements = null,Object? examples = null,Object? attributes = null,Object? problemDetail = freezed,}) {
  return _then(_AssignmentMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,timeLimitMinutes: freezed == timeLimitMinutes ? _self.timeLimitMinutes : timeLimitMinutes // ignore: cast_nullable_to_non_nullable
as int?,learningGoals: null == learningGoals ? _self._learningGoals : learningGoals // ignore: cast_nullable_to_non_nullable
as List<LearningGoal>,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,examples: null == examples ? _self._examples : examples // ignore: cast_nullable_to_non_nullable
as List<AssignmentExample>,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,problemDetail: freezed == problemDetail ? _self._problemDetail : problemDetail // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$LearningGoal {

 int get sortOrder; String get learningGoalText;
/// Create a copy of LearningGoal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LearningGoalCopyWith<LearningGoal> get copyWith => _$LearningGoalCopyWithImpl<LearningGoal>(this as LearningGoal, _$identity);

  /// Serializes this LearningGoal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LearningGoal&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.learningGoalText, learningGoalText) || other.learningGoalText == learningGoalText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortOrder,learningGoalText);

@override
String toString() {
  return 'LearningGoal(sortOrder: $sortOrder, learningGoalText: $learningGoalText)';
}


}

/// @nodoc
abstract mixin class $LearningGoalCopyWith<$Res>  {
  factory $LearningGoalCopyWith(LearningGoal value, $Res Function(LearningGoal) _then) = _$LearningGoalCopyWithImpl;
@useResult
$Res call({
 int sortOrder, String learningGoalText
});




}
/// @nodoc
class _$LearningGoalCopyWithImpl<$Res>
    implements $LearningGoalCopyWith<$Res> {
  _$LearningGoalCopyWithImpl(this._self, this._then);

  final LearningGoal _self;
  final $Res Function(LearningGoal) _then;

/// Create a copy of LearningGoal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sortOrder = null,Object? learningGoalText = null,}) {
  return _then(_self.copyWith(
sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,learningGoalText: null == learningGoalText ? _self.learningGoalText : learningGoalText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [LearningGoal].
extension LearningGoalPatterns on LearningGoal {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LearningGoal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LearningGoal() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LearningGoal value)  $default,){
final _that = this;
switch (_that) {
case _LearningGoal():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LearningGoal value)?  $default,){
final _that = this;
switch (_that) {
case _LearningGoal() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int sortOrder,  String learningGoalText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LearningGoal() when $default != null:
return $default(_that.sortOrder,_that.learningGoalText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int sortOrder,  String learningGoalText)  $default,) {final _that = this;
switch (_that) {
case _LearningGoal():
return $default(_that.sortOrder,_that.learningGoalText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int sortOrder,  String learningGoalText)?  $default,) {final _that = this;
switch (_that) {
case _LearningGoal() when $default != null:
return $default(_that.sortOrder,_that.learningGoalText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LearningGoal implements LearningGoal {
  const _LearningGoal({required this.sortOrder, required this.learningGoalText});
  factory _LearningGoal.fromJson(Map<String, dynamic> json) => _$LearningGoalFromJson(json);

@override final  int sortOrder;
@override final  String learningGoalText;

/// Create a copy of LearningGoal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LearningGoalCopyWith<_LearningGoal> get copyWith => __$LearningGoalCopyWithImpl<_LearningGoal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LearningGoalToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LearningGoal&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.learningGoalText, learningGoalText) || other.learningGoalText == learningGoalText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sortOrder,learningGoalText);

@override
String toString() {
  return 'LearningGoal(sortOrder: $sortOrder, learningGoalText: $learningGoalText)';
}


}

/// @nodoc
abstract mixin class _$LearningGoalCopyWith<$Res> implements $LearningGoalCopyWith<$Res> {
  factory _$LearningGoalCopyWith(_LearningGoal value, $Res Function(_LearningGoal) _then) = __$LearningGoalCopyWithImpl;
@override @useResult
$Res call({
 int sortOrder, String learningGoalText
});




}
/// @nodoc
class __$LearningGoalCopyWithImpl<$Res>
    implements _$LearningGoalCopyWith<$Res> {
  __$LearningGoalCopyWithImpl(this._self, this._then);

  final _LearningGoal _self;
  final $Res Function(_LearningGoal) _then;

/// Create a copy of LearningGoal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sortOrder = null,Object? learningGoalText = null,}) {
  return _then(_LearningGoal(
sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,learningGoalText: null == learningGoalText ? _self.learningGoalText : learningGoalText // ignore: cast_nullable_to_non_nullable
as String,
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

@JsonKey(name: 'assignmentId') String get id; String? get courseSlug; int get weekNo; int get orderInWeek; String get startAt; String get endAt; String get status; String? get publishedAt; AssignmentMetadata get metadata;
/// Create a copy of Assignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentCopyWith<Assignment> get copyWith => _$AssignmentCopyWithImpl<Assignment>(this as Assignment, _$identity);

  /// Serializes this Assignment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Assignment&&(identical(other.id, id) || other.id == id)&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseSlug,weekNo,orderInWeek,startAt,endAt,status,publishedAt,metadata);

@override
String toString() {
  return 'Assignment(id: $id, courseSlug: $courseSlug, weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, status: $status, publishedAt: $publishedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $AssignmentCopyWith<$Res>  {
  factory $AssignmentCopyWith(Assignment value, $Res Function(Assignment) _then) = _$AssignmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'assignmentId') String id, String? courseSlug, int weekNo, int orderInWeek, String startAt, String endAt, String status, String? publishedAt, AssignmentMetadata metadata
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? courseSlug = freezed,Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? status = null,Object? publishedAt = freezed,Object? metadata = null,}) {
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
as AssignmentMetadata,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'assignmentId')  String id,  String? courseSlug,  int weekNo,  int orderInWeek,  String startAt,  String endAt,  String status,  String? publishedAt,  AssignmentMetadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Assignment() when $default != null:
return $default(_that.id,_that.courseSlug,_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.status,_that.publishedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'assignmentId')  String id,  String? courseSlug,  int weekNo,  int orderInWeek,  String startAt,  String endAt,  String status,  String? publishedAt,  AssignmentMetadata metadata)  $default,) {final _that = this;
switch (_that) {
case _Assignment():
return $default(_that.id,_that.courseSlug,_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.status,_that.publishedAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'assignmentId')  String id,  String? courseSlug,  int weekNo,  int orderInWeek,  String startAt,  String endAt,  String status,  String? publishedAt,  AssignmentMetadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _Assignment() when $default != null:
return $default(_that.id,_that.courseSlug,_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.status,_that.publishedAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Assignment implements Assignment {
  const _Assignment({@JsonKey(name: 'assignmentId') this.id = '', this.courseSlug, this.weekNo = 0, this.orderInWeek = 0, this.startAt = '', this.endAt = '', this.status = 'DRAFT', this.publishedAt, required this.metadata});
  factory _Assignment.fromJson(Map<String, dynamic> json) => _$AssignmentFromJson(json);

@override@JsonKey(name: 'assignmentId') final  String id;
@override final  String? courseSlug;
@override@JsonKey() final  int weekNo;
@override@JsonKey() final  int orderInWeek;
@override@JsonKey() final  String startAt;
@override@JsonKey() final  String endAt;
@override@JsonKey() final  String status;
@override final  String? publishedAt;
@override final  AssignmentMetadata metadata;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Assignment&&(identical(other.id, id) || other.id == id)&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.publishedAt, publishedAt) || other.publishedAt == publishedAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,courseSlug,weekNo,orderInWeek,startAt,endAt,status,publishedAt,metadata);

@override
String toString() {
  return 'Assignment(id: $id, courseSlug: $courseSlug, weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, status: $status, publishedAt: $publishedAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$AssignmentCopyWith<$Res> implements $AssignmentCopyWith<$Res> {
  factory _$AssignmentCopyWith(_Assignment value, $Res Function(_Assignment) _then) = __$AssignmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'assignmentId') String id, String? courseSlug, int weekNo, int orderInWeek, String startAt, String endAt, String status, String? publishedAt, AssignmentMetadata metadata
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? courseSlug = freezed,Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? status = null,Object? publishedAt = freezed,Object? metadata = null,}) {
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
as AssignmentMetadata,
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

 int get weekNo; int get orderInWeek; String get startAt; String get endAt; AssignmentMetadata get metadata;
/// Create a copy of CreateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAssignmentRequestCopyWith<CreateAssignmentRequest> get copyWith => _$CreateAssignmentRequestCopyWithImpl<CreateAssignmentRequest>(this as CreateAssignmentRequest, _$identity);

  /// Serializes this CreateAssignmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAssignmentRequest&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNo,orderInWeek,startAt,endAt,metadata);

@override
String toString() {
  return 'CreateAssignmentRequest(weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $CreateAssignmentRequestCopyWith<$Res>  {
  factory $CreateAssignmentRequestCopyWith(CreateAssignmentRequest value, $Res Function(CreateAssignmentRequest) _then) = _$CreateAssignmentRequestCopyWithImpl;
@useResult
$Res call({
 int weekNo, int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata
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
@pragma('vm:prefer-inline') @override $Res call({Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int weekNo,  int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
return $default(_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int weekNo,  int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata)  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest():
return $default(_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int weekNo,  int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _CreateAssignmentRequest() when $default != null:
return $default(_that.weekNo,_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateAssignmentRequest implements CreateAssignmentRequest {
  const _CreateAssignmentRequest({required this.weekNo, required this.orderInWeek, required this.startAt, required this.endAt, required this.metadata});
  factory _CreateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$CreateAssignmentRequestFromJson(json);

@override final  int weekNo;
@override final  int orderInWeek;
@override final  String startAt;
@override final  String endAt;
@override final  AssignmentMetadata metadata;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateAssignmentRequest&&(identical(other.weekNo, weekNo) || other.weekNo == weekNo)&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weekNo,orderInWeek,startAt,endAt,metadata);

@override
String toString() {
  return 'CreateAssignmentRequest(weekNo: $weekNo, orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$CreateAssignmentRequestCopyWith<$Res> implements $CreateAssignmentRequestCopyWith<$Res> {
  factory _$CreateAssignmentRequestCopyWith(_CreateAssignmentRequest value, $Res Function(_CreateAssignmentRequest) _then) = __$CreateAssignmentRequestCopyWithImpl;
@override @useResult
$Res call({
 int weekNo, int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata
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
@override @pragma('vm:prefer-inline') $Res call({Object? weekNo = null,Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,}) {
  return _then(_CreateAssignmentRequest(
weekNo: null == weekNo ? _self.weekNo : weekNo // ignore: cast_nullable_to_non_nullable
as int,orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,
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


/// @nodoc
mixin _$UpdateAssignmentRequest {

 int get orderInWeek; String get startAt; String get endAt; AssignmentMetadata get metadata;
/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAssignmentRequestCopyWith<UpdateAssignmentRequest> get copyWith => _$UpdateAssignmentRequestCopyWithImpl<UpdateAssignmentRequest>(this as UpdateAssignmentRequest, _$identity);

  /// Serializes this UpdateAssignmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAssignmentRequest&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderInWeek,startAt,endAt,metadata);

@override
String toString() {
  return 'UpdateAssignmentRequest(orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class $UpdateAssignmentRequestCopyWith<$Res>  {
  factory $UpdateAssignmentRequestCopyWith(UpdateAssignmentRequest value, $Res Function(UpdateAssignmentRequest) _then) = _$UpdateAssignmentRequestCopyWithImpl;
@useResult
$Res call({
 int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata
});


$AssignmentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$UpdateAssignmentRequestCopyWithImpl<$Res>
    implements $UpdateAssignmentRequestCopyWith<$Res> {
  _$UpdateAssignmentRequestCopyWithImpl(this._self, this._then);

  final UpdateAssignmentRequest _self;
  final $Res Function(UpdateAssignmentRequest) _then;

/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,}) {
  return _then(_self.copyWith(
orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,
  ));
}
/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<$Res> get metadata {
  
  return $AssignmentMetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateAssignmentRequest].
extension UpdateAssignmentRequestPatterns on UpdateAssignmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateAssignmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateAssignmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateAssignmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateAssignmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
return $default(_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata)  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest():
return $default(_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
return $default(_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAssignmentRequest implements UpdateAssignmentRequest {
  const _UpdateAssignmentRequest({required this.orderInWeek, required this.startAt, required this.endAt, required this.metadata});
  factory _UpdateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$UpdateAssignmentRequestFromJson(json);

@override final  int orderInWeek;
@override final  String startAt;
@override final  String endAt;
@override final  AssignmentMetadata metadata;

/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateAssignmentRequestCopyWith<_UpdateAssignmentRequest> get copyWith => __$UpdateAssignmentRequestCopyWithImpl<_UpdateAssignmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateAssignmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAssignmentRequest&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderInWeek,startAt,endAt,metadata);

@override
String toString() {
  return 'UpdateAssignmentRequest(orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata)';
}


}

/// @nodoc
abstract mixin class _$UpdateAssignmentRequestCopyWith<$Res> implements $UpdateAssignmentRequestCopyWith<$Res> {
  factory _$UpdateAssignmentRequestCopyWith(_UpdateAssignmentRequest value, $Res Function(_UpdateAssignmentRequest) _then) = __$UpdateAssignmentRequestCopyWithImpl;
@override @useResult
$Res call({
 int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata
});


@override $AssignmentMetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$UpdateAssignmentRequestCopyWithImpl<$Res>
    implements _$UpdateAssignmentRequestCopyWith<$Res> {
  __$UpdateAssignmentRequestCopyWithImpl(this._self, this._then);

  final _UpdateAssignmentRequest _self;
  final $Res Function(_UpdateAssignmentRequest) _then;

/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,}) {
  return _then(_UpdateAssignmentRequest(
orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,
  ));
}

/// Create a copy of UpdateAssignmentRequest
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
mixin _$AddEnrollmentRequest {

 String get publicCode;
/// Create a copy of AddEnrollmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddEnrollmentRequestCopyWith<AddEnrollmentRequest> get copyWith => _$AddEnrollmentRequestCopyWithImpl<AddEnrollmentRequest>(this as AddEnrollmentRequest, _$identity);

  /// Serializes this AddEnrollmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddEnrollmentRequest&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode);

@override
String toString() {
  return 'AddEnrollmentRequest(publicCode: $publicCode)';
}


}

/// @nodoc
abstract mixin class $AddEnrollmentRequestCopyWith<$Res>  {
  factory $AddEnrollmentRequestCopyWith(AddEnrollmentRequest value, $Res Function(AddEnrollmentRequest) _then) = _$AddEnrollmentRequestCopyWithImpl;
@useResult
$Res call({
 String publicCode
});




}
/// @nodoc
class _$AddEnrollmentRequestCopyWithImpl<$Res>
    implements $AddEnrollmentRequestCopyWith<$Res> {
  _$AddEnrollmentRequestCopyWithImpl(this._self, this._then);

  final AddEnrollmentRequest _self;
  final $Res Function(AddEnrollmentRequest) _then;

/// Create a copy of AddEnrollmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? publicCode = null,}) {
  return _then(_self.copyWith(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AddEnrollmentRequest].
extension AddEnrollmentRequestPatterns on AddEnrollmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddEnrollmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddEnrollmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddEnrollmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddEnrollmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddEnrollmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddEnrollmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String publicCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddEnrollmentRequest() when $default != null:
return $default(_that.publicCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String publicCode)  $default,) {final _that = this;
switch (_that) {
case _AddEnrollmentRequest():
return $default(_that.publicCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String publicCode)?  $default,) {final _that = this;
switch (_that) {
case _AddEnrollmentRequest() when $default != null:
return $default(_that.publicCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddEnrollmentRequest implements AddEnrollmentRequest {
  const _AddEnrollmentRequest({required this.publicCode});
  factory _AddEnrollmentRequest.fromJson(Map<String, dynamic> json) => _$AddEnrollmentRequestFromJson(json);

@override final  String publicCode;

/// Create a copy of AddEnrollmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddEnrollmentRequestCopyWith<_AddEnrollmentRequest> get copyWith => __$AddEnrollmentRequestCopyWithImpl<_AddEnrollmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddEnrollmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddEnrollmentRequest&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,publicCode);

@override
String toString() {
  return 'AddEnrollmentRequest(publicCode: $publicCode)';
}


}

/// @nodoc
abstract mixin class _$AddEnrollmentRequestCopyWith<$Res> implements $AddEnrollmentRequestCopyWith<$Res> {
  factory _$AddEnrollmentRequestCopyWith(_AddEnrollmentRequest value, $Res Function(_AddEnrollmentRequest) _then) = __$AddEnrollmentRequestCopyWithImpl;
@override @useResult
$Res call({
 String publicCode
});




}
/// @nodoc
class __$AddEnrollmentRequestCopyWithImpl<$Res>
    implements _$AddEnrollmentRequestCopyWith<$Res> {
  __$AddEnrollmentRequestCopyWithImpl(this._self, this._then);

  final _AddEnrollmentRequest _self;
  final $Res Function(_AddEnrollmentRequest) _then;

/// Create a copy of AddEnrollmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? publicCode = null,}) {
  return _then(_AddEnrollmentRequest(
publicCode: null == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateEnrollmentStatusRequest {

 EnrollmentStatus get status; String? get banReason;
/// Create a copy of UpdateEnrollmentStatusRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateEnrollmentStatusRequestCopyWith<UpdateEnrollmentStatusRequest> get copyWith => _$UpdateEnrollmentStatusRequestCopyWithImpl<UpdateEnrollmentStatusRequest>(this as UpdateEnrollmentStatusRequest, _$identity);

  /// Serializes this UpdateEnrollmentStatusRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateEnrollmentStatusRequest&&(identical(other.status, status) || other.status == status)&&(identical(other.banReason, banReason) || other.banReason == banReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,banReason);

@override
String toString() {
  return 'UpdateEnrollmentStatusRequest(status: $status, banReason: $banReason)';
}


}

/// @nodoc
abstract mixin class $UpdateEnrollmentStatusRequestCopyWith<$Res>  {
  factory $UpdateEnrollmentStatusRequestCopyWith(UpdateEnrollmentStatusRequest value, $Res Function(UpdateEnrollmentStatusRequest) _then) = _$UpdateEnrollmentStatusRequestCopyWithImpl;
@useResult
$Res call({
 EnrollmentStatus status, String? banReason
});




}
/// @nodoc
class _$UpdateEnrollmentStatusRequestCopyWithImpl<$Res>
    implements $UpdateEnrollmentStatusRequestCopyWith<$Res> {
  _$UpdateEnrollmentStatusRequestCopyWithImpl(this._self, this._then);

  final UpdateEnrollmentStatusRequest _self;
  final $Res Function(UpdateEnrollmentStatusRequest) _then;

/// Create a copy of UpdateEnrollmentStatusRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? banReason = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EnrollmentStatus,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateEnrollmentStatusRequest].
extension UpdateEnrollmentStatusRequestPatterns on UpdateEnrollmentStatusRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateEnrollmentStatusRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateEnrollmentStatusRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateEnrollmentStatusRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateEnrollmentStatusRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateEnrollmentStatusRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateEnrollmentStatusRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EnrollmentStatus status,  String? banReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateEnrollmentStatusRequest() when $default != null:
return $default(_that.status,_that.banReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EnrollmentStatus status,  String? banReason)  $default,) {final _that = this;
switch (_that) {
case _UpdateEnrollmentStatusRequest():
return $default(_that.status,_that.banReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EnrollmentStatus status,  String? banReason)?  $default,) {final _that = this;
switch (_that) {
case _UpdateEnrollmentStatusRequest() when $default != null:
return $default(_that.status,_that.banReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateEnrollmentStatusRequest implements UpdateEnrollmentStatusRequest {
  const _UpdateEnrollmentStatusRequest({required this.status, this.banReason});
  factory _UpdateEnrollmentStatusRequest.fromJson(Map<String, dynamic> json) => _$UpdateEnrollmentStatusRequestFromJson(json);

@override final  EnrollmentStatus status;
@override final  String? banReason;

/// Create a copy of UpdateEnrollmentStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateEnrollmentStatusRequestCopyWith<_UpdateEnrollmentStatusRequest> get copyWith => __$UpdateEnrollmentStatusRequestCopyWithImpl<_UpdateEnrollmentStatusRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateEnrollmentStatusRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateEnrollmentStatusRequest&&(identical(other.status, status) || other.status == status)&&(identical(other.banReason, banReason) || other.banReason == banReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,banReason);

@override
String toString() {
  return 'UpdateEnrollmentStatusRequest(status: $status, banReason: $banReason)';
}


}

/// @nodoc
abstract mixin class _$UpdateEnrollmentStatusRequestCopyWith<$Res> implements $UpdateEnrollmentStatusRequestCopyWith<$Res> {
  factory _$UpdateEnrollmentStatusRequestCopyWith(_UpdateEnrollmentStatusRequest value, $Res Function(_UpdateEnrollmentStatusRequest) _then) = __$UpdateEnrollmentStatusRequestCopyWithImpl;
@override @useResult
$Res call({
 EnrollmentStatus status, String? banReason
});




}
/// @nodoc
class __$UpdateEnrollmentStatusRequestCopyWithImpl<$Res>
    implements _$UpdateEnrollmentStatusRequestCopyWith<$Res> {
  __$UpdateEnrollmentStatusRequestCopyWithImpl(this._self, this._then);

  final _UpdateEnrollmentStatusRequest _self;
  final $Res Function(_UpdateEnrollmentStatusRequest) _then;

/// Create a copy of UpdateEnrollmentStatusRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? banReason = freezed,}) {
  return _then(_UpdateEnrollmentStatusRequest(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as EnrollmentStatus,banReason: freezed == banReason ? _self.banReason : banReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
