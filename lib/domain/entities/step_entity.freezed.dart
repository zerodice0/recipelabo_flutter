// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StepEntity {
  String get id => throw _privateConstructorUsedError;
  String? get recipeVersionId => throw _privateConstructorUsedError;
  int get stepNumber => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  int? get timerMinutes => throw _privateConstructorUsedError; // 타이머 시간 (분)
  int? get timerSeconds => throw _privateConstructorUsedError; // 타이머 시간 (초)
  String? get timerName => throw _privateConstructorUsedError;

  /// Create a copy of StepEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepEntityCopyWith<StepEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepEntityCopyWith<$Res> {
  factory $StepEntityCopyWith(
    StepEntity value,
    $Res Function(StepEntity) then,
  ) = _$StepEntityCopyWithImpl<$Res, StepEntity>;
  @useResult
  $Res call({
    String id,
    String? recipeVersionId,
    int stepNumber,
    String description,
    String? imageUrl,
    int? timerMinutes,
    int? timerSeconds,
    String? timerName,
  });
}

/// @nodoc
class _$StepEntityCopyWithImpl<$Res, $Val extends StepEntity>
    implements $StepEntityCopyWith<$Res> {
  _$StepEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeVersionId = freezed,
    Object? stepNumber = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? timerMinutes = freezed,
    Object? timerSeconds = freezed,
    Object? timerName = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            recipeVersionId:
                freezed == recipeVersionId
                    ? _value.recipeVersionId
                    : recipeVersionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            stepNumber:
                null == stepNumber
                    ? _value.stepNumber
                    : stepNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                freezed == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String?,
            timerMinutes:
                freezed == timerMinutes
                    ? _value.timerMinutes
                    : timerMinutes // ignore: cast_nullable_to_non_nullable
                        as int?,
            timerSeconds:
                freezed == timerSeconds
                    ? _value.timerSeconds
                    : timerSeconds // ignore: cast_nullable_to_non_nullable
                        as int?,
            timerName:
                freezed == timerName
                    ? _value.timerName
                    : timerName // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StepEntityImplCopyWith<$Res>
    implements $StepEntityCopyWith<$Res> {
  factory _$$StepEntityImplCopyWith(
    _$StepEntityImpl value,
    $Res Function(_$StepEntityImpl) then,
  ) = __$$StepEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? recipeVersionId,
    int stepNumber,
    String description,
    String? imageUrl,
    int? timerMinutes,
    int? timerSeconds,
    String? timerName,
  });
}

/// @nodoc
class __$$StepEntityImplCopyWithImpl<$Res>
    extends _$StepEntityCopyWithImpl<$Res, _$StepEntityImpl>
    implements _$$StepEntityImplCopyWith<$Res> {
  __$$StepEntityImplCopyWithImpl(
    _$StepEntityImpl _value,
    $Res Function(_$StepEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StepEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeVersionId = freezed,
    Object? stepNumber = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? timerMinutes = freezed,
    Object? timerSeconds = freezed,
    Object? timerName = freezed,
  }) {
    return _then(
      _$StepEntityImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        recipeVersionId:
            freezed == recipeVersionId
                ? _value.recipeVersionId
                : recipeVersionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        stepNumber:
            null == stepNumber
                ? _value.stepNumber
                : stepNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String?,
        timerMinutes:
            freezed == timerMinutes
                ? _value.timerMinutes
                : timerMinutes // ignore: cast_nullable_to_non_nullable
                    as int?,
        timerSeconds:
            freezed == timerSeconds
                ? _value.timerSeconds
                : timerSeconds // ignore: cast_nullable_to_non_nullable
                    as int?,
        timerName:
            freezed == timerName
                ? _value.timerName
                : timerName // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$StepEntityImpl implements _StepEntity {
  const _$StepEntityImpl({
    required this.id,
    this.recipeVersionId,
    required this.stepNumber,
    required this.description,
    this.imageUrl,
    this.timerMinutes,
    this.timerSeconds,
    this.timerName,
  });

  @override
  final String id;
  @override
  final String? recipeVersionId;
  @override
  final int stepNumber;
  @override
  final String description;
  @override
  final String? imageUrl;
  @override
  final int? timerMinutes;
  // 타이머 시간 (분)
  @override
  final int? timerSeconds;
  // 타이머 시간 (초)
  @override
  final String? timerName;

  @override
  String toString() {
    return 'StepEntity(id: $id, recipeVersionId: $recipeVersionId, stepNumber: $stepNumber, description: $description, imageUrl: $imageUrl, timerMinutes: $timerMinutes, timerSeconds: $timerSeconds, timerName: $timerName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipeVersionId, recipeVersionId) ||
                other.recipeVersionId == recipeVersionId) &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.timerMinutes, timerMinutes) ||
                other.timerMinutes == timerMinutes) &&
            (identical(other.timerSeconds, timerSeconds) ||
                other.timerSeconds == timerSeconds) &&
            (identical(other.timerName, timerName) ||
                other.timerName == timerName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    recipeVersionId,
    stepNumber,
    description,
    imageUrl,
    timerMinutes,
    timerSeconds,
    timerName,
  );

  /// Create a copy of StepEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepEntityImplCopyWith<_$StepEntityImpl> get copyWith =>
      __$$StepEntityImplCopyWithImpl<_$StepEntityImpl>(this, _$identity);
}

abstract class _StepEntity implements StepEntity {
  const factory _StepEntity({
    required final String id,
    final String? recipeVersionId,
    required final int stepNumber,
    required final String description,
    final String? imageUrl,
    final int? timerMinutes,
    final int? timerSeconds,
    final String? timerName,
  }) = _$StepEntityImpl;

  @override
  String get id;
  @override
  String? get recipeVersionId;
  @override
  int get stepNumber;
  @override
  String get description;
  @override
  String? get imageUrl;
  @override
  int? get timerMinutes; // 타이머 시간 (분)
  @override
  int? get timerSeconds; // 타이머 시간 (초)
  @override
  String? get timerName;

  /// Create a copy of StepEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepEntityImplCopyWith<_$StepEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
