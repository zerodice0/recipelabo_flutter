// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StepEntity {

 String get id; String? get recipeVersionId; int get stepNumber; String get description; String? get imageUrl; int? get timerMinutes;// 타이머 시간 (분)
 int? get timerSeconds;// 타이머 시간 (초)
 String? get timerName;
/// Create a copy of StepEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepEntityCopyWith<StepEntity> get copyWith => _$StepEntityCopyWithImpl<StepEntity>(this as StepEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.timerMinutes, timerMinutes) || other.timerMinutes == timerMinutes)&&(identical(other.timerSeconds, timerSeconds) || other.timerSeconds == timerSeconds)&&(identical(other.timerName, timerName) || other.timerName == timerName));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,stepNumber,description,imageUrl,timerMinutes,timerSeconds,timerName);

@override
String toString() {
  return 'StepEntity(id: $id, recipeVersionId: $recipeVersionId, stepNumber: $stepNumber, description: $description, imageUrl: $imageUrl, timerMinutes: $timerMinutes, timerSeconds: $timerSeconds, timerName: $timerName)';
}


}

/// @nodoc
abstract mixin class $StepEntityCopyWith<$Res>  {
  factory $StepEntityCopyWith(StepEntity value, $Res Function(StepEntity) _then) = _$StepEntityCopyWithImpl;
@useResult
$Res call({
 String id, String? recipeVersionId, int stepNumber, String description, String? imageUrl, int? timerMinutes, int? timerSeconds, String? timerName
});




}
/// @nodoc
class _$StepEntityCopyWithImpl<$Res>
    implements $StepEntityCopyWith<$Res> {
  _$StepEntityCopyWithImpl(this._self, this._then);

  final StepEntity _self;
  final $Res Function(StepEntity) _then;

/// Create a copy of StepEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeVersionId = freezed,Object? stepNumber = null,Object? description = null,Object? imageUrl = freezed,Object? timerMinutes = freezed,Object? timerSeconds = freezed,Object? timerName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,timerMinutes: freezed == timerMinutes ? _self.timerMinutes : timerMinutes // ignore: cast_nullable_to_non_nullable
as int?,timerSeconds: freezed == timerSeconds ? _self.timerSeconds : timerSeconds // ignore: cast_nullable_to_non_nullable
as int?,timerName: freezed == timerName ? _self.timerName : timerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StepEntity].
extension StepEntityPatterns on StepEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepEntity value)  $default,){
final _that = this;
switch (_that) {
case _StepEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StepEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? recipeVersionId,  int stepNumber,  String description,  String? imageUrl,  int? timerMinutes,  int? timerSeconds,  String? timerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepEntity() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.stepNumber,_that.description,_that.imageUrl,_that.timerMinutes,_that.timerSeconds,_that.timerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? recipeVersionId,  int stepNumber,  String description,  String? imageUrl,  int? timerMinutes,  int? timerSeconds,  String? timerName)  $default,) {final _that = this;
switch (_that) {
case _StepEntity():
return $default(_that.id,_that.recipeVersionId,_that.stepNumber,_that.description,_that.imageUrl,_that.timerMinutes,_that.timerSeconds,_that.timerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? recipeVersionId,  int stepNumber,  String description,  String? imageUrl,  int? timerMinutes,  int? timerSeconds,  String? timerName)?  $default,) {final _that = this;
switch (_that) {
case _StepEntity() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.stepNumber,_that.description,_that.imageUrl,_that.timerMinutes,_that.timerSeconds,_that.timerName);case _:
  return null;

}
}

}

/// @nodoc


class _StepEntity implements StepEntity {
  const _StepEntity({required this.id, this.recipeVersionId, required this.stepNumber, required this.description, this.imageUrl, this.timerMinutes, this.timerSeconds, this.timerName});
  

@override final  String id;
@override final  String? recipeVersionId;
@override final  int stepNumber;
@override final  String description;
@override final  String? imageUrl;
@override final  int? timerMinutes;
// 타이머 시간 (분)
@override final  int? timerSeconds;
// 타이머 시간 (초)
@override final  String? timerName;

/// Create a copy of StepEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepEntityCopyWith<_StepEntity> get copyWith => __$StepEntityCopyWithImpl<_StepEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.timerMinutes, timerMinutes) || other.timerMinutes == timerMinutes)&&(identical(other.timerSeconds, timerSeconds) || other.timerSeconds == timerSeconds)&&(identical(other.timerName, timerName) || other.timerName == timerName));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,stepNumber,description,imageUrl,timerMinutes,timerSeconds,timerName);

@override
String toString() {
  return 'StepEntity(id: $id, recipeVersionId: $recipeVersionId, stepNumber: $stepNumber, description: $description, imageUrl: $imageUrl, timerMinutes: $timerMinutes, timerSeconds: $timerSeconds, timerName: $timerName)';
}


}

/// @nodoc
abstract mixin class _$StepEntityCopyWith<$Res> implements $StepEntityCopyWith<$Res> {
  factory _$StepEntityCopyWith(_StepEntity value, $Res Function(_StepEntity) _then) = __$StepEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? recipeVersionId, int stepNumber, String description, String? imageUrl, int? timerMinutes, int? timerSeconds, String? timerName
});




}
/// @nodoc
class __$StepEntityCopyWithImpl<$Res>
    implements _$StepEntityCopyWith<$Res> {
  __$StepEntityCopyWithImpl(this._self, this._then);

  final _StepEntity _self;
  final $Res Function(_StepEntity) _then;

/// Create a copy of StepEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeVersionId = freezed,Object? stepNumber = null,Object? description = null,Object? imageUrl = freezed,Object? timerMinutes = freezed,Object? timerSeconds = freezed,Object? timerName = freezed,}) {
  return _then(_StepEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,timerMinutes: freezed == timerMinutes ? _self.timerMinutes : timerMinutes // ignore: cast_nullable_to_non_nullable
as int?,timerSeconds: freezed == timerSeconds ? _self.timerSeconds : timerSeconds // ignore: cast_nullable_to_non_nullable
as int?,timerName: freezed == timerName ? _self.timerName : timerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
