// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_version_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecipeVersionEntity {
  String get id => throw _privateConstructorUsedError;
  String get recipeId => throw _privateConstructorUsedError;
  int get versionNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError; // 레시피 이름 (모든 버전에서 동일)
  String? get versionName =>
      throw _privateConstructorUsedError; // 사용자 정의 버전명 (예: "라볶이", "설탕 대체제")
  String get description => throw _privateConstructorUsedError;
  List<IngredientEntity> get ingredients => throw _privateConstructorUsedError;
  List<StepEntity> get steps => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get changeLog => throw _privateConstructorUsedError;
  String? get baseVersionId => throw _privateConstructorUsedError;

  /// Create a copy of RecipeVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeVersionEntityCopyWith<RecipeVersionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeVersionEntityCopyWith<$Res> {
  factory $RecipeVersionEntityCopyWith(
    RecipeVersionEntity value,
    $Res Function(RecipeVersionEntity) then,
  ) = _$RecipeVersionEntityCopyWithImpl<$Res, RecipeVersionEntity>;
  @useResult
  $Res call({
    String id,
    String recipeId,
    int versionNumber,
    String name,
    String? versionName,
    String description,
    List<IngredientEntity> ingredients,
    List<StepEntity> steps,
    String authorId,
    DateTime createdAt,
    String? changeLog,
    String? baseVersionId,
  });
}

/// @nodoc
class _$RecipeVersionEntityCopyWithImpl<$Res, $Val extends RecipeVersionEntity>
    implements $RecipeVersionEntityCopyWith<$Res> {
  _$RecipeVersionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeId = null,
    Object? versionNumber = null,
    Object? name = null,
    Object? versionName = freezed,
    Object? description = null,
    Object? ingredients = null,
    Object? steps = null,
    Object? authorId = null,
    Object? createdAt = null,
    Object? changeLog = freezed,
    Object? baseVersionId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            recipeId: null == recipeId
                ? _value.recipeId
                : recipeId // ignore: cast_nullable_to_non_nullable
                      as String,
            versionNumber: null == versionNumber
                ? _value.versionNumber
                : versionNumber // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            versionName: freezed == versionName
                ? _value.versionName
                : versionName // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            ingredients: null == ingredients
                ? _value.ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                      as List<IngredientEntity>,
            steps: null == steps
                ? _value.steps
                : steps // ignore: cast_nullable_to_non_nullable
                      as List<StepEntity>,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            changeLog: freezed == changeLog
                ? _value.changeLog
                : changeLog // ignore: cast_nullable_to_non_nullable
                      as String?,
            baseVersionId: freezed == baseVersionId
                ? _value.baseVersionId
                : baseVersionId // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeVersionEntityImplCopyWith<$Res>
    implements $RecipeVersionEntityCopyWith<$Res> {
  factory _$$RecipeVersionEntityImplCopyWith(
    _$RecipeVersionEntityImpl value,
    $Res Function(_$RecipeVersionEntityImpl) then,
  ) = __$$RecipeVersionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String recipeId,
    int versionNumber,
    String name,
    String? versionName,
    String description,
    List<IngredientEntity> ingredients,
    List<StepEntity> steps,
    String authorId,
    DateTime createdAt,
    String? changeLog,
    String? baseVersionId,
  });
}

