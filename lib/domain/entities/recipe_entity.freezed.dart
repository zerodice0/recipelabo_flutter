// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecipeEntity {
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get latestVersionId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool get isPublic => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of RecipeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeEntityCopyWith<RecipeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeEntityCopyWith<$Res> {
  factory $RecipeEntityCopyWith(
          RecipeEntity value, $Res Function(RecipeEntity) then) =
      _$RecipeEntityCopyWithImpl<$Res, RecipeEntity>;
  @useResult
  $Res call(
      {String id,
      String authorId,
      String latestVersionId,
      String name,
      String? description,
      bool isPublic,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$RecipeEntityCopyWithImpl<$Res, $Val extends RecipeEntity>
    implements $RecipeEntityCopyWith<$Res> {
  _$RecipeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? latestVersionId = null,
    Object? name = null,
    Object? description = freezed,
    Object? isPublic = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      latestVersionId: null == latestVersionId
          ? _value.latestVersionId
          : latestVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecipeEntityImplCopyWith<$Res>
    implements $RecipeEntityCopyWith<$Res> {
  factory _$$RecipeEntityImplCopyWith(
          _$RecipeEntityImpl value, $Res Function(_$RecipeEntityImpl) then) =
      __$$RecipeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String authorId,
      String latestVersionId,
      String name,
      String? description,
      bool isPublic,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$RecipeEntityImplCopyWithImpl<$Res>
    extends _$RecipeEntityCopyWithImpl<$Res, _$RecipeEntityImpl>
    implements _$$RecipeEntityImplCopyWith<$Res> {
  __$$RecipeEntityImplCopyWithImpl(
      _$RecipeEntityImpl _value, $Res Function(_$RecipeEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecipeEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorId = null,
    Object? latestVersionId = null,
    Object? name = null,
    Object? description = freezed,
    Object? isPublic = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$RecipeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      latestVersionId: null == latestVersionId
          ? _value.latestVersionId
          : latestVersionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isPublic: null == isPublic
          ? _value.isPublic
          : isPublic // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$RecipeEntityImpl implements _RecipeEntity {
  const _$RecipeEntityImpl(
      {required this.id,
      required this.authorId,
      required this.latestVersionId,
      required this.name,
      this.description,
      required this.isPublic,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final String authorId;
  @override
  final String latestVersionId;
  @override
  final String name;
  @override
  final String? description;
  @override
  final bool isPublic;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'RecipeEntity(id: $id, authorId: $authorId, latestVersionId: $latestVersionId, name: $name, description: $description, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.latestVersionId, latestVersionId) ||
                other.latestVersionId == latestVersionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isPublic, isPublic) ||
                other.isPublic == isPublic) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, authorId, latestVersionId,
      name, description, isPublic, createdAt, updatedAt);

  /// Create a copy of RecipeEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeEntityImplCopyWith<_$RecipeEntityImpl> get copyWith =>
      __$$RecipeEntityImplCopyWithImpl<_$RecipeEntityImpl>(this, _$identity);
}

abstract class _RecipeEntity implements RecipeEntity {
  const factory _RecipeEntity(
      {required final String id,
      required final String authorId,
      required final String latestVersionId,
      required final String name,
      final String? description,
      required final bool isPublic,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$RecipeEntityImpl;

  @override
  String get id;
  @override
  String get authorId;
  @override
  String get latestVersionId;
  @override
  String get name;
  @override
  String? get description;
  @override
  bool get isPublic;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of RecipeEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeEntityImplCopyWith<_$RecipeEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
