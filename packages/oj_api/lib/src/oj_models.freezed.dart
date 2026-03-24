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

 int get caseId; List<dynamic> get args; List<String> get argTypes; dynamic get expectedOutput; String get expectedOutputType;
/// Create a copy of TestCase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestCaseCopyWith<TestCase> get copyWith => _$TestCaseCopyWithImpl<TestCase>(this as TestCase, _$identity);

  /// Serializes this TestCase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestCase&&(identical(other.caseId, caseId) || other.caseId == caseId)&&const DeepCollectionEquality().equals(other.args, args)&&const DeepCollectionEquality().equals(other.argTypes, argTypes)&&const DeepCollectionEquality().equals(other.expectedOutput, expectedOutput)&&(identical(other.expectedOutputType, expectedOutputType) || other.expectedOutputType == expectedOutputType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,caseId,const DeepCollectionEquality().hash(args),const DeepCollectionEquality().hash(argTypes),const DeepCollectionEquality().hash(expectedOutput),expectedOutputType);

@override
String toString() {
  return 'TestCase(caseId: $caseId, args: $args, argTypes: $argTypes, expectedOutput: $expectedOutput, expectedOutputType: $expectedOutputType)';
}


}

/// @nodoc
abstract mixin class $TestCaseCopyWith<$Res>  {
  factory $TestCaseCopyWith(TestCase value, $Res Function(TestCase) _then) = _$TestCaseCopyWithImpl;
@useResult
$Res call({
 int caseId, List<dynamic> args, List<String> argTypes, dynamic expectedOutput, String expectedOutputType
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
@pragma('vm:prefer-inline') @override $Res call({Object? caseId = null,Object? args = null,Object? argTypes = null,Object? expectedOutput = freezed,Object? expectedOutputType = null,}) {
  return _then(_self.copyWith(
caseId: null == caseId ? _self.caseId : caseId // ignore: cast_nullable_to_non_nullable
as int,args: null == args ? _self.args : args // ignore: cast_nullable_to_non_nullable
as List<dynamic>,argTypes: null == argTypes ? _self.argTypes : argTypes // ignore: cast_nullable_to_non_nullable
as List<String>,expectedOutput: freezed == expectedOutput ? _self.expectedOutput : expectedOutput // ignore: cast_nullable_to_non_nullable
as dynamic,expectedOutputType: null == expectedOutputType ? _self.expectedOutputType : expectedOutputType // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int caseId,  List<dynamic> args,  List<String> argTypes,  dynamic expectedOutput,  String expectedOutputType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestCase() when $default != null:
return $default(_that.caseId,_that.args,_that.argTypes,_that.expectedOutput,_that.expectedOutputType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int caseId,  List<dynamic> args,  List<String> argTypes,  dynamic expectedOutput,  String expectedOutputType)  $default,) {final _that = this;
switch (_that) {
case _TestCase():
return $default(_that.caseId,_that.args,_that.argTypes,_that.expectedOutput,_that.expectedOutputType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int caseId,  List<dynamic> args,  List<String> argTypes,  dynamic expectedOutput,  String expectedOutputType)?  $default,) {final _that = this;
switch (_that) {
case _TestCase() when $default != null:
return $default(_that.caseId,_that.args,_that.argTypes,_that.expectedOutput,_that.expectedOutputType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestCase implements TestCase {
  const _TestCase({required this.caseId, required final  List<dynamic> args, required final  List<String> argTypes, required this.expectedOutput, required this.expectedOutputType}): _args = args,_argTypes = argTypes;
  factory _TestCase.fromJson(Map<String, dynamic> json) => _$TestCaseFromJson(json);

@override final  int caseId;
 final  List<dynamic> _args;
@override List<dynamic> get args {
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_args);
}

 final  List<String> _argTypes;
@override List<String> get argTypes {
  if (_argTypes is EqualUnmodifiableListView) return _argTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_argTypes);
}

@override final  dynamic expectedOutput;
@override final  String expectedOutputType;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestCase&&(identical(other.caseId, caseId) || other.caseId == caseId)&&const DeepCollectionEquality().equals(other._args, _args)&&const DeepCollectionEquality().equals(other._argTypes, _argTypes)&&const DeepCollectionEquality().equals(other.expectedOutput, expectedOutput)&&(identical(other.expectedOutputType, expectedOutputType) || other.expectedOutputType == expectedOutputType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,caseId,const DeepCollectionEquality().hash(_args),const DeepCollectionEquality().hash(_argTypes),const DeepCollectionEquality().hash(expectedOutput),expectedOutputType);

@override
String toString() {
  return 'TestCase(caseId: $caseId, args: $args, argTypes: $argTypes, expectedOutput: $expectedOutput, expectedOutputType: $expectedOutputType)';
}


}

/// @nodoc
abstract mixin class _$TestCaseCopyWith<$Res> implements $TestCaseCopyWith<$Res> {
  factory _$TestCaseCopyWith(_TestCase value, $Res Function(_TestCase) _then) = __$TestCaseCopyWithImpl;
@override @useResult
$Res call({
 int caseId, List<dynamic> args, List<String> argTypes, dynamic expectedOutput, String expectedOutputType
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
@override @pragma('vm:prefer-inline') $Res call({Object? caseId = null,Object? args = null,Object? argTypes = null,Object? expectedOutput = freezed,Object? expectedOutputType = null,}) {
  return _then(_TestCase(
caseId: null == caseId ? _self.caseId : caseId // ignore: cast_nullable_to_non_nullable
as int,args: null == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<dynamic>,argTypes: null == argTypes ? _self._argTypes : argTypes // ignore: cast_nullable_to_non_nullable
as List<String>,expectedOutput: freezed == expectedOutput ? _self.expectedOutput : expectedOutput // ignore: cast_nullable_to_non_nullable
as dynamic,expectedOutputType: null == expectedOutputType ? _self.expectedOutputType : expectedOutputType // ignore: cast_nullable_to_non_nullable
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


/// @nodoc
mixin _$SubmissionTestCase {

 int get caseId; String get status; double get timeMs; double get memoryMb; dynamic get output; String? get error;
/// Create a copy of SubmissionTestCase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionTestCaseCopyWith<SubmissionTestCase> get copyWith => _$SubmissionTestCaseCopyWithImpl<SubmissionTestCase>(this as SubmissionTestCase, _$identity);

  /// Serializes this SubmissionTestCase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionTestCase&&(identical(other.caseId, caseId) || other.caseId == caseId)&&(identical(other.status, status) || other.status == status)&&(identical(other.timeMs, timeMs) || other.timeMs == timeMs)&&(identical(other.memoryMb, memoryMb) || other.memoryMb == memoryMb)&&const DeepCollectionEquality().equals(other.output, output)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,caseId,status,timeMs,memoryMb,const DeepCollectionEquality().hash(output),error);

@override
String toString() {
  return 'SubmissionTestCase(caseId: $caseId, status: $status, timeMs: $timeMs, memoryMb: $memoryMb, output: $output, error: $error)';
}


}

/// @nodoc
abstract mixin class $SubmissionTestCaseCopyWith<$Res>  {
  factory $SubmissionTestCaseCopyWith(SubmissionTestCase value, $Res Function(SubmissionTestCase) _then) = _$SubmissionTestCaseCopyWithImpl;
@useResult
$Res call({
 int caseId, String status, double timeMs, double memoryMb, dynamic output, String? error
});




}
/// @nodoc
class _$SubmissionTestCaseCopyWithImpl<$Res>
    implements $SubmissionTestCaseCopyWith<$Res> {
  _$SubmissionTestCaseCopyWithImpl(this._self, this._then);

  final SubmissionTestCase _self;
  final $Res Function(SubmissionTestCase) _then;

/// Create a copy of SubmissionTestCase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? caseId = null,Object? status = null,Object? timeMs = null,Object? memoryMb = null,Object? output = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
caseId: null == caseId ? _self.caseId : caseId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,timeMs: null == timeMs ? _self.timeMs : timeMs // ignore: cast_nullable_to_non_nullable
as double,memoryMb: null == memoryMb ? _self.memoryMb : memoryMb // ignore: cast_nullable_to_non_nullable
as double,output: freezed == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as dynamic,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionTestCase].
extension SubmissionTestCasePatterns on SubmissionTestCase {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionTestCase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionTestCase() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionTestCase value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionTestCase():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionTestCase value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionTestCase() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int caseId,  String status,  double timeMs,  double memoryMb,  dynamic output,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionTestCase() when $default != null:
return $default(_that.caseId,_that.status,_that.timeMs,_that.memoryMb,_that.output,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int caseId,  String status,  double timeMs,  double memoryMb,  dynamic output,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SubmissionTestCase():
return $default(_that.caseId,_that.status,_that.timeMs,_that.memoryMb,_that.output,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int caseId,  String status,  double timeMs,  double memoryMb,  dynamic output,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionTestCase() when $default != null:
return $default(_that.caseId,_that.status,_that.timeMs,_that.memoryMb,_that.output,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionTestCase implements SubmissionTestCase {
  const _SubmissionTestCase({required this.caseId, required this.status, required this.timeMs, required this.memoryMb, required this.output, required this.error});
  factory _SubmissionTestCase.fromJson(Map<String, dynamic> json) => _$SubmissionTestCaseFromJson(json);

@override final  int caseId;
@override final  String status;
@override final  double timeMs;
@override final  double memoryMb;
@override final  dynamic output;
@override final  String? error;

/// Create a copy of SubmissionTestCase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionTestCaseCopyWith<_SubmissionTestCase> get copyWith => __$SubmissionTestCaseCopyWithImpl<_SubmissionTestCase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionTestCaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionTestCase&&(identical(other.caseId, caseId) || other.caseId == caseId)&&(identical(other.status, status) || other.status == status)&&(identical(other.timeMs, timeMs) || other.timeMs == timeMs)&&(identical(other.memoryMb, memoryMb) || other.memoryMb == memoryMb)&&const DeepCollectionEquality().equals(other.output, output)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,caseId,status,timeMs,memoryMb,const DeepCollectionEquality().hash(output),error);

@override
String toString() {
  return 'SubmissionTestCase(caseId: $caseId, status: $status, timeMs: $timeMs, memoryMb: $memoryMb, output: $output, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SubmissionTestCaseCopyWith<$Res> implements $SubmissionTestCaseCopyWith<$Res> {
  factory _$SubmissionTestCaseCopyWith(_SubmissionTestCase value, $Res Function(_SubmissionTestCase) _then) = __$SubmissionTestCaseCopyWithImpl;
@override @useResult
$Res call({
 int caseId, String status, double timeMs, double memoryMb, dynamic output, String? error
});




}
/// @nodoc
class __$SubmissionTestCaseCopyWithImpl<$Res>
    implements _$SubmissionTestCaseCopyWith<$Res> {
  __$SubmissionTestCaseCopyWithImpl(this._self, this._then);

  final _SubmissionTestCase _self;
  final $Res Function(_SubmissionTestCase) _then;

/// Create a copy of SubmissionTestCase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? caseId = null,Object? status = null,Object? timeMs = null,Object? memoryMb = null,Object? output = freezed,Object? error = freezed,}) {
  return _then(_SubmissionTestCase(
caseId: null == caseId ? _self.caseId : caseId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,timeMs: null == timeMs ? _self.timeMs : timeMs // ignore: cast_nullable_to_non_nullable
as double,memoryMb: null == memoryMb ? _self.memoryMb : memoryMb // ignore: cast_nullable_to_non_nullable
as double,output: freezed == output ? _self.output : output // ignore: cast_nullable_to_non_nullable
as dynamic,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Submission {

 String get submissionId; String get submitterId; String get submitterPublicCode; String get problemId; String get language; String get code; String get status; List<SubmissionTestCase> get testCases; DateTime get createdAt; DateTime? get completedAt;
/// Create a copy of Submission
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionCopyWith<Submission> get copyWith => _$SubmissionCopyWithImpl<Submission>(this as Submission, _$identity);

  /// Serializes this Submission to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Submission&&(identical(other.submissionId, submissionId) || other.submissionId == submissionId)&&(identical(other.submitterId, submitterId) || other.submitterId == submitterId)&&(identical(other.submitterPublicCode, submitterPublicCode) || other.submitterPublicCode == submitterPublicCode)&&(identical(other.problemId, problemId) || other.problemId == problemId)&&(identical(other.language, language) || other.language == language)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.testCases, testCases)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,submissionId,submitterId,submitterPublicCode,problemId,language,code,status,const DeepCollectionEquality().hash(testCases),createdAt,completedAt);

@override
String toString() {
  return 'Submission(submissionId: $submissionId, submitterId: $submitterId, submitterPublicCode: $submitterPublicCode, problemId: $problemId, language: $language, code: $code, status: $status, testCases: $testCases, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $SubmissionCopyWith<$Res>  {
  factory $SubmissionCopyWith(Submission value, $Res Function(Submission) _then) = _$SubmissionCopyWithImpl;
@useResult
$Res call({
 String submissionId, String submitterId, String submitterPublicCode, String problemId, String language, String code, String status, List<SubmissionTestCase> testCases, DateTime createdAt, DateTime? completedAt
});




}
/// @nodoc
class _$SubmissionCopyWithImpl<$Res>
    implements $SubmissionCopyWith<$Res> {
  _$SubmissionCopyWithImpl(this._self, this._then);

  final Submission _self;
  final $Res Function(Submission) _then;

/// Create a copy of Submission
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submissionId = null,Object? submitterId = null,Object? submitterPublicCode = null,Object? problemId = null,Object? language = null,Object? code = null,Object? status = null,Object? testCases = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
submissionId: null == submissionId ? _self.submissionId : submissionId // ignore: cast_nullable_to_non_nullable
as String,submitterId: null == submitterId ? _self.submitterId : submitterId // ignore: cast_nullable_to_non_nullable
as String,submitterPublicCode: null == submitterPublicCode ? _self.submitterPublicCode : submitterPublicCode // ignore: cast_nullable_to_non_nullable
as String,problemId: null == problemId ? _self.problemId : problemId // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,testCases: null == testCases ? _self.testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<SubmissionTestCase>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Submission].
extension SubmissionPatterns on Submission {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Submission value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Submission() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Submission value)  $default,){
final _that = this;
switch (_that) {
case _Submission():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Submission value)?  $default,){
final _that = this;
switch (_that) {
case _Submission() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String submissionId,  String submitterId,  String submitterPublicCode,  String problemId,  String language,  String code,  String status,  List<SubmissionTestCase> testCases,  DateTime createdAt,  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Submission() when $default != null:
return $default(_that.submissionId,_that.submitterId,_that.submitterPublicCode,_that.problemId,_that.language,_that.code,_that.status,_that.testCases,_that.createdAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String submissionId,  String submitterId,  String submitterPublicCode,  String problemId,  String language,  String code,  String status,  List<SubmissionTestCase> testCases,  DateTime createdAt,  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _Submission():
return $default(_that.submissionId,_that.submitterId,_that.submitterPublicCode,_that.problemId,_that.language,_that.code,_that.status,_that.testCases,_that.createdAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String submissionId,  String submitterId,  String submitterPublicCode,  String problemId,  String language,  String code,  String status,  List<SubmissionTestCase> testCases,  DateTime createdAt,  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _Submission() when $default != null:
return $default(_that.submissionId,_that.submitterId,_that.submitterPublicCode,_that.problemId,_that.language,_that.code,_that.status,_that.testCases,_that.createdAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Submission implements Submission {
  const _Submission({required this.submissionId, required this.submitterId, required this.submitterPublicCode, required this.problemId, required this.language, required this.code, required this.status, required final  List<SubmissionTestCase> testCases, required this.createdAt, required this.completedAt}): _testCases = testCases;
  factory _Submission.fromJson(Map<String, dynamic> json) => _$SubmissionFromJson(json);

@override final  String submissionId;
@override final  String submitterId;
@override final  String submitterPublicCode;
@override final  String problemId;
@override final  String language;
@override final  String code;
@override final  String status;
 final  List<SubmissionTestCase> _testCases;
@override List<SubmissionTestCase> get testCases {
  if (_testCases is EqualUnmodifiableListView) return _testCases;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_testCases);
}

@override final  DateTime createdAt;
@override final  DateTime? completedAt;

/// Create a copy of Submission
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionCopyWith<_Submission> get copyWith => __$SubmissionCopyWithImpl<_Submission>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submission&&(identical(other.submissionId, submissionId) || other.submissionId == submissionId)&&(identical(other.submitterId, submitterId) || other.submitterId == submitterId)&&(identical(other.submitterPublicCode, submitterPublicCode) || other.submitterPublicCode == submitterPublicCode)&&(identical(other.problemId, problemId) || other.problemId == problemId)&&(identical(other.language, language) || other.language == language)&&(identical(other.code, code) || other.code == code)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._testCases, _testCases)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,submissionId,submitterId,submitterPublicCode,problemId,language,code,status,const DeepCollectionEquality().hash(_testCases),createdAt,completedAt);

@override
String toString() {
  return 'Submission(submissionId: $submissionId, submitterId: $submitterId, submitterPublicCode: $submitterPublicCode, problemId: $problemId, language: $language, code: $code, status: $status, testCases: $testCases, createdAt: $createdAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$SubmissionCopyWith<$Res> implements $SubmissionCopyWith<$Res> {
  factory _$SubmissionCopyWith(_Submission value, $Res Function(_Submission) _then) = __$SubmissionCopyWithImpl;
@override @useResult
$Res call({
 String submissionId, String submitterId, String submitterPublicCode, String problemId, String language, String code, String status, List<SubmissionTestCase> testCases, DateTime createdAt, DateTime? completedAt
});




}
/// @nodoc
class __$SubmissionCopyWithImpl<$Res>
    implements _$SubmissionCopyWith<$Res> {
  __$SubmissionCopyWithImpl(this._self, this._then);

  final _Submission _self;
  final $Res Function(_Submission) _then;

/// Create a copy of Submission
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submissionId = null,Object? submitterId = null,Object? submitterPublicCode = null,Object? problemId = null,Object? language = null,Object? code = null,Object? status = null,Object? testCases = null,Object? createdAt = null,Object? completedAt = freezed,}) {
  return _then(_Submission(
submissionId: null == submissionId ? _self.submissionId : submissionId // ignore: cast_nullable_to_non_nullable
as String,submitterId: null == submitterId ? _self.submitterId : submitterId // ignore: cast_nullable_to_non_nullable
as String,submitterPublicCode: null == submitterPublicCode ? _self.submitterPublicCode : submitterPublicCode // ignore: cast_nullable_to_non_nullable
as String,problemId: null == problemId ? _self.problemId : problemId // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,testCases: null == testCases ? _self._testCases : testCases // ignore: cast_nullable_to_non_nullable
as List<SubmissionTestCase>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
