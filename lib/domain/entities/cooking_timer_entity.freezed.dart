// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_timer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CookingTimerEntity {

 String get id; String get name;// 타이머 이름
 int get totalSeconds;// 전체 시간 (초)
 int get remainingSeconds;// 남은 시간 (초)
 DateTime get startTime;// 시작 시간
 DateTime? get endTime;// 종료 시간 (계산된 값)
 TimerStatus get status; String? get description; String? get icon; String? get recipeId;// 연결된 레시피 ID (선택사항)
 String? get stepId;
/// Create a copy of CookingTimerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookingTimerEntityCopyWith<CookingTimerEntity> get copyWith => _$CookingTimerEntityCopyWithImpl<CookingTimerEntity>(this as CookingTimerEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookingTimerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.totalSeconds, totalSeconds) || other.totalSeconds == totalSeconds)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.stepId, stepId) || other.stepId == stepId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,totalSeconds,remainingSeconds,startTime,endTime,status,description,icon,recipeId,stepId);

@override
String toString() {
  return 'CookingTimerEntity(id: $id, name: $name, totalSeconds: $totalSeconds, remainingSeconds: $remainingSeconds, startTime: $startTime, endTime: $endTime, status: $status, description: $description, icon: $icon, recipeId: $recipeId, stepId: $stepId)';
}


}

/// @nodoc
abstract mixin class $CookingTimerEntityCopyWith<$Res>  {
  factory $CookingTimerEntityCopyWith(CookingTimerEntity value, $Res Function(CookingTimerEntity) _then) = _$CookingTimerEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, int totalSeconds, int remainingSeconds, DateTime startTime, DateTime? endTime, TimerStatus status, String? description, String? icon, String? recipeId, String? stepId
});




}
/// @nodoc
class _$CookingTimerEntityCopyWithImpl<$Res>
    implements $CookingTimerEntityCopyWith<$Res> {
  _$CookingTimerEntityCopyWithImpl(this._self, this._then);

  final CookingTimerEntity _self;
  final $Res Function(CookingTimerEntity) _then;

/// Create a copy of CookingTimerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? totalSeconds = null,Object? remainingSeconds = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? description = freezed,Object? icon = freezed,Object? recipeId = freezed,Object? stepId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,totalSeconds: null == totalSeconds ? _self.totalSeconds : totalSeconds // ignore: cast_nullable_to_non_nullable
as int,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TimerStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,stepId: freezed == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CookingTimerEntity].
extension CookingTimerEntityPatterns on CookingTimerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CookingTimerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CookingTimerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CookingTimerEntity value)  $default,){
final _that = this;
switch (_that) {
case _CookingTimerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CookingTimerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CookingTimerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int totalSeconds,  int remainingSeconds,  DateTime startTime,  DateTime? endTime,  TimerStatus status,  String? description,  String? icon,  String? recipeId,  String? stepId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CookingTimerEntity() when $default != null:
return $default(_that.id,_that.name,_that.totalSeconds,_that.remainingSeconds,_that.startTime,_that.endTime,_that.status,_that.description,_that.icon,_that.recipeId,_that.stepId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int totalSeconds,  int remainingSeconds,  DateTime startTime,  DateTime? endTime,  TimerStatus status,  String? description,  String? icon,  String? recipeId,  String? stepId)  $default,) {final _that = this;
switch (_that) {
case _CookingTimerEntity():
return $default(_that.id,_that.name,_that.totalSeconds,_that.remainingSeconds,_that.startTime,_that.endTime,_that.status,_that.description,_that.icon,_that.recipeId,_that.stepId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int totalSeconds,  int remainingSeconds,  DateTime startTime,  DateTime? endTime,  TimerStatus status,  String? description,  String? icon,  String? recipeId,  String? stepId)?  $default,) {final _that = this;
switch (_that) {
case _CookingTimerEntity() when $default != null:
return $default(_that.id,_that.name,_that.totalSeconds,_that.remainingSeconds,_that.startTime,_that.endTime,_that.status,_that.description,_that.icon,_that.recipeId,_that.stepId);case _:
  return null;

}
}

}

/// @nodoc


class _CookingTimerEntity extends CookingTimerEntity {
  const _CookingTimerEntity({required this.id, required this.name, required this.totalSeconds, required this.remainingSeconds, required this.startTime, this.endTime, required this.status, this.description, this.icon, this.recipeId, this.stepId}): super._();
  

@override final  String id;
@override final  String name;
// 타이머 이름
@override final  int totalSeconds;
// 전체 시간 (초)
@override final  int remainingSeconds;
// 남은 시간 (초)
@override final  DateTime startTime;
// 시작 시간
@override final  DateTime? endTime;
// 종료 시간 (계산된 값)
@override final  TimerStatus status;
@override final  String? description;
@override final  String? icon;
@override final  String? recipeId;
// 연결된 레시피 ID (선택사항)
@override final  String? stepId;

/// Create a copy of CookingTimerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookingTimerEntityCopyWith<_CookingTimerEntity> get copyWith => __$CookingTimerEntityCopyWithImpl<_CookingTimerEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookingTimerEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.totalSeconds, totalSeconds) || other.totalSeconds == totalSeconds)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.stepId, stepId) || other.stepId == stepId));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,totalSeconds,remainingSeconds,startTime,endTime,status,description,icon,recipeId,stepId);

@override
String toString() {
  return 'CookingTimerEntity(id: $id, name: $name, totalSeconds: $totalSeconds, remainingSeconds: $remainingSeconds, startTime: $startTime, endTime: $endTime, status: $status, description: $description, icon: $icon, recipeId: $recipeId, stepId: $stepId)';
}


}

/// @nodoc
abstract mixin class _$CookingTimerEntityCopyWith<$Res> implements $CookingTimerEntityCopyWith<$Res> {
  factory _$CookingTimerEntityCopyWith(_CookingTimerEntity value, $Res Function(_CookingTimerEntity) _then) = __$CookingTimerEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int totalSeconds, int remainingSeconds, DateTime startTime, DateTime? endTime, TimerStatus status, String? description, String? icon, String? recipeId, String? stepId
});




}
/// @nodoc
class __$CookingTimerEntityCopyWithImpl<$Res>
    implements _$CookingTimerEntityCopyWith<$Res> {
  __$CookingTimerEntityCopyWithImpl(this._self, this._then);

  final _CookingTimerEntity _self;
  final $Res Function(_CookingTimerEntity) _then;

/// Create a copy of CookingTimerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? totalSeconds = null,Object? remainingSeconds = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,Object? description = freezed,Object? icon = freezed,Object? recipeId = freezed,Object? stepId = freezed,}) {
  return _then(_CookingTimerEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,totalSeconds: null == totalSeconds ? _self.totalSeconds : totalSeconds // ignore: cast_nullable_to_non_nullable
as int,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TimerStatus,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,stepId: freezed == stepId ? _self.stepId : stepId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
