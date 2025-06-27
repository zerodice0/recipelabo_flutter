// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_preset_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

TimerPresetModel _$TimerPresetModelFromJson(Map<String, dynamic> json) {
  return _TimerPresetModel.fromJson(json);
}

/// @nodoc
mixin _$TimerPresetModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get durationMinutes => throw _privateConstructorUsedError;
  int get durationSeconds => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String get createdAt =>
      throw _privateConstructorUsedError; // ISO string format
  String? get lastUsedAt =>
      throw _privateConstructorUsedError; // ISO string format
  int get usageCount => throw _privateConstructorUsedError;
  bool get isDefault => throw _privateConstructorUsedError;

  /// Serializes this TimerPresetModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimerPresetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerPresetModelCopyWith<TimerPresetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerPresetModelCopyWith<$Res> {
  factory $TimerPresetModelCopyWith(
    TimerPresetModel value,
    $Res Function(TimerPresetModel) then,
  ) = _$TimerPresetModelCopyWithImpl<$Res, TimerPresetModel>;
  @useResult
  $Res call({
    String id,
    String name,
    int durationMinutes,
    int durationSeconds,
    String? description,
    String? icon,
    String createdAt,
    String? lastUsedAt,
    int usageCount,
    bool isDefault,
  });
}

/// @nodoc
class _$TimerPresetModelCopyWithImpl<$Res, $Val extends TimerPresetModel>
    implements $TimerPresetModelCopyWith<$Res> {
  _$TimerPresetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerPresetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? durationMinutes = null,
    Object? durationSeconds = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
    Object? usageCount = null,
    Object? isDefault = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            durationMinutes:
                null == durationMinutes
                    ? _value.durationMinutes
                    : durationMinutes // ignore: cast_nullable_to_non_nullable
                        as int,
            durationSeconds:
                null == durationSeconds
                    ? _value.durationSeconds
                    : durationSeconds // ignore: cast_nullable_to_non_nullable
                        as int,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            icon:
                freezed == icon
                    ? _value.icon
                    : icon // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String,
            lastUsedAt:
                freezed == lastUsedAt
                    ? _value.lastUsedAt
                    : lastUsedAt // ignore: cast_nullable_to_non_nullable
                        as String?,
            usageCount:
                null == usageCount
                    ? _value.usageCount
                    : usageCount // ignore: cast_nullable_to_non_nullable
                        as int,
            isDefault:
                null == isDefault
                    ? _value.isDefault
                    : isDefault // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimerPresetModelImplCopyWith<$Res>
    implements $TimerPresetModelCopyWith<$Res> {
  factory _$$TimerPresetModelImplCopyWith(
    _$TimerPresetModelImpl value,
    $Res Function(_$TimerPresetModelImpl) then,
  ) = __$$TimerPresetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int durationMinutes,
    int durationSeconds,
    String? description,
    String? icon,
    String createdAt,
    String? lastUsedAt,
    int usageCount,
    bool isDefault,
  });
}

/// @nodoc
class __$$TimerPresetModelImplCopyWithImpl<$Res>
    extends _$TimerPresetModelCopyWithImpl<$Res, _$TimerPresetModelImpl>
    implements _$$TimerPresetModelImplCopyWith<$Res> {
  __$$TimerPresetModelImplCopyWithImpl(
    _$TimerPresetModelImpl _value,
    $Res Function(_$TimerPresetModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimerPresetModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? durationMinutes = null,
    Object? durationSeconds = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? createdAt = null,
    Object? lastUsedAt = freezed,
    Object? usageCount = null,
    Object? isDefault = null,
  }) {
    return _then(
      _$TimerPresetModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        durationMinutes:
            null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                    as int,
        durationSeconds:
            null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                    as int,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        icon:
            freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String,
        lastUsedAt:
            freezed == lastUsedAt
                ? _value.lastUsedAt
                : lastUsedAt // ignore: cast_nullable_to_non_nullable
                    as String?,
        usageCount:
            null == usageCount
                ? _value.usageCount
                : usageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        isDefault:
            null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerPresetModelImpl extends _TimerPresetModel {
  const _$TimerPresetModelImpl({
    required this.id,
    required this.name,
    required this.durationMinutes,
    required this.durationSeconds,
    this.description,
    this.icon,
    required this.createdAt,
    this.lastUsedAt,
    this.usageCount = 0,
    this.isDefault = false,
  }) : super._();

  factory _$TimerPresetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerPresetModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int durationMinutes;
  @override
  final int durationSeconds;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final String createdAt;
  // ISO string format
  @override
  final String? lastUsedAt;
  // ISO string format
  @override
  @JsonKey()
  final int usageCount;
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'TimerPresetModel(id: $id, name: $name, durationMinutes: $durationMinutes, durationSeconds: $durationSeconds, description: $description, icon: $icon, createdAt: $createdAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerPresetModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.durationMinutes, durationMinutes) ||
                other.durationMinutes == durationMinutes) &&
            (identical(other.durationSeconds, durationSeconds) ||
                other.durationSeconds == durationSeconds) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    durationMinutes,
    durationSeconds,
    description,
    icon,
    createdAt,
    lastUsedAt,
    usageCount,
    isDefault,
  );

  /// Create a copy of TimerPresetModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerPresetModelImplCopyWith<_$TimerPresetModelImpl> get copyWith =>
      __$$TimerPresetModelImplCopyWithImpl<_$TimerPresetModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerPresetModelImplToJson(this);
  }
}

abstract class _TimerPresetModel extends TimerPresetModel {
  const factory _TimerPresetModel({
    required final String id,
    required final String name,
    required final int durationMinutes,
    required final int durationSeconds,
    final String? description,
    final String? icon,
    required final String createdAt,
    final String? lastUsedAt,
    final int usageCount,
    final bool isDefault,
  }) = _$TimerPresetModelImpl;
  const _TimerPresetModel._() : super._();

  factory _TimerPresetModel.fromJson(Map<String, dynamic> json) =
      _$TimerPresetModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get durationMinutes;
  @override
  int get durationSeconds;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  String get createdAt; // ISO string format
  @override
  String? get lastUsedAt; // ISO string format
  @override
  int get usageCount;
  @override
  bool get isDefault;

  /// Create a copy of TimerPresetModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerPresetModelImplCopyWith<_$TimerPresetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
