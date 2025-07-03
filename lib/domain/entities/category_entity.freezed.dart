// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoryEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get iconCode =>
      throw _privateConstructorUsedError; // Material Icons 코드
  String? get colorCode => throw _privateConstructorUsedError; // 색상 코드 (선택적)
  CategoryType get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get usageCount => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryEntityCopyWith<CategoryEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryEntityCopyWith<$Res> {
  factory $CategoryEntityCopyWith(
          CategoryEntity value, $Res Function(CategoryEntity) then) =
      _$CategoryEntityCopyWithImpl<$Res, CategoryEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String displayName,
      String? description,
      String? iconCode,
      String? colorCode,
      CategoryType type,
      DateTime createdAt,
      DateTime updatedAt,
      int usageCount,
      bool isActive});
}

/// @nodoc
class _$CategoryEntityCopyWithImpl<$Res, $Val extends CategoryEntity>
    implements $CategoryEntityCopyWith<$Res> {
  _$CategoryEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? description = freezed,
    Object? iconCode = freezed,
    Object? colorCode = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconCode: freezed == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
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
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryEntityImplCopyWith<$Res>
    implements $CategoryEntityCopyWith<$Res> {
  factory _$$CategoryEntityImplCopyWith(_$CategoryEntityImpl value,
          $Res Function(_$CategoryEntityImpl) then) =
      __$$CategoryEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String displayName,
      String? description,
      String? iconCode,
      String? colorCode,
      CategoryType type,
      DateTime createdAt,
      DateTime updatedAt,
      int usageCount,
      bool isActive});
}

/// @nodoc
class __$$CategoryEntityImplCopyWithImpl<$Res>
    extends _$CategoryEntityCopyWithImpl<$Res, _$CategoryEntityImpl>
    implements _$$CategoryEntityImplCopyWith<$Res> {
  __$$CategoryEntityImplCopyWithImpl(
      _$CategoryEntityImpl _value, $Res Function(_$CategoryEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? displayName = null,
    Object? description = freezed,
    Object? iconCode = freezed,
    Object? colorCode = freezed,
    Object? type = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? usageCount = null,
    Object? isActive = null,
  }) {
    return _then(_$CategoryEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      iconCode: freezed == iconCode
          ? _value.iconCode
          : iconCode // ignore: cast_nullable_to_non_nullable
              as String?,
      colorCode: freezed == colorCode
          ? _value.colorCode
          : colorCode // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as CategoryType,
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
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CategoryEntityImpl extends _CategoryEntity {
  const _$CategoryEntityImpl(
      {required this.id,
      required this.name,
      required this.displayName,
      this.description,
      this.iconCode,
      this.colorCode,
      required this.type,
      required this.createdAt,
      required this.updatedAt,
      this.usageCount = 0,
      this.isActive = true})
      : super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final String displayName;
  @override
  final String? description;
  @override
  final String? iconCode;
// Material Icons 코드
  @override
  final String? colorCode;
// 색상 코드 (선택적)
  @override
  final CategoryType type;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final int usageCount;
  @override
  @JsonKey()
  final bool isActive;

  @override
  String toString() {
    return 'CategoryEntity(id: $id, name: $name, displayName: $displayName, description: $description, iconCode: $iconCode, colorCode: $colorCode, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.iconCode, iconCode) ||
                other.iconCode == iconCode) &&
            (identical(other.colorCode, colorCode) ||
                other.colorCode == colorCode) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      displayName,
      description,
      iconCode,
      colorCode,
      type,
      createdAt,
      updatedAt,
      usageCount,
      isActive);

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      __$$CategoryEntityImplCopyWithImpl<_$CategoryEntityImpl>(
          this, _$identity);
}

abstract class _CategoryEntity extends CategoryEntity {
  const factory _CategoryEntity(
      {required final String id,
      required final String name,
      required final String displayName,
      final String? description,
      final String? iconCode,
      final String? colorCode,
      required final CategoryType type,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final int usageCount,
      final bool isActive}) = _$CategoryEntityImpl;
  const _CategoryEntity._() : super._();

  @override
  String get id;
  @override
  String get name;
  @override
  String get displayName;
  @override
  String? get description;
  @override
  String? get iconCode; // Material Icons 코드
  @override
  String? get colorCode; // 색상 코드 (선택적)
  @override
  CategoryType get type;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  int get usageCount;
  @override
  bool get isActive;

  /// Create a copy of CategoryEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryEntityImplCopyWith<_$CategoryEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
