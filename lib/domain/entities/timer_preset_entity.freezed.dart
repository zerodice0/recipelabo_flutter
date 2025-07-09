// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_preset_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerPresetEntity {

 String get id; String get name;// 예: "파스타 면 삶기", "달걀 완숙"
 int get durationMinutes;// 분 단위 시간
 int get durationSeconds;// 초 단위 시간 (추가)
 String? get description;// 타이머 설명
 String? get icon;// 아이콘 이름 (예: "pasta", "egg")
 DateTime get createdAt; DateTime? get lastUsedAt;// 마지막 사용 시간
 int get usageCount;// 사용 횟수
 bool get isDefault;
/// Create a copy of TimerPresetEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerPresetEntityCopyWith<TimerPresetEntity> get copyWith => _$TimerPresetEntityCopyWithImpl<TimerPresetEntity>(this as TimerPresetEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerPresetEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,durationMinutes,durationSeconds,description,icon,createdAt,lastUsedAt,usageCount,isDefault);

@override
String toString() {
  return 'TimerPresetEntity(id: $id, name: $name, durationMinutes: $durationMinutes, durationSeconds: $durationSeconds, description: $description, icon: $icon, createdAt: $createdAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $TimerPresetEntityCopyWith<$Res>  {
  factory $TimerPresetEntityCopyWith(TimerPresetEntity value, $Res Function(TimerPresetEntity) _then) = _$TimerPresetEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, int durationMinutes, int durationSeconds, String? description, String? icon, DateTime createdAt, DateTime? lastUsedAt, int usageCount, bool isDefault
});




}
/// @nodoc
class _$TimerPresetEntityCopyWithImpl<$Res>
    implements $TimerPresetEntityCopyWith<$Res> {
  _$TimerPresetEntityCopyWithImpl(this._self, this._then);

  final TimerPresetEntity _self;
  final $Res Function(TimerPresetEntity) _then;

/// Create a copy of TimerPresetEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? durationMinutes = null,Object? durationSeconds = null,Object? description = freezed,Object? icon = freezed,Object? createdAt = null,Object? lastUsedAt = freezed,Object? usageCount = null,Object? isDefault = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerPresetEntity].
extension TimerPresetEntityPatterns on TimerPresetEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerPresetEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerPresetEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerPresetEntity value)  $default,){
final _that = this;
switch (_that) {
case _TimerPresetEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerPresetEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TimerPresetEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int durationMinutes,  int durationSeconds,  String? description,  String? icon,  DateTime createdAt,  DateTime? lastUsedAt,  int usageCount,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerPresetEntity() when $default != null:
return $default(_that.id,_that.name,_that.durationMinutes,_that.durationSeconds,_that.description,_that.icon,_that.createdAt,_that.lastUsedAt,_that.usageCount,_that.isDefault);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int durationMinutes,  int durationSeconds,  String? description,  String? icon,  DateTime createdAt,  DateTime? lastUsedAt,  int usageCount,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _TimerPresetEntity():
return $default(_that.id,_that.name,_that.durationMinutes,_that.durationSeconds,_that.description,_that.icon,_that.createdAt,_that.lastUsedAt,_that.usageCount,_that.isDefault);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int durationMinutes,  int durationSeconds,  String? description,  String? icon,  DateTime createdAt,  DateTime? lastUsedAt,  int usageCount,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _TimerPresetEntity() when $default != null:
return $default(_that.id,_that.name,_that.durationMinutes,_that.durationSeconds,_that.description,_that.icon,_that.createdAt,_that.lastUsedAt,_that.usageCount,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc


class _TimerPresetEntity extends TimerPresetEntity {
  const _TimerPresetEntity({required this.id, required this.name, required this.durationMinutes, required this.durationSeconds, this.description, this.icon, required this.createdAt, this.lastUsedAt, this.usageCount = 0, this.isDefault = false}): super._();
  

@override final  String id;
@override final  String name;
// 예: "파스타 면 삶기", "달걀 완숙"
@override final  int durationMinutes;
// 분 단위 시간
@override final  int durationSeconds;
// 초 단위 시간 (추가)
@override final  String? description;
// 타이머 설명
@override final  String? icon;
// 아이콘 이름 (예: "pasta", "egg")
@override final  DateTime createdAt;
@override final  DateTime? lastUsedAt;
// 마지막 사용 시간
@override@JsonKey() final  int usageCount;
// 사용 횟수
@override@JsonKey() final  bool isDefault;

/// Create a copy of TimerPresetEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerPresetEntityCopyWith<_TimerPresetEntity> get copyWith => __$TimerPresetEntityCopyWithImpl<_TimerPresetEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerPresetEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,durationMinutes,durationSeconds,description,icon,createdAt,lastUsedAt,usageCount,isDefault);

@override
String toString() {
  return 'TimerPresetEntity(id: $id, name: $name, durationMinutes: $durationMinutes, durationSeconds: $durationSeconds, description: $description, icon: $icon, createdAt: $createdAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$TimerPresetEntityCopyWith<$Res> implements $TimerPresetEntityCopyWith<$Res> {
  factory _$TimerPresetEntityCopyWith(_TimerPresetEntity value, $Res Function(_TimerPresetEntity) _then) = __$TimerPresetEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int durationMinutes, int durationSeconds, String? description, String? icon, DateTime createdAt, DateTime? lastUsedAt, int usageCount, bool isDefault
});




}
/// @nodoc
class __$TimerPresetEntityCopyWithImpl<$Res>
    implements _$TimerPresetEntityCopyWith<$Res> {
  __$TimerPresetEntityCopyWithImpl(this._self, this._then);

  final _TimerPresetEntity _self;
  final $Res Function(_TimerPresetEntity) _then;

/// Create a copy of TimerPresetEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? durationMinutes = null,Object? durationSeconds = null,Object? description = freezed,Object? icon = freezed,Object? createdAt = null,Object? lastUsedAt = freezed,Object? usageCount = null,Object? isDefault = null,}) {
  return _then(_TimerPresetEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
