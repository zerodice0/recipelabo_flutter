// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepModel _$StepModelFromJson(Map<String, dynamic> json) {
  return _StepModel.fromJson(json);
}

/// @nodoc
mixin _$StepModel {
  String get id => throw _privateConstructorUsedError;
  String? get recipeVersionId => throw _privateConstructorUsedError;
  int get stepNumber => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;

  /// Serializes this StepModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StepModelCopyWith<StepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepModelCopyWith<$Res> {
  factory $StepModelCopyWith(StepModel value, $Res Function(StepModel) then) =
      _$StepModelCopyWithImpl<$Res, StepModel>;
  @useResult
  $Res call(
      {String id,
      String? recipeVersionId,
      int stepNumber,
      String description,
      String? imageUrl,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDeleted});
}

/// @nodoc
class _$StepModelCopyWithImpl<$Res, $Val extends StepModel>
    implements $StepModelCopyWith<$Res> {
  _$StepModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StepModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeVersionId = freezed,
    Object? stepNumber = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeVersionId: freezed == recipeVersionId
          ? _value.recipeVersionId
          : recipeVersionId // ignore: cast_nullable_to_non_nullable
              as String?,
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepModelImplCopyWith<$Res>
    implements $StepModelCopyWith<$Res> {
  factory _$$StepModelImplCopyWith(
          _$StepModelImpl value, $Res Function(_$StepModelImpl) then) =
      __$$StepModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? recipeVersionId,
      int stepNumber,
      String description,
      String? imageUrl,
      DateTime createdAt,
      DateTime updatedAt,
      bool isDeleted});
}

/// @nodoc
class __$$StepModelImplCopyWithImpl<$Res>
    extends _$StepModelCopyWithImpl<$Res, _$StepModelImpl>
    implements _$$StepModelImplCopyWith<$Res> {
  __$$StepModelImplCopyWithImpl(
      _$StepModelImpl _value, $Res Function(_$StepModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StepModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeVersionId = freezed,
    Object? stepNumber = null,
    Object? description = null,
    Object? imageUrl = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? isDeleted = null,
  }) {
    return _then(_$StepModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recipeVersionId: freezed == recipeVersionId
          ? _value.recipeVersionId
          : recipeVersionId // ignore: cast_nullable_to_non_nullable
              as String?,
      stepNumber: null == stepNumber
          ? _value.stepNumber
          : stepNumber // ignore: cast_nullable_to_non_nullable
              as int,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepModelImpl implements _StepModel {
  const _$StepModelImpl(
      {required this.id,
      this.recipeVersionId,
      required this.stepNumber,
      required this.description,
      this.imageUrl,
      required this.createdAt,
      required this.updatedAt,
      this.isDeleted = false});

  factory _$StepModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepModelImplFromJson(json);

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
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;

  @override
  String toString() {
    return 'StepModel(id: $id, recipeVersionId: $recipeVersionId, stepNumber: $stepNumber, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipeVersionId, recipeVersionId) ||
                other.recipeVersionId == recipeVersionId) &&
            (identical(other.stepNumber, stepNumber) ||
                other.stepNumber == stepNumber) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, recipeVersionId, stepNumber,
      description, imageUrl, createdAt, updatedAt, isDeleted);

  /// Create a copy of StepModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StepModelImplCopyWith<_$StepModelImpl> get copyWith =>
      __$$StepModelImplCopyWithImpl<_$StepModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepModelImplToJson(
      this,
    );
  }
}

abstract class _StepModel implements StepModel {
  const factory _StepModel(
      {required final String id,
      final String? recipeVersionId,
      required final int stepNumber,
      required final String description,
      final String? imageUrl,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final bool isDeleted}) = _$StepModelImpl;

  factory _StepModel.fromJson(Map<String, dynamic> json) =
      _$StepModelImpl.fromJson;

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
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDeleted;

  /// Create a copy of StepModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StepModelImplCopyWith<_$StepModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
