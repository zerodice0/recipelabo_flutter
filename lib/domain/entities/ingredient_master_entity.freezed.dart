// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_master_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$IngredientMasterEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get categoryId =>
      throw _privateConstructorUsedError; // CategoryEntity의 ID 참조
  String? get subCategory =>
      throw _privateConstructorUsedError; // 세부 카테고리 (예: 단위의 경우 '무게', '부피', '개수', '기타')
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;

  /// Create a copy of IngredientMasterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientMasterEntityCopyWith<IngredientMasterEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientMasterEntityCopyWith<$Res> {
  factory $IngredientMasterEntityCopyWith(
    IngredientMasterEntity value,
    $Res Function(IngredientMasterEntity) then,
  ) = _$IngredientMasterEntityCopyWithImpl<$Res, IngredientMasterEntity>;
  @useResult
  $Res call({
    String id,
    String name,
    String categoryId,
    String? subCategory,
    String? description,
    DateTime createdAt,
    DateTime updatedAt,
    int usageCount,
  });
}

/// @nodoc
class _$IngredientMasterEntityCopyWithImpl<
  $Res,
  $Val extends IngredientMasterEntity
>
    implements $IngredientMasterEntityCopyWith<$Res> {
  _$IngredientMasterEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientMasterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? subCategory = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
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
            categoryId: null == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String,
            subCategory: freezed == subCategory
                ? _value.subCategory
                : subCategory // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            usageCount: null == usageCount
                ? _value.usageCount
                : usageCount // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientMasterEntityImplCopyWith<$Res>
    implements $IngredientMasterEntityCopyWith<$Res> {
  factory _$$IngredientMasterEntityImplCopyWith(
    _$IngredientMasterEntityImpl value,
    $Res Function(_$IngredientMasterEntityImpl) then,
  ) = __$$IngredientMasterEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String categoryId,
    String? subCategory,
    String? description,
    DateTime createdAt,
    DateTime updatedAt,
    int usageCount,
  });
}

/// @nodoc
class __$$IngredientMasterEntityImplCopyWithImpl<$Res>
    extends
        _$IngredientMasterEntityCopyWithImpl<$Res, _$IngredientMasterEntityImpl>
    implements _$$IngredientMasterEntityImplCopyWith<$Res> {
  __$$IngredientMasterEntityImplCopyWithImpl(
    _$IngredientMasterEntityImpl _value,
    $Res Function(_$IngredientMasterEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientMasterEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? subCategory = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
  }) {
    return _then(
      _$IngredientMasterEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        categoryId: null == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String,
        subCategory: freezed == subCategory
            ? _value.subCategory
            : subCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        usageCount: null == usageCount
            ? _value.usageCount
            : usageCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$IngredientMasterEntityImpl extends _IngredientMasterEntity {
  const _$IngredientMasterEntityImpl({
    required this.id,
    required this.name,
    required this.categoryId,
    this.subCategory,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.usageCount = 0,
  }) : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String categoryId;
  // CategoryEntity의 ID 참조
  @override
  final String? subCategory;
  // 세부 카테고리 (예: 단위의 경우 '무게', '부피', '개수', '기타')
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
    return 'IngredientMasterEntity(id: $id, name: $name, categoryId: $categoryId, subCategory: $subCategory, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientMasterEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
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
    categoryId,
    subCategory,
    description,
    createdAt,
    updatedAt,
    usageCount,
  );

  /// Create a copy of IngredientMasterEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientMasterEntityImplCopyWith<_$IngredientMasterEntityImpl>
  get copyWith =>
      __$$IngredientMasterEntityImplCopyWithImpl<_$IngredientMasterEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _IngredientMasterEntity extends IngredientMasterEntity {
  const factory _IngredientMasterEntity({
    required final String id,
    required final String name,
    required final String categoryId,
    final String? subCategory,
    final String? description,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final int usageCount,
  }) = _$IngredientMasterEntityImpl;
  const _IngredientMasterEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get categoryId; // CategoryEntity의 ID 참조
  @override
  String? get subCategory; // 세부 카테고리 (예: 단위의 경우 '무게', '부피', '개수', '기타')
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get usageCount;

  /// Create a copy of IngredientMasterEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientMasterEntityImplCopyWith<_$IngredientMasterEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
