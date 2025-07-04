// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_preset_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TimerPresetEntity {
  String get id => throw _privateConstructorUsedError;
  String get name =>
      throw _privateConstructorUsedError; // 예: "파스타 면 삶기", "달걀 완숙"
  int get durationMinutes => throw _privateConstructorUsedError; // 분 단위 시간
  int get durationSeconds => throw _privateConstructorUsedError; // 초 단위 시간 (추가)
  String? get description => throw _privateConstructorUsedError; // 타이머 설명
  String? get icon =>
      throw _privateConstructorUsedError; // 아이콘 이름 (예: "pasta", "egg")
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get lastUsedAt => throw _privateConstructorUsedError; // 마지막 사용 시간
  int get usageCount => throw _privateConstructorUsedError; // 사용 횟수
  bool get isDefault => throw _privateConstructorUsedError;

  /// Create a copy of TimerPresetEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerPresetEntityCopyWith<TimerPresetEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerPresetEntityCopyWith<$Res> {
  factory $TimerPresetEntityCopyWith(
    TimerPresetEntity value,
    $Res Function(TimerPresetEntity) then,
  ) = _$TimerPresetEntityCopyWithImpl<$Res, TimerPresetEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    int durationMinutes,
    int durationSeconds,
    String? description,
    String? icon,
    DateTime createdAt,
    DateTime? lastUsedAt,
    int usageCount,
    bool isDefault,
  });
}

/// @nodoc
class _$TimerPresetEntityCopyWithImpl<$Res, $Val extends TimerPresetEntity>
    implements $TimerPresetEntityCopyWith<$Res> {
  _$TimerPresetEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerPresetEntity
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
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            durationMinutes: null == durationMinutes
                ? _value.durationMinutes
                : durationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            durationSeconds: null == durationSeconds
                ? _value.durationSeconds
                : durationSeconds // ignore: cast_nullable_to_non_nullable
                      as int,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            icon: freezed == icon
                ? _value.icon
                : icon // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            lastUsedAt: freezed == lastUsedAt
                ? _value.lastUsedAt
                : lastUsedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            usageCount: null == usageCount
                ? _value.usageCount
                : usageCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isDefault: null == isDefault
                ? _value.isDefault
                : isDefault // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TimerPresetEntityImplCopyWith<$Res>
    implements $TimerPresetEntityCopyWith<$Res> {
  factory _$$TimerPresetEntityImplCopyWith(
    _$TimerPresetEntityImpl value,
    $Res Function(_$TimerPresetEntityImpl) then,
  ) = __$$TimerPresetEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int durationMinutes,
    int durationSeconds,
    String? description,
    String? icon,
    DateTime createdAt,
    DateTime? lastUsedAt,
    int usageCount,
    bool isDefault,
  });
}

/// @nodoc
class __$$TimerPresetEntityImplCopyWithImpl<$Res>
    extends _$TimerPresetEntityCopyWithImpl<$Res, _$TimerPresetEntityImpl>
    implements _$$TimerPresetEntityImplCopyWith<$Res> {
  __$$TimerPresetEntityImplCopyWithImpl(
    _$TimerPresetEntityImpl _value,
    $Res Function(_$TimerPresetEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TimerPresetEntity
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
      _$TimerPresetEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        durationMinutes: null == durationMinutes
            ? _value.durationMinutes
            : durationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        durationSeconds: null == durationSeconds
            ? _value.durationSeconds
            : durationSeconds // ignore: cast_nullable_to_non_nullable
                  as int,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        icon: freezed == icon
            ? _value.icon
            : icon // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        lastUsedAt: freezed == lastUsedAt
            ? _value.lastUsedAt
            : lastUsedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        usageCount: null == usageCount
            ? _value.usageCount
            : usageCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isDefault: null == isDefault
            ? _value.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TimerPresetEntityImpl extends _TimerPresetEntity {
  const _$TimerPresetEntityImpl({
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

  @override
  final String id;
  @override
  final String name;
  // 예: "파스타 면 삶기", "달걀 완숙"
  @override
  final int durationMinutes;
  // 분 단위 시간
  @override
  final int durationSeconds;
  // 초 단위 시간 (추가)
  @override
  final String? description;
  // 타이머 설명
  @override
  final String? icon;
  // 아이콘 이름 (예: "pasta", "egg")
  @override
  final DateTime createdAt;
  @override
  final DateTime? lastUsedAt;
  // 마지막 사용 시간
  @override
  @JsonKey()
  final int usageCount;
  // 사용 횟수
  @override
  @JsonKey()
  final bool isDefault;

  @override
  String toString() {
    return 'TimerPresetEntity(id: $id, name: $name, durationMinutes: $durationMinutes, durationSeconds: $durationSeconds, description: $description, icon: $icon, createdAt: $createdAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, isDefault: $isDefault)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerPresetEntityImpl &&
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

  /// Create a copy of TimerPresetEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerPresetEntityImplCopyWith<_$TimerPresetEntityImpl> get copyWith =>
      __$$TimerPresetEntityImplCopyWithImpl<_$TimerPresetEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _TimerPresetEntity extends TimerPresetEntity {
  const factory _TimerPresetEntity({
    required final String id,
    required final String name,
    required final int durationMinutes,
    required final int durationSeconds,
    final String? description,
    final String? icon,
    required final DateTime createdAt,
    final DateTime? lastUsedAt,
    final int usageCount,
    final bool isDefault,
  }) = _$TimerPresetEntityImpl;
  const _TimerPresetEntity._() : super._();

  @override
  String get id;
  @override
  String get name; // 예: "파스타 면 삶기", "달걀 완숙"
  @override
  int get durationMinutes; // 분 단위 시간
  @override
  int get durationSeconds; // 초 단위 시간 (추가)
  @override
  String? get description; // 타이머 설명
  @override
  String? get icon; // 아이콘 이름 (예: "pasta", "egg")
  @override
  DateTime get createdAt;
  @override
  DateTime? get lastUsedAt; // 마지막 사용 시간
  @override
  int get usageCount; // 사용 횟수
  @override
  bool get isDefault;

  /// Create a copy of TimerPresetEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerPresetEntityImplCopyWith<_$TimerPresetEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
