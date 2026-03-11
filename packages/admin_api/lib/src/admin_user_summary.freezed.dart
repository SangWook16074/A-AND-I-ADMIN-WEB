// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_user_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminUserSummary {

 String get id; String get username; AuthRole get role; String? get nickname; String? get publicCode; String? get userTrack; int? get cohort; int? get cohortOrder; bool? get forcePasswordChange; String? get inviteLink; String? get inviteExpiresAt; bool? get active;
/// Create a copy of AdminUserSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminUserSummaryCopyWith<AdminUserSummary> get copyWith => _$AdminUserSummaryCopyWithImpl<AdminUserSummary>(this as AdminUserSummary, _$identity);

  /// Serializes this AdminUserSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminUserSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.userTrack, userTrack) || other.userTrack == userTrack)&&(identical(other.cohort, cohort) || other.cohort == cohort)&&(identical(other.cohortOrder, cohortOrder) || other.cohortOrder == cohortOrder)&&(identical(other.forcePasswordChange, forcePasswordChange) || other.forcePasswordChange == forcePasswordChange)&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&(identical(other.inviteExpiresAt, inviteExpiresAt) || other.inviteExpiresAt == inviteExpiresAt)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,role,nickname,publicCode,userTrack,cohort,cohortOrder,forcePasswordChange,inviteLink,inviteExpiresAt,active);

@override
String toString() {
  return 'AdminUserSummary(id: $id, username: $username, role: $role, nickname: $nickname, publicCode: $publicCode, userTrack: $userTrack, cohort: $cohort, cohortOrder: $cohortOrder, forcePasswordChange: $forcePasswordChange, inviteLink: $inviteLink, inviteExpiresAt: $inviteExpiresAt, active: $active)';
}


}

