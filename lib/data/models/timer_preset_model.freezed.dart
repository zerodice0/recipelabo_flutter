// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_preset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerPresetModel {

 String get id; String get name; int get durationMinutes; int get durationSeconds; String? get description; String? get icon; String get createdAt;// ISO string format
 String? get lastUsedAt;// ISO string format
 int get usageCount; bool get isDefault;
/// Create a copy of TimerPresetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerPresetModelCopyWith<TimerPresetModel> get copyWith => _$TimerPresetModelCopyWithImpl<TimerPresetModel>(this as TimerPresetModel, _$identity);

  /// Serializes this TimerPresetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerPresetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,durationMinutes,durationSeconds,description,icon,createdAt,lastUsedAt,usageCount,isDefault);

@override
String toString() {
  return 'TimerPresetModel(id: $id, name: $name, durationMinutes: $durationMinutes, durationSeconds: $durationSeconds, description: $description, icon: $icon, createdAt: $createdAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class $TimerPresetModelCopyWith<$Res>  {
  factory $TimerPresetModelCopyWith(TimerPresetModel value, $Res Function(TimerPresetModel) _then) = _$TimerPresetModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, int durationMinutes, int durationSeconds, String? description, String? icon, String createdAt, String? lastUsedAt, int usageCount, bool isDefault
});




}
/// @nodoc
class _$TimerPresetModelCopyWithImpl<$Res>
    implements $TimerPresetModelCopyWith<$Res> {
  _$TimerPresetModelCopyWithImpl(this._self, this._then);

  final TimerPresetModel _self;
  final $Res Function(TimerPresetModel) _then;

/// Create a copy of TimerPresetModel
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
as String,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as String?,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerPresetModel].
extension TimerPresetModelPatterns on TimerPresetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerPresetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerPresetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerPresetModel value)  $default,){
final _that = this;
switch (_that) {
case _TimerPresetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerPresetModel value)?  $default,){
final _that = this;
switch (_that) {
case _TimerPresetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int durationMinutes,  int durationSeconds,  String? description,  String? icon,  String createdAt,  String? lastUsedAt,  int usageCount,  bool isDefault)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerPresetModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int durationMinutes,  int durationSeconds,  String? description,  String? icon,  String createdAt,  String? lastUsedAt,  int usageCount,  bool isDefault)  $default,) {final _that = this;
switch (_that) {
case _TimerPresetModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int durationMinutes,  int durationSeconds,  String? description,  String? icon,  String createdAt,  String? lastUsedAt,  int usageCount,  bool isDefault)?  $default,) {final _that = this;
switch (_that) {
case _TimerPresetModel() when $default != null:
return $default(_that.id,_that.name,_that.durationMinutes,_that.durationSeconds,_that.description,_that.icon,_that.createdAt,_that.lastUsedAt,_that.usageCount,_that.isDefault);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerPresetModel extends TimerPresetModel {
  const _TimerPresetModel({required this.id, required this.name, required this.durationMinutes, required this.durationSeconds, this.description, this.icon, required this.createdAt, this.lastUsedAt, this.usageCount = 0, this.isDefault = false}): super._();
  factory _TimerPresetModel.fromJson(Map<String, dynamic> json) => _$TimerPresetModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  int durationMinutes;
@override final  int durationSeconds;
@override final  String? description;
@override final  String? icon;
@override final  String createdAt;
// ISO string format
@override final  String? lastUsedAt;
// ISO string format
@override@JsonKey() final  int usageCount;
@override@JsonKey() final  bool isDefault;

/// Create a copy of TimerPresetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerPresetModelCopyWith<_TimerPresetModel> get copyWith => __$TimerPresetModelCopyWithImpl<_TimerPresetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerPresetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerPresetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.durationSeconds, durationSeconds) || other.durationSeconds == durationSeconds)&&(identical(other.description, description) || other.description == description)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUsedAt, lastUsedAt) || other.lastUsedAt == lastUsedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,durationMinutes,durationSeconds,description,icon,createdAt,lastUsedAt,usageCount,isDefault);

@override
String toString() {
  return 'TimerPresetModel(id: $id, name: $name, durationMinutes: $durationMinutes, durationSeconds: $durationSeconds, description: $description, icon: $icon, createdAt: $createdAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, isDefault: $isDefault)';
}


}

/// @nodoc
abstract mixin class _$TimerPresetModelCopyWith<$Res> implements $TimerPresetModelCopyWith<$Res> {
  factory _$TimerPresetModelCopyWith(_TimerPresetModel value, $Res Function(_TimerPresetModel) _then) = __$TimerPresetModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int durationMinutes, int durationSeconds, String? description, String? icon, String createdAt, String? lastUsedAt, int usageCount, bool isDefault
});




}
/// @nodoc
class __$TimerPresetModelCopyWithImpl<$Res>
    implements _$TimerPresetModelCopyWith<$Res> {
  __$TimerPresetModelCopyWithImpl(this._self, this._then);

  final _TimerPresetModel _self;
  final $Res Function(_TimerPresetModel) _then;

/// Create a copy of TimerPresetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? durationMinutes = null,Object? durationSeconds = null,Object? description = freezed,Object? icon = freezed,Object? createdAt = null,Object? lastUsedAt = freezed,Object? usageCount = null,Object? isDefault = null,}) {
  return _then(_TimerPresetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,durationSeconds: null == durationSeconds ? _self.durationSeconds : durationSeconds // ignore: cast_nullable_to_non_nullable
as int,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,lastUsedAt: freezed == lastUsedAt ? _self.lastUsedAt : lastUsedAt // ignore: cast_nullable_to_non_nullable
as String?,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
