// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_master_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IngredientMasterModel _$IngredientMasterModelFromJson(
  Map<String, dynamic> json,
) {
  return _IngredientMasterModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientMasterModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get categoryId => throw _privateConstructorUsedError;
  String? get category =>
      throw _privateConstructorUsedError; // 마이그레이션 기간 동안 임시 유지
  String? get subCategory => throw _privateConstructorUsedError; // 세부 카테고리
  String? get description => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;

  /// Serializes this IngredientMasterModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientMasterModelCopyWith<IngredientMasterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientMasterModelCopyWith<$Res> {
  factory $IngredientMasterModelCopyWith(
    IngredientMasterModel value,
    $Res Function(IngredientMasterModel) then,
  ) = _$IngredientMasterModelCopyWithImpl<$Res, IngredientMasterModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String categoryId,
    String? category,
    String? subCategory,
    String? description,
    String createdAt,
    String updatedAt,
    int usageCount,
  });
}

/// @nodoc
class _$IngredientMasterModelCopyWithImpl<
  $Res,
  $Val extends IngredientMasterModel
>
    implements $IngredientMasterModelCopyWith<$Res> {
  _$IngredientMasterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? category = freezed,
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
            category: freezed == category
                ? _value.category
                : category // ignore: cast_nullable_to_non_nullable
                      as String?,
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
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
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
abstract class _$$IngredientMasterModelImplCopyWith<$Res>
    implements $IngredientMasterModelCopyWith<$Res> {
  factory _$$IngredientMasterModelImplCopyWith(
    _$IngredientMasterModelImpl value,
    $Res Function(_$IngredientMasterModelImpl) then,
  ) = __$$IngredientMasterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String categoryId,
    String? category,
    String? subCategory,
    String? description,
    String createdAt,
    String updatedAt,
    int usageCount,
  });
}

/// @nodoc
class __$$IngredientMasterModelImplCopyWithImpl<$Res>
    extends
        _$IngredientMasterModelCopyWithImpl<$Res, _$IngredientMasterModelImpl>
    implements _$$IngredientMasterModelImplCopyWith<$Res> {
  __$$IngredientMasterModelImplCopyWithImpl(
    _$IngredientMasterModelImpl _value,
    $Res Function(_$IngredientMasterModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? categoryId = null,
    Object? category = freezed,
    Object? subCategory = freezed,
    Object? description = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
  }) {
    return _then(
      _$IngredientMasterModelImpl(
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
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
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
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
        usageCount: null == usageCount
            ? _value.usageCount
            : usageCount // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientMasterModelImpl implements _IngredientMasterModel {
  const _$IngredientMasterModelImpl({
    required this.id,
    required this.name,
    required this.categoryId,
    this.category,
    this.subCategory,
    this.description,
    required this.createdAt,
    required this.updatedAt,
    this.usageCount = 0,
  });

  factory _$IngredientMasterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientMasterModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String categoryId;
  @override
  final String? category;
  // 마이그레이션 기간 동안 임시 유지
  @override
  final String? subCategory;
  // 세부 카테고리
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
    return 'IngredientMasterModel(id: $id, name: $name, categoryId: $categoryId, category: $category, subCategory: $subCategory, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientMasterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.category, category) ||
                other.category == category) &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    categoryId,
    category,
    subCategory,
    description,
    createdAt,
    updatedAt,
    usageCount,
  );

  /// Create a copy of IngredientMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientMasterModelImplCopyWith<_$IngredientMasterModelImpl>
  get copyWith =>
      __$$IngredientMasterModelImplCopyWithImpl<_$IngredientMasterModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientMasterModelImplToJson(this);
  }
}

abstract class _IngredientMasterModel implements IngredientMasterModel {
  const factory _IngredientMasterModel({
    required final String id,
    required final String name,
    required final String categoryId,
    final String? category,
    final String? subCategory,
    final String? description,
    required final String createdAt,
    required final String updatedAt,
    final int usageCount,
  }) = _$IngredientMasterModelImpl;

  factory _IngredientMasterModel.fromJson(Map<String, dynamic> json) =
      _$IngredientMasterModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get categoryId;
  @override
  String? get category; // 마이그레이션 기간 동안 임시 유지
  @override
  String? get subCategory; // 세부 카테고리
  @override
  String? get description;
  @override
  String get createdAt;
  @override
  String get updatedAt;
  @override
  int get usageCount;

  /// Create a copy of IngredientMasterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientMasterModelImplCopyWith<_$IngredientMasterModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
