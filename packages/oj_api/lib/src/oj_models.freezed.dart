// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'oj_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestCase {

 int get caseId; List<dynamic> get args; String get expectedOutput;
/// Create a copy of TestCase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestCaseCopyWith<TestCase> get copyWith => _$TestCaseCopyWithImpl<TestCase>(this as TestCase, _$identity);

  /// Serializes this TestCase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestCase&&(identical(other.caseId, caseId) || other.caseId == caseId)&&const DeepCollectionEquality().equals(other.args, args)&&(identical(other.expectedOutput, expectedOutput) || other.expectedOutput == expectedOutput));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,caseId,const DeepCollectionEquality().hash(args),expectedOutput);

@override
String toString() {
  return 'TestCase(caseId: $caseId, args: $args, expectedOutput: $expectedOutput)';
}


}

/// @nodoc
abstract mixin class $TestCaseCopyWith<$Res>  {
  factory $TestCaseCopyWith(TestCase value, $Res Function(TestCase) _then) = _$TestCaseCopyWithImpl;
@useResult
$Res call({
 int caseId, List<dynamic> args, String expectedOutput
});




}
/// @nodoc
class _$TestCaseCopyWithImpl<$Res>
    implements $TestCaseCopyWith<$Res> {
  _$TestCaseCopyWithImpl(this._self, this._then);

  final TestCase _self;
  final $Res Function(TestCase) _then;

/// Create a copy of TestCase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? caseId = null,Object? args = null,Object? expectedOutput = null,}) {
  return _then(_self.copyWith(
caseId: null == caseId ? _self.caseId : caseId // ignore: cast_nullable_to_non_nullable
as int,args: null == args ? _self.args : args // ignore: cast_nullable_to_non_nullable
as List<dynamic>,expectedOutput: null == expectedOutput ? _self.expectedOutput : expectedOutput // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TestCase].
extension TestCasePatterns on TestCase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestCase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestCase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestCase value)  $default,){
final _that = this;
switch (_that) {
case _TestCase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestCase value)?  $default,){
final _that = this;
switch (_that) {
case _TestCase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int caseId,  List<dynamic> args,  String expectedOutput)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestCase() when $default != null:
return $default(_that.caseId,_that.args,_that.expectedOutput);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int caseId,  List<dynamic> args,  String expectedOutput)  $default,) {final _that = this;
switch (_that) {
case _TestCase():
return $default(_that.caseId,_that.args,_that.expectedOutput);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int caseId,  List<dynamic> args,  String expectedOutput)?  $default,) {final _that = this;
switch (_that) {
case _TestCase() when $default != null:
return $default(_that.caseId,_that.args,_that.expectedOutput);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestCase implements TestCase {
  const _TestCase({required this.caseId, required final  List<dynamic> args, required this.expectedOutput}): _args = args;
  factory _TestCase.fromJson(Map<String, dynamic> json) => _$TestCaseFromJson(json);

@override final  int caseId;
 final  List<dynamic> _args;
@override List<dynamic> get args {
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_args);
}

@override final  String expectedOutput;

/// Create a copy of TestCase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestCaseCopyWith<_TestCase> get copyWith => __$TestCaseCopyWithImpl<_TestCase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestCaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestCase&&(identical(other.caseId, caseId) || other.caseId == caseId)&&const DeepCollectionEquality().equals(other._args, _args)&&(identical(other.expectedOutput, expectedOutput) || other.expectedOutput == expectedOutput));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,caseId,const DeepCollectionEquality().hash(_args),expectedOutput);

@override
String toString() {
  return 'TestCase(caseId: $caseId, args: $args, expectedOutput: $expectedOutput)';
}


}

/// @nodoc
abstract mixin class _$TestCaseCopyWith<$Res> implements $TestCaseCopyWith<$Res> {
  factory _$TestCaseCopyWith(_TestCase value, $Res Function(_TestCase) _then) = __$TestCaseCopyWithImpl;
@override @useResult
$Res call({
 int caseId, List<dynamic> args, String expectedOutput
});




}
/// @nodoc
class __$TestCaseCopyWithImpl<$Res>
    implements _$TestCaseCopyWith<$Res> {
  __$TestCaseCopyWithImpl(this._self, this._then);

  final _TestCase _self;
  final $Res Function(_TestCase) _then;

/// Create a copy of TestCase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? caseId = null,Object? args = null,Object? expectedOutput = null,}) {
  return _then(_TestCase(
caseId: null == caseId ? _self.caseId : caseId // ignore: cast_nullable_to_non_nullable
as int,args: null == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<dynamic>,expectedOutput: null == expectedOutput ? _self.expectedOutput : expectedOutput // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProblemTestCases {

 String get problemId; List<TestCase> get testCases; DateTime get updatedAt;
/// Create a copy of ProblemTestCases
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProblemTestCasesCopyWith<ProblemTestCases> get copyWith => _$ProblemTestCasesCopyWithImpl<ProblemTestCases>(this as ProblemTestCases, _$identity);

  /// Serializes this ProblemTestCases to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProblemTestCases&&(identical(other.problemId, problemId) || other.problemId == problemId)&&const DeepCollectionEquality().equals(other.testCases, testCases)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,problemId,const DeepCollectionEquality().hash(testCases),updatedAt);

@override
String toString() {
  return 'ProblemTestCases(problemId: $problemId, testCases: $testCases, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ProblemTestCasesCopyWith<$Res>  {
  factory $ProblemTestCasesCopyWith(ProblemTestCases value, $Res Function(ProblemTestCases) _then) = _$ProblemTestCasesCopyWithImpl;
@useResult
$Res call({
 String problemId, List<TestCase> testCases, DateTime updatedAt
});




}
/// @nodoc
class _$ProblemTestCasesCopyWithImpl<$Res>
    implements $ProblemTestCasesCopyWith<$Res> {
  _$ProblemTestCasesCopyWithImpl(this._self, this._then);

  final ProblemTestCases _self;
  final $Res Function(ProblemTestCases) _then;

/// Create a copy of ProblemTestCases
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? problemId = null,Object? testCases = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
problemId: null == problemId ? _self.problemId : problemId // ignore: cast_nullable_to_non_nullable
as String,testCases: null == testCases ? _self.testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<TestCase>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ProblemTestCases].
extension ProblemTestCasesPatterns on ProblemTestCases {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProblemTestCases value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProblemTestCases() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProblemTestCases value)  $default,){
final _that = this;
switch (_that) {
case _ProblemTestCases():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProblemTestCases value)?  $default,){
final _that = this;
switch (_that) {
case _ProblemTestCases() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String problemId,  List<TestCase> testCases,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProblemTestCases() when $default != null:
return $default(_that.problemId,_that.testCases,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String problemId,  List<TestCase> testCases,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ProblemTestCases():
return $default(_that.problemId,_that.testCases,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String problemId,  List<TestCase> testCases,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ProblemTestCases() when $default != null:
return $default(_that.problemId,_that.testCases,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProblemTestCases implements ProblemTestCases {
  const _ProblemTestCases({required this.problemId, required final  List<TestCase> testCases, required this.updatedAt}): _testCases = testCases;
  factory _ProblemTestCases.fromJson(Map<String, dynamic> json) => _$ProblemTestCasesFromJson(json);

@override final  String problemId;
 final  List<TestCase> _testCases;
@override List<TestCase> get testCases {
  if (_testCases is EqualUnmodifiableListView) return _testCases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testCases);
}

@override final  DateTime updatedAt;

/// Create a copy of ProblemTestCases
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProblemTestCasesCopyWith<_ProblemTestCases> get copyWith => __$ProblemTestCasesCopyWithImpl<_ProblemTestCases>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProblemTestCasesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProblemTestCases&&(identical(other.problemId, problemId) || other.problemId == problemId)&&const DeepCollectionEquality().equals(other._testCases, _testCases)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,problemId,const DeepCollectionEquality().hash(_testCases),updatedAt);

@override
String toString() {
  return 'ProblemTestCases(problemId: $problemId, testCases: $testCases, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ProblemTestCasesCopyWith<$Res> implements $ProblemTestCasesCopyWith<$Res> {
  factory _$ProblemTestCasesCopyWith(_ProblemTestCases value, $Res Function(_ProblemTestCases) _then) = __$ProblemTestCasesCopyWithImpl;
@override @useResult
$Res call({
 String problemId, List<TestCase> testCases, DateTime updatedAt
});




}
/// @nodoc
class __$ProblemTestCasesCopyWithImpl<$Res>
    implements _$ProblemTestCasesCopyWith<$Res> {
  __$ProblemTestCasesCopyWithImpl(this._self, this._then);

  final _ProblemTestCases _self;
  final $Res Function(_ProblemTestCases) _then;

/// Create a copy of ProblemTestCases
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? problemId = null,Object? testCases = null,Object? updatedAt = null,}) {
  return _then(_ProblemTestCases(
problemId: null == problemId ? _self.problemId : problemId // ignore: cast_nullable_to_non_nullable
as String,testCases: null == testCases ? _self._testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<TestCase>,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