/// @nodoc
class __$$RecipeVersionEntityImplCopyWithImpl<$Res>
    extends _$RecipeVersionEntityCopyWithImpl<$Res, _$RecipeVersionEntityImpl>
    implements _$$RecipeVersionEntityImplCopyWith<$Res> {
  __$$RecipeVersionEntityImplCopyWithImpl(
    _$RecipeVersionEntityImpl _value,
    $Res Function(_$RecipeVersionEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeId = null,
    Object? versionNumber = null,
    Object? name = null,
    Object? versionName = freezed,
    Object? description = null,
    Object? ingredients = null,
    Object? steps = null,
    Object? authorId = null,
    Object? createdAt = null,
    Object? changeLog = freezed,
    Object? baseVersionId = freezed,
  }) {
    return _then(
      _$RecipeVersionEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        recipeId: null == recipeId
            ? _value.recipeId
            : recipeId // ignore: cast_nullable_to_non_nullable
                  as String,
        versionNumber: null == versionNumber
            ? _value.versionNumber
            : versionNumber // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        versionName: freezed == versionName
            ? _value.versionName
            : versionName // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        ingredients: null == ingredients
            ? _value._ingredients
            : ingredients // ignore: cast_nullable_to_non_nullable
                  as List<IngredientEntity>,
        steps: null == steps
            ? _value._steps
            : steps // ignore: cast_nullable_to_non_nullable
                  as List<StepEntity>,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        changeLog: freezed == changeLog
            ? _value.changeLog
            : changeLog // ignore: cast_nullable_to_non_nullable
                  as String?,
        baseVersionId: freezed == baseVersionId
            ? _value.baseVersionId
            : baseVersionId // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$RecipeVersionEntityImpl extends _RecipeVersionEntity {
  const _$RecipeVersionEntityImpl({
    required this.id,
    required this.recipeId,
    required this.versionNumber,
    required this.name,
    this.versionName,
    required this.description,
    required final List<IngredientEntity> ingredients,
    required final List<StepEntity> steps,
    required this.authorId,
    required this.createdAt,
    this.changeLog,
    this.baseVersionId,
  }) : _ingredients = ingredients,
       _steps = steps,
       super._();

  @override
  final String id;
  @override
  final String recipeId;
  @override
  final int versionNumber;
  @override
  final String name;
  // 레시피 이름 (모든 버전에서 동일)
  @override
  final String? versionName;
  // 사용자 정의 버전명 (예: "라볶이", "설탕 대체제")
  @override
  final String description;
  final List<IngredientEntity> _ingredients;
  @override
  List<IngredientEntity> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<StepEntity> _steps;
  @override
  List<StepEntity> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final String authorId;
  @override
  final DateTime createdAt;
  @override
  final String? changeLog;
  @override
  final String? baseVersionId;

  @override
  String toString() {
    return 'RecipeVersionEntity(id: $id, recipeId: $recipeId, versionNumber: $versionNumber, name: $name, versionName: $versionName, description: $description, ingredients: $ingredients, steps: $steps, authorId: $authorId, createdAt: $createdAt, changeLog: $changeLog, baseVersionId: $baseVersionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeVersionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.versionNumber, versionNumber) ||
                other.versionNumber == versionNumber) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.versionName, versionName) ||
                other.versionName == versionName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.changeLog, changeLog) ||
                other.changeLog == changeLog) &&
            (identical(other.baseVersionId, baseVersionId) ||
                other.baseVersionId == baseVersionId));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    recipeId,
    versionNumber,
    name,
    versionName,
    description,
    const DeepCollectionEquality().hash(_ingredients),
    const DeepCollectionEquality().hash(_steps),
    authorId,
    createdAt,
    changeLog,
    baseVersionId,
  );

  /// Create a copy of RecipeVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeVersionEntityImplCopyWith<_$RecipeVersionEntityImpl> get copyWith =>
      __$$RecipeVersionEntityImplCopyWithImpl<_$RecipeVersionEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _RecipeVersionEntity extends RecipeVersionEntity {
  const factory _RecipeVersionEntity({
    required final String id,
    required final String recipeId,
    required final int versionNumber,
    required final String name,
    final String? versionName,
    required final String description,
    required final List<IngredientEntity> ingredients,
    required final List<StepEntity> steps,
    required final String authorId,
    required final DateTime createdAt,
    final String? changeLog,
    final String? baseVersionId,
  }) = _$RecipeVersionEntityImpl;
  const _RecipeVersionEntity._() : super._();

  @override
  String get id;
  @override
  String get recipeId;
  @override
  int get versionNumber;
  @override
  String get name; // 레시피 이름 (모든 버전에서 동일)
  @override
  String? get versionName; // 사용자 정의 버전명 (예: "라볶이", "설탕 대체제")
  @override
  String get description;
  @override
  List<IngredientEntity> get ingredients;
  @override
  List<StepEntity> get steps;
  @override
  String get authorId;
  @override
  DateTime get createdAt;
  @override
  String? get changeLog;
  @override
  String? get baseVersionId;

  /// Create a copy of RecipeVersionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeVersionEntityImplCopyWith<_$RecipeVersionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
