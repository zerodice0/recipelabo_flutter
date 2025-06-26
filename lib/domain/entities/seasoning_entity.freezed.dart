// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seasoning_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SeasoningEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // 예: '재료', '단위' 또는 재료의 세부 분류 ('채소', '육류', '양념', '향신료' 등)
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;

  /// Create a copy of SeasoningEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeasoningEntityCopyWith<SeasoningEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasoningEntityCopyWith<$Res> {
  factory $SeasoningEntityCopyWith(
    SeasoningEntity value,
    $Res Function(SeasoningEntity) then,
  ) = _$SeasoningEntityCopyWithImpl<$Res, SeasoningEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String? category,
    String? description,
    DateTime createdAt,
    DateTime updatedAt,
    int usageCount,
  });
}

/// @nodoc
class _$SeasoningEntityCopyWithImpl<$Res, $Val extends SeasoningEntity>
    implements $SeasoningEntityCopyWith<$Res> {
  _$SeasoningEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeasoningEntity
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
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
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
abstract class _$$SeasoningEntityImplCopyWith<$Res>
    implements $SeasoningEntityCopyWith<$Res> {
  factory _$$SeasoningEntityImplCopyWith(
    _$SeasoningEntityImpl value,
    $Res Function(_$SeasoningEntityImpl) then,
  ) = __$$SeasoningEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String? category,
    String? description,
    DateTime createdAt,
    DateTime updatedAt,
    int usageCount,
  });
}

/// @nodoc
class __$$SeasoningEntityImplCopyWithImpl<$Res>
    extends _$SeasoningEntityCopyWithImpl<$Res, _$SeasoningEntityImpl>
    implements _$$SeasoningEntityImplCopyWith<$Res> {
  __$$SeasoningEntityImplCopyWithImpl(
    _$SeasoningEntityImpl _value,
    $Res Function(_$SeasoningEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SeasoningEntity
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
      _$SeasoningEntityImpl(
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
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
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

class _$SeasoningEntityImpl implements _SeasoningEntity {
  const _$SeasoningEntityImpl({
    required this.id,
    required this.name,
    this.category,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.usageCount = 0,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String? category;
  // 예: '재료', '단위' 또는 재료의 세부 분류 ('채소', '육류', '양념', '향신료' 등)
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int usageCount;

  @override
  String toString() {
    return 'SeasoningEntity(id: $id, name: $name, category: $category, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasoningEntityImpl &&
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

  /// Create a copy of SeasoningEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasoningEntityImplCopyWith<_$SeasoningEntityImpl> get copyWith =>
      __$$SeasoningEntityImplCopyWithImpl<_$SeasoningEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _SeasoningEntity implements SeasoningEntity {
  const factory _SeasoningEntity({
    required final String id,
    required final String name,
    final String? category,
    final String? description,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final int usageCount,
  }) = _$SeasoningEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get category; // 예: '재료', '단위' 또는 재료의 세부 분류 ('채소', '육류', '양념', '향신료' 등)
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get usageCount;

  /// Create a copy of SeasoningEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeasoningEntityImplCopyWith<_$SeasoningEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
