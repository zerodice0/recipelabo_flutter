// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_timer_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CookingTimerEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // 타이머 이름
  int get totalSeconds => throw _privateConstructorUsedError; // 전체 시간 (초)
  int get remainingSeconds => throw _privateConstructorUsedError; // 남은 시간 (초)
  DateTime get startTime => throw _privateConstructorUsedError; // 시작 시간
  DateTime? get endTime => throw _privateConstructorUsedError; // 종료 시간 (계산된 값)
  TimerStatus get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  String? get recipeId =>
      throw _privateConstructorUsedError; // 연결된 레시피 ID (선택사항)
  String? get stepId => throw _privateConstructorUsedError;

  /// Create a copy of CookingTimerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CookingTimerEntityCopyWith<CookingTimerEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookingTimerEntityCopyWith<$Res> {
  factory $CookingTimerEntityCopyWith(
    CookingTimerEntity value,
    $Res Function(CookingTimerEntity) then,
  ) = _$CookingTimerEntityCopyWithImpl<$Res, CookingTimerEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    int totalSeconds,
    int remainingSeconds,
    DateTime startTime,
    DateTime? endTime,
    TimerStatus status,
    String? description,
    String? icon,
    String? recipeId,
    String? stepId,
  });
}

/// @nodoc
class _$CookingTimerEntityCopyWithImpl<$Res, $Val extends CookingTimerEntity>
    implements $CookingTimerEntityCopyWith<$Res> {
  _$CookingTimerEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CookingTimerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalSeconds = null,
    Object? remainingSeconds = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? status = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? recipeId = freezed,
    Object? stepId = freezed,
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
            totalSeconds:
                null == totalSeconds
                    ? _value.totalSeconds
                    : totalSeconds // ignore: cast_nullable_to_non_nullable
                        as int,
            remainingSeconds:
                null == remainingSeconds
                    ? _value.remainingSeconds
                    : remainingSeconds // ignore: cast_nullable_to_non_nullable
                        as int,
            startTime:
                null == startTime
                    ? _value.startTime
                    : startTime // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            endTime:
                freezed == endTime
                    ? _value.endTime
                    : endTime // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as TimerStatus,
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
            recipeId:
                freezed == recipeId
                    ? _value.recipeId
                    : recipeId // ignore: cast_nullable_to_non_nullable
                        as String?,
            stepId:
                freezed == stepId
                    ? _value.stepId
                    : stepId // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CookingTimerEntityImplCopyWith<$Res>
    implements $CookingTimerEntityCopyWith<$Res> {
  factory _$$CookingTimerEntityImplCopyWith(
    _$CookingTimerEntityImpl value,
    $Res Function(_$CookingTimerEntityImpl) then,
  ) = __$$CookingTimerEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int totalSeconds,
    int remainingSeconds,
    DateTime startTime,
    DateTime? endTime,
    TimerStatus status,
    String? description,
    String? icon,
    String? recipeId,
    String? stepId,
  });
}

/// @nodoc
class __$$CookingTimerEntityImplCopyWithImpl<$Res>
    extends _$CookingTimerEntityCopyWithImpl<$Res, _$CookingTimerEntityImpl>
    implements _$$CookingTimerEntityImplCopyWith<$Res> {
  __$$CookingTimerEntityImplCopyWithImpl(
    _$CookingTimerEntityImpl _value,
    $Res Function(_$CookingTimerEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CookingTimerEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? totalSeconds = null,
    Object? remainingSeconds = null,
    Object? startTime = null,
    Object? endTime = freezed,
    Object? status = null,
    Object? description = freezed,
    Object? icon = freezed,
    Object? recipeId = freezed,
    Object? stepId = freezed,
  }) {
    return _then(
      _$CookingTimerEntityImpl(
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
        totalSeconds:
            null == totalSeconds
                ? _value.totalSeconds
                : totalSeconds // ignore: cast_nullable_to_non_nullable
                    as int,
        remainingSeconds:
            null == remainingSeconds
                ? _value.remainingSeconds
                : remainingSeconds // ignore: cast_nullable_to_non_nullable
                    as int,
        startTime:
            null == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        endTime:
            freezed == endTime
                ? _value.endTime
                : endTime // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as TimerStatus,
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
        recipeId:
            freezed == recipeId
                ? _value.recipeId
                : recipeId // ignore: cast_nullable_to_non_nullable
                    as String?,
        stepId:
            freezed == stepId
                ? _value.stepId
                : stepId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$CookingTimerEntityImpl extends _CookingTimerEntity {
  const _$CookingTimerEntityImpl({
    required this.id,
    required this.name,
    required this.totalSeconds,
    required this.remainingSeconds,
    required this.startTime,
    this.endTime,
    required this.status,
    this.description,
    this.icon,
    this.recipeId,
    this.stepId,
  }) : super._();

  @override
  final String id;
  @override
  final String name;
  // 타이머 이름
  @override
  final int totalSeconds;
  // 전체 시간 (초)
  @override
  final int remainingSeconds;
  // 남은 시간 (초)
  @override
  final DateTime startTime;
  // 시작 시간
  @override
  final DateTime? endTime;
  // 종료 시간 (계산된 값)
  @override
  final TimerStatus status;
  @override
  final String? description;
  @override
  final String? icon;
  @override
  final String? recipeId;
  // 연결된 레시피 ID (선택사항)
  @override
  final String? stepId;

  @override
  String toString() {
    return 'CookingTimerEntity(id: $id, name: $name, totalSeconds: $totalSeconds, remainingSeconds: $remainingSeconds, startTime: $startTime, endTime: $endTime, status: $status, description: $description, icon: $icon, recipeId: $recipeId, stepId: $stepId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookingTimerEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalSeconds, totalSeconds) ||
                other.totalSeconds == totalSeconds) &&
            (identical(other.remainingSeconds, remainingSeconds) ||
                other.remainingSeconds == remainingSeconds) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.stepId, stepId) || other.stepId == stepId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    totalSeconds,
    remainingSeconds,
    startTime,
    endTime,
    status,
    description,
    icon,
    recipeId,
    stepId,
  );

  /// Create a copy of CookingTimerEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CookingTimerEntityImplCopyWith<_$CookingTimerEntityImpl> get copyWith =>
      __$$CookingTimerEntityImplCopyWithImpl<_$CookingTimerEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _CookingTimerEntity extends CookingTimerEntity {
  const factory _CookingTimerEntity({
    required final String id,
    required final String name,
    required final int totalSeconds,
    required final int remainingSeconds,
    required final DateTime startTime,
    final DateTime? endTime,
    required final TimerStatus status,
    final String? description,
    final String? icon,
    final String? recipeId,
    final String? stepId,
  }) = _$CookingTimerEntityImpl;
  const _CookingTimerEntity._() : super._();

  @override
  String get id;
  @override
  String get name; // 타이머 이름
  @override
  int get totalSeconds; // 전체 시간 (초)
  @override
  int get remainingSeconds; // 남은 시간 (초)
  @override
  DateTime get startTime; // 시작 시간
  @override
  DateTime? get endTime; // 종료 시간 (계산된 값)
  @override
  TimerStatus get status;
  @override
  String? get description;
  @override
  String? get icon;
  @override
  String? get recipeId; // 연결된 레시피 ID (선택사항)
  @override
  String? get stepId;

  /// Create a copy of CookingTimerEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CookingTimerEntityImplCopyWith<_$CookingTimerEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
