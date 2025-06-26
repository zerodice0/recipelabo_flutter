// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seasoning_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SeasoningModel _$SeasoningModelFromJson(Map<String, dynamic> json) {
  return _SeasoningModel.fromJson(json);
}

/// @nodoc
mixin _$SeasoningModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;

  /// Serializes this SeasoningModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeasoningModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasoningModelCopyWith<SeasoningModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasoningModelCopyWith<$Res> {
  factory $SeasoningModelCopyWith(
    SeasoningModel value,
    $Res Function(SeasoningModel) then,
  ) = _$SeasoningModelCopyWithImpl<$Res, SeasoningModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String? category,
    String? description,
    String createdAt,
    String updatedAt,
    int usageCount,
  });
}

/// @nodoc
class _$SeasoningModelCopyWithImpl<$Res, $Val extends SeasoningModel>
    implements $SeasoningModelCopyWith<$Res> {
  _$SeasoningModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasoningModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
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
            category:
                freezed == category
                    ? _value.category
                    : category // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                freezed == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String?,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as String,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as String,
            usageCount:
                null == usageCount
                    ? _value.usageCount
                    : usageCount // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SeasoningModelImplCopyWith<$Res>
    implements $SeasoningModelCopyWith<$Res> {
  factory _$$SeasoningModelImplCopyWith(
    _$SeasoningModelImpl value,
    $Res Function(_$SeasoningModelImpl) then,
  ) = __$$SeasoningModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? category,
    String? description,
    String createdAt,
    String updatedAt,
    int usageCount,
  });
}

/// @nodoc
class __$$SeasoningModelImplCopyWithImpl<$Res>
    extends _$SeasoningModelCopyWithImpl<$Res, _$SeasoningModelImpl>
    implements _$$SeasoningModelImplCopyWith<$Res> {
  __$$SeasoningModelImplCopyWithImpl(
    _$SeasoningModelImpl _value,
    $Res Function(_$SeasoningModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SeasoningModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? category = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
  }) {
    return _then(
      _$SeasoningModelImpl(
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
        category:
            freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String?,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as String,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as String,
        usageCount:
            null == usageCount
                ? _value.usageCount
                : usageCount // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SeasoningModelImpl implements _SeasoningModel {
  const _$SeasoningModelImpl({
    required this.id,
    required this.name,
    this.category,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.usageCount = 0,
  });

  factory _$SeasoningModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasoningModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? category;
  @override
  final String? description;
  @override
  final String createdAt;
  @override
  final String updatedAt;
  @override
  @JsonKey()
  final int usageCount;

  @override
  String toString() {
    return 'SeasoningModel(id: $id, name: $name, category: $category, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasoningModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    category,
    description,
    createdAt,
    updatedAt,
    usageCount,
  );

  /// Create a copy of SeasoningModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasoningModelImplCopyWith<_$SeasoningModelImpl> get copyWith =>
      __$$SeasoningModelImplCopyWithImpl<_$SeasoningModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasoningModelImplToJson(this);
  }
}

abstract class _SeasoningModel implements SeasoningModel {
  const factory _SeasoningModel({
    required final String id,
    required final String name,
    final String? category,
    final String? description,
    required final String createdAt,
    required final String updatedAt,
    final int usageCount,
  }) = _$SeasoningModelImpl;

  factory _SeasoningModel.fromJson(Map<String, dynamic> json) =
      _$SeasoningModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get category;
  @override
  String? get description;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get usageCount;

  /// Create a copy of SeasoningModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasoningModelImplCopyWith<_$SeasoningModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
