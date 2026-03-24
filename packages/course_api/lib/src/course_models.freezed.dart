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

 String? get courseId; String? get courseSlug; String get userId; String? get username; String? get publicCode; String get status; DateTime? get joinedAt; DateTime? get droppedAt; DateTime? get bannedAt; String? get banReason; DateTime? get updatedAt;
/// Create a copy of Enrollment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnrollmentCopyWith<Enrollment> get copyWith => _$EnrollmentCopyWithImpl<Enrollment>(this as Enrollment, _$identity);

  /// Serializes this Enrollment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Enrollment&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.droppedAt, droppedAt) || other.droppedAt == droppedAt)&&(identical(other.bannedAt, bannedAt) || other.bannedAt == bannedAt)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,courseId,courseSlug,userId,username,publicCode,status,joinedAt,droppedAt,bannedAt,banReason,updatedAt);

@override
String toString() {
  return 'Enrollment(courseId: $courseId, courseSlug: $courseSlug, userId: $userId, username: $username, publicCode: $publicCode, status: $status, joinedAt: $joinedAt, droppedAt: $droppedAt, bannedAt: $bannedAt, banReason: $banReason, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $EnrollmentCopyWith<$Res>  {
  factory $EnrollmentCopyWith(Enrollment value, $Res Function(Enrollment) _then) = _$EnrollmentCopyWithImpl;
@useResult
$Res call({
 String? courseId, String? courseSlug, String userId, String? username, String? publicCode, String status, DateTime? joinedAt, DateTime? droppedAt, DateTime? bannedAt, String? banReason, DateTime? updatedAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? courseId = freezed,Object? courseSlug = freezed,Object? userId = null,Object? username = freezed,Object? publicCode = freezed,Object? status = null,Object? joinedAt = freezed,Object? droppedAt = freezed,Object? bannedAt = freezed,Object? banReason = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,courseSlug: freezed == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? courseId,  String? courseSlug,  String userId,  String? username,  String? publicCode,  String status,  DateTime? joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
return $default(_that.courseId,_that.courseSlug,_that.userId,_that.username,_that.publicCode,_that.status,_that.joinedAt,_that.droppedAt,_that.bannedAt,_that.banReason,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? courseId,  String? courseSlug,  String userId,  String? username,  String? publicCode,  String status,  DateTime? joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _Enrollment():
return $default(_that.courseId,_that.courseSlug,_that.userId,_that.username,_that.publicCode,_that.status,_that.joinedAt,_that.droppedAt,_that.bannedAt,_that.banReason,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? courseId,  String? courseSlug,  String userId,  String? username,  String? publicCode,  String status,  DateTime? joinedAt,  DateTime? droppedAt,  DateTime? bannedAt,  String? banReason,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _Enrollment() when $default != null:
return $default(_that.courseId,_that.courseSlug,_that.userId,_that.username,_that.publicCode,_that.status,_that.joinedAt,_that.droppedAt,_that.bannedAt,_that.banReason,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Enrollment implements Enrollment {
  const _Enrollment({this.courseId, this.courseSlug, this.userId = '', this.username, this.publicCode, this.status = 'ENABLED', this.joinedAt, this.droppedAt, this.bannedAt, this.banReason, this.updatedAt});
  factory _Enrollment.fromJson(Map<String, dynamic> json) => _$EnrollmentFromJson(json);

@override final  String? courseId;
@override final  String? courseSlug;
@override@JsonKey() final  String userId;
@override final  String? username;
@override final  String? publicCode;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Enrollment&&(identical(other.courseId, courseId) || other.courseId == courseId)&&(identical(other.courseSlug, courseSlug) || other.courseSlug == courseSlug)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.username, username) || other.username == username)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.joinedAt, joinedAt) || other.joinedAt == joinedAt)&&(identical(other.droppedAt, droppedAt) || other.droppedAt == droppedAt)&&(identical(other.bannedAt, bannedAt) || other.bannedAt == bannedAt)&&(identical(other.banReason, banReason) || other.banReason == banReason)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,courseId,courseSlug,userId,username,publicCode,status,joinedAt,droppedAt,bannedAt,banReason,updatedAt);

@override
String toString() {
  return 'Enrollment(courseId: $courseId, courseSlug: $courseSlug, userId: $userId, username: $username, publicCode: $publicCode, status: $status, joinedAt: $joinedAt, droppedAt: $droppedAt, bannedAt: $bannedAt, banReason: $banReason, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$EnrollmentCopyWith<$Res> implements $EnrollmentCopyWith<$Res> {
  factory _$EnrollmentCopyWith(_Enrollment value, $Res Function(_Enrollment) _then) = __$EnrollmentCopyWithImpl;
@override @useResult
$Res call({
 String? courseId, String? courseSlug, String userId, String? username, String? publicCode, String status, DateTime? joinedAt, DateTime? droppedAt, DateTime? bannedAt, String? banReason, DateTime? updatedAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? courseId = freezed,Object? courseSlug = freezed,Object? userId = null,Object? username = freezed,Object? publicCode = freezed,Object? status = null,Object? joinedAt = freezed,Object? droppedAt = freezed,Object? bannedAt = freezed,Object? banReason = freezed,Object? updatedAt = freezed,}) {
  return _then(_Enrollment(
courseId: freezed == courseId ? _self.courseId : courseId // ignore: cast_nullable_to_non_nullable
as String?,courseSlug: freezed == courseSlug ? _self.courseSlug : courseSlug // ignore: cast_nullable_to_non_nullable
as String?,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
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

 String get title; String get difficulty; String? get description; List<LearningGoal> get learningGoals; List<AssignmentRequirement> get requirements; List<AssignmentTestCase> get testCases; ProblemDetail? get problemDetail; SubmissionGuide? get submissionGuide; List<CodeTemplate> get codeTemplates; Map<String, dynamic> get attributes;
/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentMetadataCopyWith<AssignmentMetadata> get copyWith => _$AssignmentMetadataCopyWithImpl<AssignmentMetadata>(this as AssignmentMetadata, _$identity);

  /// Serializes this AssignmentMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.learningGoals, learningGoals)&&const DeepCollectionEquality().equals(other.requirements, requirements)&&const DeepCollectionEquality().equals(other.testCases, testCases)&&(identical(other.problemDetail, problemDetail) || other.problemDetail == problemDetail)&&(identical(other.submissionGuide, submissionGuide) || other.submissionGuide == submissionGuide)&&const DeepCollectionEquality().equals(other.codeTemplates, codeTemplates)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,difficulty,description,const DeepCollectionEquality().hash(learningGoals),const DeepCollectionEquality().hash(requirements),const DeepCollectionEquality().hash(testCases),problemDetail,submissionGuide,const DeepCollectionEquality().hash(codeTemplates),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'AssignmentMetadata(title: $title, difficulty: $difficulty, description: $description, learningGoals: $learningGoals, requirements: $requirements, testCases: $testCases, problemDetail: $problemDetail, submissionGuide: $submissionGuide, codeTemplates: $codeTemplates, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $AssignmentMetadataCopyWith<$Res>  {
  factory $AssignmentMetadataCopyWith(AssignmentMetadata value, $Res Function(AssignmentMetadata) _then) = _$AssignmentMetadataCopyWithImpl;
@useResult
$Res call({
 String title, String difficulty, String? description, List<LearningGoal> learningGoals, List<AssignmentRequirement> requirements, List<AssignmentTestCase> testCases, ProblemDetail? problemDetail, SubmissionGuide? submissionGuide, List<CodeTemplate> codeTemplates, Map<String, dynamic> attributes
});


$ProblemDetailCopyWith<$Res>? get problemDetail;$SubmissionGuideCopyWith<$Res>? get submissionGuide;

}
/// @nodoc
class _$AssignmentMetadataCopyWithImpl<$Res>
    implements $AssignmentMetadataCopyWith<$Res> {
  _$AssignmentMetadataCopyWithImpl(this._self, this._then);

  final AssignmentMetadata _self;
  final $Res Function(AssignmentMetadata) _then;

/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? difficulty = null,Object? description = freezed,Object? learningGoals = null,Object? requirements = null,Object? testCases = null,Object? problemDetail = freezed,Object? submissionGuide = freezed,Object? codeTemplates = null,Object? attributes = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,learningGoals: null == learningGoals ? _self.learningGoals : learningGoals // ignore: cast_nullable_to_non_nullable
as List<LearningGoal>,requirements: null == requirements ? _self.requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,testCases: null == testCases ? _self.testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<AssignmentTestCase>,problemDetail: freezed == problemDetail ? _self.problemDetail : problemDetail // ignore: cast_nullable_to_non_nullable
as ProblemDetail?,submissionGuide: freezed == submissionGuide ? _self.submissionGuide : submissionGuide // ignore: cast_nullable_to_non_nullable
as SubmissionGuide?,codeTemplates: null == codeTemplates ? _self.codeTemplates : codeTemplates // ignore: cast_nullable_to_non_nullable
as List<CodeTemplate>,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}
/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProblemDetailCopyWith<$Res>? get problemDetail {
    if (_self.problemDetail == null) {
    return null;
  }

  return $ProblemDetailCopyWith<$Res>(_self.problemDetail!, (value) {
    return _then(_self.copyWith(problemDetail: value));
  });
}/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionGuideCopyWith<$Res>? get submissionGuide {
    if (_self.submissionGuide == null) {
    return null;
  }

  return $SubmissionGuideCopyWith<$Res>(_self.submissionGuide!, (value) {
    return _then(_self.copyWith(submissionGuide: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String difficulty,  String? description,  List<LearningGoal> learningGoals,  List<AssignmentRequirement> requirements,  List<AssignmentTestCase> testCases,  ProblemDetail? problemDetail,  SubmissionGuide? submissionGuide,  List<CodeTemplate> codeTemplates,  Map<String, dynamic> attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
return $default(_that.title,_that.difficulty,_that.description,_that.learningGoals,_that.requirements,_that.testCases,_that.problemDetail,_that.submissionGuide,_that.codeTemplates,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String difficulty,  String? description,  List<LearningGoal> learningGoals,  List<AssignmentRequirement> requirements,  List<AssignmentTestCase> testCases,  ProblemDetail? problemDetail,  SubmissionGuide? submissionGuide,  List<CodeTemplate> codeTemplates,  Map<String, dynamic> attributes)  $default,) {final _that = this;
switch (_that) {
case _AssignmentMetadata():
return $default(_that.title,_that.difficulty,_that.description,_that.learningGoals,_that.requirements,_that.testCases,_that.problemDetail,_that.submissionGuide,_that.codeTemplates,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String difficulty,  String? description,  List<LearningGoal> learningGoals,  List<AssignmentRequirement> requirements,  List<AssignmentTestCase> testCases,  ProblemDetail? problemDetail,  SubmissionGuide? submissionGuide,  List<CodeTemplate> codeTemplates,  Map<String, dynamic> attributes)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentMetadata() when $default != null:
return $default(_that.title,_that.difficulty,_that.description,_that.learningGoals,_that.requirements,_that.testCases,_that.problemDetail,_that.submissionGuide,_that.codeTemplates,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentMetadata implements AssignmentMetadata {
  const _AssignmentMetadata({this.title = '', this.difficulty = 'MID', this.description, final  List<LearningGoal> learningGoals = const [], final  List<AssignmentRequirement> requirements = const [], final  List<AssignmentTestCase> testCases = const [], this.problemDetail, this.submissionGuide, final  List<CodeTemplate> codeTemplates = const [], final  Map<String, dynamic> attributes = const {}}): _learningGoals = learningGoals,_requirements = requirements,_testCases = testCases,_codeTemplates = codeTemplates,_attributes = attributes;
  factory _AssignmentMetadata.fromJson(Map<String, dynamic> json) => _$AssignmentMetadataFromJson(json);

@override@JsonKey() final  String title;
@override@JsonKey() final  String difficulty;
@override final  String? description;
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

 final  List<AssignmentTestCase> _testCases;
@override@JsonKey() List<AssignmentTestCase> get testCases {
  if (_testCases is EqualUnmodifiableListView) return _testCases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testCases);
}

@override final  ProblemDetail? problemDetail;
@override final  SubmissionGuide? submissionGuide;
 final  List<CodeTemplate> _codeTemplates;
@override@JsonKey() List<CodeTemplate> get codeTemplates {
  if (_codeTemplates is EqualUnmodifiableListView) return _codeTemplates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_codeTemplates);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentMetadata&&(identical(other.title, title) || other.title == title)&&(identical(other.difficulty, difficulty) || other.difficulty == difficulty)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._learningGoals, _learningGoals)&&const DeepCollectionEquality().equals(other._requirements, _requirements)&&const DeepCollectionEquality().equals(other._testCases, _testCases)&&(identical(other.problemDetail, problemDetail) || other.problemDetail == problemDetail)&&(identical(other.submissionGuide, submissionGuide) || other.submissionGuide == submissionGuide)&&const DeepCollectionEquality().equals(other._codeTemplates, _codeTemplates)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,difficulty,description,const DeepCollectionEquality().hash(_learningGoals),const DeepCollectionEquality().hash(_requirements),const DeepCollectionEquality().hash(_testCases),problemDetail,submissionGuide,const DeepCollectionEquality().hash(_codeTemplates),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'AssignmentMetadata(title: $title, difficulty: $difficulty, description: $description, learningGoals: $learningGoals, requirements: $requirements, testCases: $testCases, problemDetail: $problemDetail, submissionGuide: $submissionGuide, codeTemplates: $codeTemplates, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$AssignmentMetadataCopyWith<$Res> implements $AssignmentMetadataCopyWith<$Res> {
  factory _$AssignmentMetadataCopyWith(_AssignmentMetadata value, $Res Function(_AssignmentMetadata) _then) = __$AssignmentMetadataCopyWithImpl;
@override @useResult
$Res call({
 String title, String difficulty, String? description, List<LearningGoal> learningGoals, List<AssignmentRequirement> requirements, List<AssignmentTestCase> testCases, ProblemDetail? problemDetail, SubmissionGuide? submissionGuide, List<CodeTemplate> codeTemplates, Map<String, dynamic> attributes
});


@override $ProblemDetailCopyWith<$Res>? get problemDetail;@override $SubmissionGuideCopyWith<$Res>? get submissionGuide;

}
/// @nodoc
class __$AssignmentMetadataCopyWithImpl<$Res>
    implements _$AssignmentMetadataCopyWith<$Res> {
  __$AssignmentMetadataCopyWithImpl(this._self, this._then);

  final _AssignmentMetadata _self;
  final $Res Function(_AssignmentMetadata) _then;

/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? difficulty = null,Object? description = freezed,Object? learningGoals = null,Object? requirements = null,Object? testCases = null,Object? problemDetail = freezed,Object? submissionGuide = freezed,Object? codeTemplates = null,Object? attributes = null,}) {
  return _then(_AssignmentMetadata(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,difficulty: null == difficulty ? _self.difficulty : difficulty // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,learningGoals: null == learningGoals ? _self._learningGoals : learningGoals // ignore: cast_nullable_to_non_nullable
as List<LearningGoal>,requirements: null == requirements ? _self._requirements : requirements // ignore: cast_nullable_to_non_nullable
as List<AssignmentRequirement>,testCases: null == testCases ? _self._testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<AssignmentTestCase>,problemDetail: freezed == problemDetail ? _self.problemDetail : problemDetail // ignore: cast_nullable_to_non_nullable
as ProblemDetail?,submissionGuide: freezed == submissionGuide ? _self.submissionGuide : submissionGuide // ignore: cast_nullable_to_non_nullable
as SubmissionGuide?,codeTemplates: null == codeTemplates ? _self._codeTemplates : codeTemplates // ignore: cast_nullable_to_non_nullable
as List<CodeTemplate>,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProblemDetailCopyWith<$Res>? get problemDetail {
    if (_self.problemDetail == null) {
    return null;
  }

  return $ProblemDetailCopyWith<$Res>(_self.problemDetail!, (value) {
    return _then(_self.copyWith(problemDetail: value));
  });
}/// Create a copy of AssignmentMetadata
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubmissionGuideCopyWith<$Res>? get submissionGuide {
    if (_self.submissionGuide == null) {
    return null;
  }

  return $SubmissionGuideCopyWith<$Res>(_self.submissionGuide!, (value) {
    return _then(_self.copyWith(submissionGuide: value));
  });
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
mixin _$AssignmentTestCase {

 int get seq;@JsonKey(fromJson: _inputTextFromJson) List<dynamic> get inputText; String? get outputText; String get visibility;
/// Create a copy of AssignmentTestCase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AssignmentTestCaseCopyWith<AssignmentTestCase> get copyWith => _$AssignmentTestCaseCopyWithImpl<AssignmentTestCase>(this as AssignmentTestCase, _$identity);

  /// Serializes this AssignmentTestCase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AssignmentTestCase&&(identical(other.seq, seq) || other.seq == seq)&&const DeepCollectionEquality().equals(other.inputText, inputText)&&(identical(other.outputText, outputText) || other.outputText == outputText)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seq,const DeepCollectionEquality().hash(inputText),outputText,visibility);

@override
String toString() {
  return 'AssignmentTestCase(seq: $seq, inputText: $inputText, outputText: $outputText, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class $AssignmentTestCaseCopyWith<$Res>  {
  factory $AssignmentTestCaseCopyWith(AssignmentTestCase value, $Res Function(AssignmentTestCase) _then) = _$AssignmentTestCaseCopyWithImpl;
@useResult
$Res call({
 int seq,@JsonKey(fromJson: _inputTextFromJson) List<dynamic> inputText, String? outputText, String visibility
});




}
/// @nodoc
class _$AssignmentTestCaseCopyWithImpl<$Res>
    implements $AssignmentTestCaseCopyWith<$Res> {
  _$AssignmentTestCaseCopyWithImpl(this._self, this._then);

  final AssignmentTestCase _self;
  final $Res Function(AssignmentTestCase) _then;

/// Create a copy of AssignmentTestCase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seq = null,Object? inputText = null,Object? outputText = freezed,Object? visibility = null,}) {
  return _then(_self.copyWith(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,inputText: null == inputText ? _self.inputText : inputText // ignore: cast_nullable_to_non_nullable
as List<dynamic>,outputText: freezed == outputText ? _self.outputText : outputText // ignore: cast_nullable_to_non_nullable
as String?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AssignmentTestCase].
extension AssignmentTestCasePatterns on AssignmentTestCase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AssignmentTestCase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AssignmentTestCase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AssignmentTestCase value)  $default,){
final _that = this;
switch (_that) {
case _AssignmentTestCase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AssignmentTestCase value)?  $default,){
final _that = this;
switch (_that) {
case _AssignmentTestCase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int seq, @JsonKey(fromJson: _inputTextFromJson)  List<dynamic> inputText,  String? outputText,  String visibility)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AssignmentTestCase() when $default != null:
return $default(_that.seq,_that.inputText,_that.outputText,_that.visibility);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int seq, @JsonKey(fromJson: _inputTextFromJson)  List<dynamic> inputText,  String? outputText,  String visibility)  $default,) {final _that = this;
switch (_that) {
case _AssignmentTestCase():
return $default(_that.seq,_that.inputText,_that.outputText,_that.visibility);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int seq, @JsonKey(fromJson: _inputTextFromJson)  List<dynamic> inputText,  String? outputText,  String visibility)?  $default,) {final _that = this;
switch (_that) {
case _AssignmentTestCase() when $default != null:
return $default(_that.seq,_that.inputText,_that.outputText,_that.visibility);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AssignmentTestCase implements AssignmentTestCase {
  const _AssignmentTestCase({required this.seq, @JsonKey(fromJson: _inputTextFromJson) final  List<dynamic> inputText = const [], this.outputText, this.visibility = 'PUBLIC'}): _inputText = inputText;
  factory _AssignmentTestCase.fromJson(Map<String, dynamic> json) => _$AssignmentTestCaseFromJson(json);

@override final  int seq;
 final  List<dynamic> _inputText;
@override@JsonKey(fromJson: _inputTextFromJson) List<dynamic> get inputText {
  if (_inputText is EqualUnmodifiableListView) return _inputText;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_inputText);
}

@override final  String? outputText;
@override@JsonKey() final  String visibility;

/// Create a copy of AssignmentTestCase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AssignmentTestCaseCopyWith<_AssignmentTestCase> get copyWith => __$AssignmentTestCaseCopyWithImpl<_AssignmentTestCase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AssignmentTestCaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AssignmentTestCase&&(identical(other.seq, seq) || other.seq == seq)&&const DeepCollectionEquality().equals(other._inputText, _inputText)&&(identical(other.outputText, outputText) || other.outputText == outputText)&&(identical(other.visibility, visibility) || other.visibility == visibility));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,seq,const DeepCollectionEquality().hash(_inputText),outputText,visibility);

@override
String toString() {
  return 'AssignmentTestCase(seq: $seq, inputText: $inputText, outputText: $outputText, visibility: $visibility)';
}


}

/// @nodoc
abstract mixin class _$AssignmentTestCaseCopyWith<$Res> implements $AssignmentTestCaseCopyWith<$Res> {
  factory _$AssignmentTestCaseCopyWith(_AssignmentTestCase value, $Res Function(_AssignmentTestCase) _then) = __$AssignmentTestCaseCopyWithImpl;
@override @useResult
$Res call({
 int seq,@JsonKey(fromJson: _inputTextFromJson) List<dynamic> inputText, String? outputText, String visibility
});




}
/// @nodoc
class __$AssignmentTestCaseCopyWithImpl<$Res>
    implements _$AssignmentTestCaseCopyWith<$Res> {
  __$AssignmentTestCaseCopyWithImpl(this._self, this._then);

  final _AssignmentTestCase _self;
  final $Res Function(_AssignmentTestCase) _then;

/// Create a copy of AssignmentTestCase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seq = null,Object? inputText = null,Object? outputText = freezed,Object? visibility = null,}) {
  return _then(_AssignmentTestCase(
seq: null == seq ? _self.seq : seq // ignore: cast_nullable_to_non_nullable
as int,inputText: null == inputText ? _self._inputText : inputText // ignore: cast_nullable_to_non_nullable
as List<dynamic>,outputText: freezed == outputText ? _self.outputText : outputText // ignore: cast_nullable_to_non_nullable
as String?,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProblemDetail {

 String? get inputDescription; String? get outputDescription; ProblemClassification? get classification;
/// Create a copy of ProblemDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProblemDetailCopyWith<ProblemDetail> get copyWith => _$ProblemDetailCopyWithImpl<ProblemDetail>(this as ProblemDetail, _$identity);

  /// Serializes this ProblemDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProblemDetail&&(identical(other.inputDescription, inputDescription) || other.inputDescription == inputDescription)&&(identical(other.outputDescription, outputDescription) || other.outputDescription == outputDescription)&&(identical(other.classification, classification) || other.classification == classification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputDescription,outputDescription,classification);

@override
String toString() {
  return 'ProblemDetail(inputDescription: $inputDescription, outputDescription: $outputDescription, classification: $classification)';
}


}

/// @nodoc
abstract mixin class $ProblemDetailCopyWith<$Res>  {
  factory $ProblemDetailCopyWith(ProblemDetail value, $Res Function(ProblemDetail) _then) = _$ProblemDetailCopyWithImpl;
@useResult
$Res call({
 String? inputDescription, String? outputDescription, ProblemClassification? classification
});


$ProblemClassificationCopyWith<$Res>? get classification;

}
/// @nodoc
class _$ProblemDetailCopyWithImpl<$Res>
    implements $ProblemDetailCopyWith<$Res> {
  _$ProblemDetailCopyWithImpl(this._self, this._then);

  final ProblemDetail _self;
  final $Res Function(ProblemDetail) _then;

/// Create a copy of ProblemDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? inputDescription = freezed,Object? outputDescription = freezed,Object? classification = freezed,}) {
  return _then(_self.copyWith(
inputDescription: freezed == inputDescription ? _self.inputDescription : inputDescription // ignore: cast_nullable_to_non_nullable
as String?,outputDescription: freezed == outputDescription ? _self.outputDescription : outputDescription // ignore: cast_nullable_to_non_nullable
as String?,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as ProblemClassification?,
  ));
}
/// Create a copy of ProblemDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProblemClassificationCopyWith<$Res>? get classification {
    if (_self.classification == null) {
    return null;
  }

  return $ProblemClassificationCopyWith<$Res>(_self.classification!, (value) {
    return _then(_self.copyWith(classification: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProblemDetail].
extension ProblemDetailPatterns on ProblemDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProblemDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProblemDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProblemDetail value)  $default,){
final _that = this;
switch (_that) {
case _ProblemDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProblemDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ProblemDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? inputDescription,  String? outputDescription,  ProblemClassification? classification)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProblemDetail() when $default != null:
return $default(_that.inputDescription,_that.outputDescription,_that.classification);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? inputDescription,  String? outputDescription,  ProblemClassification? classification)  $default,) {final _that = this;
switch (_that) {
case _ProblemDetail():
return $default(_that.inputDescription,_that.outputDescription,_that.classification);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? inputDescription,  String? outputDescription,  ProblemClassification? classification)?  $default,) {final _that = this;
switch (_that) {
case _ProblemDetail() when $default != null:
return $default(_that.inputDescription,_that.outputDescription,_that.classification);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProblemDetail implements ProblemDetail {
  const _ProblemDetail({this.inputDescription, this.outputDescription, this.classification});
  factory _ProblemDetail.fromJson(Map<String, dynamic> json) => _$ProblemDetailFromJson(json);

@override final  String? inputDescription;
@override final  String? outputDescription;
@override final  ProblemClassification? classification;

/// Create a copy of ProblemDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProblemDetailCopyWith<_ProblemDetail> get copyWith => __$ProblemDetailCopyWithImpl<_ProblemDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProblemDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProblemDetail&&(identical(other.inputDescription, inputDescription) || other.inputDescription == inputDescription)&&(identical(other.outputDescription, outputDescription) || other.outputDescription == outputDescription)&&(identical(other.classification, classification) || other.classification == classification));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,inputDescription,outputDescription,classification);

@override
String toString() {
  return 'ProblemDetail(inputDescription: $inputDescription, outputDescription: $outputDescription, classification: $classification)';
}


}

/// @nodoc
abstract mixin class _$ProblemDetailCopyWith<$Res> implements $ProblemDetailCopyWith<$Res> {
  factory _$ProblemDetailCopyWith(_ProblemDetail value, $Res Function(_ProblemDetail) _then) = __$ProblemDetailCopyWithImpl;
@override @useResult
$Res call({
 String? inputDescription, String? outputDescription, ProblemClassification? classification
});


@override $ProblemClassificationCopyWith<$Res>? get classification;

}
/// @nodoc
class __$ProblemDetailCopyWithImpl<$Res>
    implements _$ProblemDetailCopyWith<$Res> {
  __$ProblemDetailCopyWithImpl(this._self, this._then);

  final _ProblemDetail _self;
  final $Res Function(_ProblemDetail) _then;

/// Create a copy of ProblemDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? inputDescription = freezed,Object? outputDescription = freezed,Object? classification = freezed,}) {
  return _then(_ProblemDetail(
inputDescription: freezed == inputDescription ? _self.inputDescription : inputDescription // ignore: cast_nullable_to_non_nullable
as String?,outputDescription: freezed == outputDescription ? _self.outputDescription : outputDescription // ignore: cast_nullable_to_non_nullable
as String?,classification: freezed == classification ? _self.classification : classification // ignore: cast_nullable_to_non_nullable
as ProblemClassification?,
  ));
}

/// Create a copy of ProblemDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProblemClassificationCopyWith<$Res>? get classification {
    if (_self.classification == null) {
    return null;
  }

  return $ProblemClassificationCopyWith<$Res>(_self.classification!, (value) {
    return _then(_self.copyWith(classification: value));
  });
}
}


/// @nodoc
mixin _$ProblemClassification {

 String? get algorithmStep; int? get difficultyStep;
/// Create a copy of ProblemClassification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProblemClassificationCopyWith<ProblemClassification> get copyWith => _$ProblemClassificationCopyWithImpl<ProblemClassification>(this as ProblemClassification, _$identity);

  /// Serializes this ProblemClassification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProblemClassification&&(identical(other.algorithmStep, algorithmStep) || other.algorithmStep == algorithmStep)&&(identical(other.difficultyStep, difficultyStep) || other.difficultyStep == difficultyStep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,algorithmStep,difficultyStep);

@override
String toString() {
  return 'ProblemClassification(algorithmStep: $algorithmStep, difficultyStep: $difficultyStep)';
}


}

/// @nodoc
abstract mixin class $ProblemClassificationCopyWith<$Res>  {
  factory $ProblemClassificationCopyWith(ProblemClassification value, $Res Function(ProblemClassification) _then) = _$ProblemClassificationCopyWithImpl;
@useResult
$Res call({
 String? algorithmStep, int? difficultyStep
});




}
/// @nodoc
class _$ProblemClassificationCopyWithImpl<$Res>
    implements $ProblemClassificationCopyWith<$Res> {
  _$ProblemClassificationCopyWithImpl(this._self, this._then);

  final ProblemClassification _self;
  final $Res Function(ProblemClassification) _then;

/// Create a copy of ProblemClassification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? algorithmStep = freezed,Object? difficultyStep = freezed,}) {
  return _then(_self.copyWith(
algorithmStep: freezed == algorithmStep ? _self.algorithmStep : algorithmStep // ignore: cast_nullable_to_non_nullable
as String?,difficultyStep: freezed == difficultyStep ? _self.difficultyStep : difficultyStep // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProblemClassification].
extension ProblemClassificationPatterns on ProblemClassification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProblemClassification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProblemClassification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProblemClassification value)  $default,){
final _that = this;
switch (_that) {
case _ProblemClassification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProblemClassification value)?  $default,){
final _that = this;
switch (_that) {
case _ProblemClassification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? algorithmStep,  int? difficultyStep)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProblemClassification() when $default != null:
return $default(_that.algorithmStep,_that.difficultyStep);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? algorithmStep,  int? difficultyStep)  $default,) {final _that = this;
switch (_that) {
case _ProblemClassification():
return $default(_that.algorithmStep,_that.difficultyStep);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? algorithmStep,  int? difficultyStep)?  $default,) {final _that = this;
switch (_that) {
case _ProblemClassification() when $default != null:
return $default(_that.algorithmStep,_that.difficultyStep);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProblemClassification implements ProblemClassification {
  const _ProblemClassification({this.algorithmStep, this.difficultyStep});
  factory _ProblemClassification.fromJson(Map<String, dynamic> json) => _$ProblemClassificationFromJson(json);

@override final  String? algorithmStep;
@override final  int? difficultyStep;

/// Create a copy of ProblemClassification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProblemClassificationCopyWith<_ProblemClassification> get copyWith => __$ProblemClassificationCopyWithImpl<_ProblemClassification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProblemClassificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProblemClassification&&(identical(other.algorithmStep, algorithmStep) || other.algorithmStep == algorithmStep)&&(identical(other.difficultyStep, difficultyStep) || other.difficultyStep == difficultyStep));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,algorithmStep,difficultyStep);

@override
String toString() {
  return 'ProblemClassification(algorithmStep: $algorithmStep, difficultyStep: $difficultyStep)';
}


}

/// @nodoc
abstract mixin class _$ProblemClassificationCopyWith<$Res> implements $ProblemClassificationCopyWith<$Res> {
  factory _$ProblemClassificationCopyWith(_ProblemClassification value, $Res Function(_ProblemClassification) _then) = __$ProblemClassificationCopyWithImpl;
@override @useResult
$Res call({
 String? algorithmStep, int? difficultyStep
});




}
/// @nodoc
class __$ProblemClassificationCopyWithImpl<$Res>
    implements _$ProblemClassificationCopyWith<$Res> {
  __$ProblemClassificationCopyWithImpl(this._self, this._then);

  final _ProblemClassification _self;
  final $Res Function(_ProblemClassification) _then;

/// Create a copy of ProblemClassification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? algorithmStep = freezed,Object? difficultyStep = freezed,}) {
  return _then(_ProblemClassification(
algorithmStep: freezed == algorithmStep ? _self.algorithmStep : algorithmStep // ignore: cast_nullable_to_non_nullable
as String?,difficultyStep: freezed == difficultyStep ? _self.difficultyStep : difficultyStep // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SubmissionGuide {

 String? get title; String? get description;@JsonKey(fromJson: _commentSectionsFromJson) List<String> get commentSections;
/// Create a copy of SubmissionGuide
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionGuideCopyWith<SubmissionGuide> get copyWith => _$SubmissionGuideCopyWithImpl<SubmissionGuide>(this as SubmissionGuide, _$identity);

  /// Serializes this SubmissionGuide to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionGuide&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.commentSections, commentSections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,const DeepCollectionEquality().hash(commentSections));

@override
String toString() {
  return 'SubmissionGuide(title: $title, description: $description, commentSections: $commentSections)';
}


}

/// @nodoc
abstract mixin class $SubmissionGuideCopyWith<$Res>  {
  factory $SubmissionGuideCopyWith(SubmissionGuide value, $Res Function(SubmissionGuide) _then) = _$SubmissionGuideCopyWithImpl;
@useResult
$Res call({
 String? title, String? description,@JsonKey(fromJson: _commentSectionsFromJson) List<String> commentSections
});




}
/// @nodoc
class _$SubmissionGuideCopyWithImpl<$Res>
    implements $SubmissionGuideCopyWith<$Res> {
  _$SubmissionGuideCopyWithImpl(this._self, this._then);

  final SubmissionGuide _self;
  final $Res Function(SubmissionGuide) _then;

/// Create a copy of SubmissionGuide
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? description = freezed,Object? commentSections = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,commentSections: null == commentSections ? _self.commentSections : commentSections // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionGuide].
extension SubmissionGuidePatterns on SubmissionGuide {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionGuide value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionGuide() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionGuide value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionGuide():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionGuide value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionGuide() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? description, @JsonKey(fromJson: _commentSectionsFromJson)  List<String> commentSections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionGuide() when $default != null:
return $default(_that.title,_that.description,_that.commentSections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? description, @JsonKey(fromJson: _commentSectionsFromJson)  List<String> commentSections)  $default,) {final _that = this;
switch (_that) {
case _SubmissionGuide():
return $default(_that.title,_that.description,_that.commentSections);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? description, @JsonKey(fromJson: _commentSectionsFromJson)  List<String> commentSections)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionGuide() when $default != null:
return $default(_that.title,_that.description,_that.commentSections);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionGuide implements SubmissionGuide {
  const _SubmissionGuide({this.title, this.description, @JsonKey(fromJson: _commentSectionsFromJson) final  List<String> commentSections = const []}): _commentSections = commentSections;
  factory _SubmissionGuide.fromJson(Map<String, dynamic> json) => _$SubmissionGuideFromJson(json);

@override final  String? title;
@override final  String? description;
 final  List<String> _commentSections;
@override@JsonKey(fromJson: _commentSectionsFromJson) List<String> get commentSections {
  if (_commentSections is EqualUnmodifiableListView) return _commentSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_commentSections);
}


/// Create a copy of SubmissionGuide
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionGuideCopyWith<_SubmissionGuide> get copyWith => __$SubmissionGuideCopyWithImpl<_SubmissionGuide>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionGuideToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionGuide&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._commentSections, _commentSections));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,const DeepCollectionEquality().hash(_commentSections));

@override
String toString() {
  return 'SubmissionGuide(title: $title, description: $description, commentSections: $commentSections)';
}


}

/// @nodoc
abstract mixin class _$SubmissionGuideCopyWith<$Res> implements $SubmissionGuideCopyWith<$Res> {
  factory _$SubmissionGuideCopyWith(_SubmissionGuide value, $Res Function(_SubmissionGuide) _then) = __$SubmissionGuideCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? description,@JsonKey(fromJson: _commentSectionsFromJson) List<String> commentSections
});




}
/// @nodoc
class __$SubmissionGuideCopyWithImpl<$Res>
    implements _$SubmissionGuideCopyWith<$Res> {
  __$SubmissionGuideCopyWithImpl(this._self, this._then);

  final _SubmissionGuide _self;
  final $Res Function(_SubmissionGuide) _then;

/// Create a copy of SubmissionGuide
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? description = freezed,Object? commentSections = null,}) {
  return _then(_SubmissionGuide(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,commentSections: null == commentSections ? _self._commentSections : commentSections // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$CodeTemplate {

 String get language; String? get codeTemplate; String? get runnableTemplate; String? get commentTemplate; String? get functionTemplate;
/// Create a copy of CodeTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CodeTemplateCopyWith<CodeTemplate> get copyWith => _$CodeTemplateCopyWithImpl<CodeTemplate>(this as CodeTemplate, _$identity);

  /// Serializes this CodeTemplate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CodeTemplate&&(identical(other.language, language) || other.language == language)&&(identical(other.codeTemplate, codeTemplate) || other.codeTemplate == codeTemplate)&&(identical(other.runnableTemplate, runnableTemplate) || other.runnableTemplate == runnableTemplate)&&(identical(other.commentTemplate, commentTemplate) || other.commentTemplate == commentTemplate)&&(identical(other.functionTemplate, functionTemplate) || other.functionTemplate == functionTemplate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,codeTemplate,runnableTemplate,commentTemplate,functionTemplate);

@override
String toString() {
  return 'CodeTemplate(language: $language, codeTemplate: $codeTemplate, runnableTemplate: $runnableTemplate, commentTemplate: $commentTemplate, functionTemplate: $functionTemplate)';
}


}

/// @nodoc
abstract mixin class $CodeTemplateCopyWith<$Res>  {
  factory $CodeTemplateCopyWith(CodeTemplate value, $Res Function(CodeTemplate) _then) = _$CodeTemplateCopyWithImpl;
@useResult
$Res call({
 String language, String? codeTemplate, String? runnableTemplate, String? commentTemplate, String? functionTemplate
});




}
/// @nodoc
class _$CodeTemplateCopyWithImpl<$Res>
    implements $CodeTemplateCopyWith<$Res> {
  _$CodeTemplateCopyWithImpl(this._self, this._then);

  final CodeTemplate _self;
  final $Res Function(CodeTemplate) _then;

/// Create a copy of CodeTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? language = null,Object? codeTemplate = freezed,Object? runnableTemplate = freezed,Object? commentTemplate = freezed,Object? functionTemplate = freezed,}) {
  return _then(_self.copyWith(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,codeTemplate: freezed == codeTemplate ? _self.codeTemplate : codeTemplate // ignore: cast_nullable_to_non_nullable
as String?,runnableTemplate: freezed == runnableTemplate ? _self.runnableTemplate : runnableTemplate // ignore: cast_nullable_to_non_nullable
as String?,commentTemplate: freezed == commentTemplate ? _self.commentTemplate : commentTemplate // ignore: cast_nullable_to_non_nullable
as String?,functionTemplate: freezed == functionTemplate ? _self.functionTemplate : functionTemplate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CodeTemplate].
extension CodeTemplatePatterns on CodeTemplate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CodeTemplate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CodeTemplate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CodeTemplate value)  $default,){
final _that = this;
switch (_that) {
case _CodeTemplate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CodeTemplate value)?  $default,){
final _that = this;
switch (_that) {
case _CodeTemplate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String language,  String? codeTemplate,  String? runnableTemplate,  String? commentTemplate,  String? functionTemplate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CodeTemplate() when $default != null:
return $default(_that.language,_that.codeTemplate,_that.runnableTemplate,_that.commentTemplate,_that.functionTemplate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String language,  String? codeTemplate,  String? runnableTemplate,  String? commentTemplate,  String? functionTemplate)  $default,) {final _that = this;
switch (_that) {
case _CodeTemplate():
return $default(_that.language,_that.codeTemplate,_that.runnableTemplate,_that.commentTemplate,_that.functionTemplate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String language,  String? codeTemplate,  String? runnableTemplate,  String? commentTemplate,  String? functionTemplate)?  $default,) {final _that = this;
switch (_that) {
case _CodeTemplate() when $default != null:
return $default(_that.language,_that.codeTemplate,_that.runnableTemplate,_that.commentTemplate,_that.functionTemplate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CodeTemplate implements CodeTemplate {
  const _CodeTemplate({required this.language, this.codeTemplate, this.runnableTemplate, this.commentTemplate, this.functionTemplate});
  factory _CodeTemplate.fromJson(Map<String, dynamic> json) => _$CodeTemplateFromJson(json);

@override final  String language;
@override final  String? codeTemplate;
@override final  String? runnableTemplate;
@override final  String? commentTemplate;
@override final  String? functionTemplate;

/// Create a copy of CodeTemplate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CodeTemplateCopyWith<_CodeTemplate> get copyWith => __$CodeTemplateCopyWithImpl<_CodeTemplate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CodeTemplateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CodeTemplate&&(identical(other.language, language) || other.language == language)&&(identical(other.codeTemplate, codeTemplate) || other.codeTemplate == codeTemplate)&&(identical(other.runnableTemplate, runnableTemplate) || other.runnableTemplate == runnableTemplate)&&(identical(other.commentTemplate, commentTemplate) || other.commentTemplate == commentTemplate)&&(identical(other.functionTemplate, functionTemplate) || other.functionTemplate == functionTemplate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,language,codeTemplate,runnableTemplate,commentTemplate,functionTemplate);

@override
String toString() {
  return 'CodeTemplate(language: $language, codeTemplate: $codeTemplate, runnableTemplate: $runnableTemplate, commentTemplate: $commentTemplate, functionTemplate: $functionTemplate)';
}


}

/// @nodoc
abstract mixin class _$CodeTemplateCopyWith<$Res> implements $CodeTemplateCopyWith<$Res> {
  factory _$CodeTemplateCopyWith(_CodeTemplate value, $Res Function(_CodeTemplate) _then) = __$CodeTemplateCopyWithImpl;
@override @useResult
$Res call({
 String language, String? codeTemplate, String? runnableTemplate, String? commentTemplate, String? functionTemplate
});




}
/// @nodoc
class __$CodeTemplateCopyWithImpl<$Res>
    implements _$CodeTemplateCopyWith<$Res> {
  __$CodeTemplateCopyWithImpl(this._self, this._then);

  final _CodeTemplate _self;
  final $Res Function(_CodeTemplate) _then;

/// Create a copy of CodeTemplate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? language = null,Object? codeTemplate = freezed,Object? runnableTemplate = freezed,Object? commentTemplate = freezed,Object? functionTemplate = freezed,}) {
  return _then(_CodeTemplate(
language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,codeTemplate: freezed == codeTemplate ? _self.codeTemplate : codeTemplate // ignore: cast_nullable_to_non_nullable
as String?,runnableTemplate: freezed == runnableTemplate ? _self.runnableTemplate : runnableTemplate // ignore: cast_nullable_to_non_nullable
as String?,commentTemplate: freezed == commentTemplate ? _self.commentTemplate : commentTemplate // ignore: cast_nullable_to_non_nullable
as String?,functionTemplate: freezed == functionTemplate ? _self.functionTemplate : functionTemplate // ignore: cast_nullable_to_non_nullable
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

 int get orderInWeek; String get startAt; String get endAt; AssignmentMetadata get metadata; String? get status;
/// Create a copy of UpdateAssignmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateAssignmentRequestCopyWith<UpdateAssignmentRequest> get copyWith => _$UpdateAssignmentRequestCopyWithImpl<UpdateAssignmentRequest>(this as UpdateAssignmentRequest, _$identity);

  /// Serializes this UpdateAssignmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateAssignmentRequest&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderInWeek,startAt,endAt,metadata,status);

@override
String toString() {
  return 'UpdateAssignmentRequest(orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata, status: $status)';
}


}

/// @nodoc
abstract mixin class $UpdateAssignmentRequestCopyWith<$Res>  {
  factory $UpdateAssignmentRequestCopyWith(UpdateAssignmentRequest value, $Res Function(UpdateAssignmentRequest) _then) = _$UpdateAssignmentRequestCopyWithImpl;
@useResult
$Res call({
 int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata, String? status
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
@pragma('vm:prefer-inline') @override $Res call({Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,Object? status = freezed,}) {
  return _then(_self.copyWith(
orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
return $default(_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata,  String? status)  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest():
return $default(_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderInWeek,  String startAt,  String endAt,  AssignmentMetadata metadata,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _UpdateAssignmentRequest() when $default != null:
return $default(_that.orderInWeek,_that.startAt,_that.endAt,_that.metadata,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateAssignmentRequest implements UpdateAssignmentRequest {
  const _UpdateAssignmentRequest({required this.orderInWeek, required this.startAt, required this.endAt, required this.metadata, this.status});
  factory _UpdateAssignmentRequest.fromJson(Map<String, dynamic> json) => _$UpdateAssignmentRequestFromJson(json);

@override final  int orderInWeek;
@override final  String startAt;
@override final  String endAt;
@override final  AssignmentMetadata metadata;
@override final  String? status;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateAssignmentRequest&&(identical(other.orderInWeek, orderInWeek) || other.orderInWeek == orderInWeek)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.endAt, endAt) || other.endAt == endAt)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderInWeek,startAt,endAt,metadata,status);

@override
String toString() {
  return 'UpdateAssignmentRequest(orderInWeek: $orderInWeek, startAt: $startAt, endAt: $endAt, metadata: $metadata, status: $status)';
}


}

/// @nodoc
abstract mixin class _$UpdateAssignmentRequestCopyWith<$Res> implements $UpdateAssignmentRequestCopyWith<$Res> {
  factory _$UpdateAssignmentRequestCopyWith(_UpdateAssignmentRequest value, $Res Function(_UpdateAssignmentRequest) _then) = __$UpdateAssignmentRequestCopyWithImpl;
@override @useResult
$Res call({
 int orderInWeek, String startAt, String endAt, AssignmentMetadata metadata, String? status
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
@override @pragma('vm:prefer-inline') $Res call({Object? orderInWeek = null,Object? startAt = null,Object? endAt = null,Object? metadata = null,Object? status = freezed,}) {
  return _then(_UpdateAssignmentRequest(
orderInWeek: null == orderInWeek ? _self.orderInWeek : orderInWeek // ignore: cast_nullable_to_non_nullable
as int,startAt: null == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as String,endAt: null == endAt ? _self.endAt : endAt // ignore: cast_nullable_to_non_nullable
as String,metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as AssignmentMetadata,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
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