/// @nodoc
abstract mixin class $AdminUserSummaryCopyWith<$Res>  {
  factory $AdminUserSummaryCopyWith(AdminUserSummary value, $Res Function(AdminUserSummary) _then) = _$AdminUserSummaryCopyWithImpl;
@useResult
$Res call({
 String id, String username, AuthRole role, String? nickname, String? publicCode, String? userTrack, int? cohort, int? cohortOrder, bool? forcePasswordChange, String? inviteLink, String? inviteExpiresAt, bool? active
});




}
/// @nodoc
class _$AdminUserSummaryCopyWithImpl<$Res>
    implements $AdminUserSummaryCopyWith<$Res> {
  _$AdminUserSummaryCopyWithImpl(this._self, this._then);

  final AdminUserSummary _self;
  final $Res Function(AdminUserSummary) _then;

/// Create a copy of AdminUserSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? role = null,Object? nickname = freezed,Object? publicCode = freezed,Object? userTrack = freezed,Object? cohort = freezed,Object? cohortOrder = freezed,Object? forcePasswordChange = freezed,Object? inviteLink = freezed,Object? inviteExpiresAt = freezed,Object? active = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,userTrack: freezed == userTrack ? _self.userTrack : userTrack // ignore: cast_nullable_to_non_nullable
as String?,cohort: freezed == cohort ? _self.cohort : cohort // ignore: cast_nullable_to_non_nullable
as int?,cohortOrder: freezed == cohortOrder ? _self.cohortOrder : cohortOrder // ignore: cast_nullable_to_non_nullable
as int?,forcePasswordChange: freezed == forcePasswordChange ? _self.forcePasswordChange : forcePasswordChange // ignore: cast_nullable_to_non_nullable
as bool?,inviteLink: freezed == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String?,inviteExpiresAt: freezed == inviteExpiresAt ? _self.inviteExpiresAt : inviteExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminUserSummary].
extension AdminUserSummaryPatterns on AdminUserSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminUserSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminUserSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminUserSummary value)  $default,){
final _that = this;
switch (_that) {
case _AdminUserSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminUserSummary value)?  $default,){
final _that = this;
switch (_that) {
case _AdminUserSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  AuthRole role,  String? nickname,  String? publicCode,  String? userTrack,  int? cohort,  int? cohortOrder,  bool? forcePasswordChange,  String? inviteLink,  String? inviteExpiresAt,  bool? active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminUserSummary() when $default != null:
return $default(_that.id,_that.username,_that.role,_that.nickname,_that.publicCode,_that.userTrack,_that.cohort,_that.cohortOrder,_that.forcePasswordChange,_that.inviteLink,_that.inviteExpiresAt,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  AuthRole role,  String? nickname,  String? publicCode,  String? userTrack,  int? cohort,  int? cohortOrder,  bool? forcePasswordChange,  String? inviteLink,  String? inviteExpiresAt,  bool? active)  $default,) {final _that = this;
switch (_that) {
case _AdminUserSummary():
return $default(_that.id,_that.username,_that.role,_that.nickname,_that.publicCode,_that.userTrack,_that.cohort,_that.cohortOrder,_that.forcePasswordChange,_that.inviteLink,_that.inviteExpiresAt,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  AuthRole role,  String? nickname,  String? publicCode,  String? userTrack,  int? cohort,  int? cohortOrder,  bool? forcePasswordChange,  String? inviteLink,  String? inviteExpiresAt,  bool? active)?  $default,) {final _that = this;
switch (_that) {
case _AdminUserSummary() when $default != null:
return $default(_that.id,_that.username,_that.role,_that.nickname,_that.publicCode,_that.userTrack,_that.cohort,_that.cohortOrder,_that.forcePasswordChange,_that.inviteLink,_that.inviteExpiresAt,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminUserSummary implements AdminUserSummary {
  const _AdminUserSummary({required this.id, required this.username, required this.role, this.nickname, this.publicCode, this.userTrack, this.cohort, this.cohortOrder, this.forcePasswordChange, this.inviteLink, this.inviteExpiresAt, this.active});
  factory _AdminUserSummary.fromJson(Map<String, dynamic> json) => _$AdminUserSummaryFromJson(json);

@override final  String id;
@override final  String username;
@override final  AuthRole role;
@override final  String? nickname;
@override final  String? publicCode;
@override final  String? userTrack;
@override final  int? cohort;
@override final  int? cohortOrder;
@override final  bool? forcePasswordChange;
@override final  String? inviteLink;
@override final  String? inviteExpiresAt;
@override final  bool? active;

/// Create a copy of AdminUserSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminUserSummaryCopyWith<_AdminUserSummary> get copyWith => __$AdminUserSummaryCopyWithImpl<_AdminUserSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminUserSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminUserSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.role, role) || other.role == role)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.publicCode, publicCode) || other.publicCode == publicCode)&&(identical(other.userTrack, userTrack) || other.userTrack == userTrack)&&(identical(other.cohort, cohort) || other.cohort == cohort)&&(identical(other.cohortOrder, cohortOrder) || other.cohortOrder == cohortOrder)&&(identical(other.forcePasswordChange, forcePasswordChange) || other.forcePasswordChange == forcePasswordChange)&&(identical(other.inviteLink, inviteLink) || other.inviteLink == inviteLink)&&(identical(other.inviteExpiresAt, inviteExpiresAt) || other.inviteExpiresAt == inviteExpiresAt)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,role,nickname,publicCode,userTrack,cohort,cohortOrder,forcePasswordChange,inviteLink,inviteExpiresAt,active);

@override
String toString() {
  return 'AdminUserSummary(id: $id, username: $username, role: $role, nickname: $nickname, publicCode: $publicCode, userTrack: $userTrack, cohort: $cohort, cohortOrder: $cohortOrder, forcePasswordChange: $forcePasswordChange, inviteLink: $inviteLink, inviteExpiresAt: $inviteExpiresAt, active: $active)';
}


}

/// @nodoc
abstract mixin class _$AdminUserSummaryCopyWith<$Res> implements $AdminUserSummaryCopyWith<$Res> {
  factory _$AdminUserSummaryCopyWith(_AdminUserSummary value, $Res Function(_AdminUserSummary) _then) = __$AdminUserSummaryCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, AuthRole role, String? nickname, String? publicCode, String? userTrack, int? cohort, int? cohortOrder, bool? forcePasswordChange, String? inviteLink, String? inviteExpiresAt, bool? active
});




}
/// @nodoc
class __$AdminUserSummaryCopyWithImpl<$Res>
    implements _$AdminUserSummaryCopyWith<$Res> {
  __$AdminUserSummaryCopyWithImpl(this._self, this._then);

  final _AdminUserSummary _self;
  final $Res Function(_AdminUserSummary) _then;

/// Create a copy of AdminUserSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? role = null,Object? nickname = freezed,Object? publicCode = freezed,Object? userTrack = freezed,Object? cohort = freezed,Object? cohortOrder = freezed,Object? forcePasswordChange = freezed,Object? inviteLink = freezed,Object? inviteExpiresAt = freezed,Object? active = freezed,}) {
  return _then(_AdminUserSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as AuthRole,nickname: freezed == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String?,publicCode: freezed == publicCode ? _self.publicCode : publicCode // ignore: cast_nullable_to_non_nullable
as String?,userTrack: freezed == userTrack ? _self.userTrack : userTrack // ignore: cast_nullable_to_non_nullable
as String?,cohort: freezed == cohort ? _self.cohort : cohort // ignore: cast_nullable_to_non_nullable
as int?,cohortOrder: freezed == cohortOrder ? _self.cohortOrder : cohortOrder // ignore: cast_nullable_to_non_nullable
as int?,forcePasswordChange: freezed == forcePasswordChange ? _self.forcePasswordChange : forcePasswordChange // ignore: cast_nullable_to_non_nullable
as bool?,inviteLink: freezed == inviteLink ? _self.inviteLink : inviteLink // ignore: cast_nullable_to_non_nullable
as String?,inviteExpiresAt: freezed == inviteExpiresAt ? _self.inviteExpiresAt : inviteExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,active: freezed == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
