// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecipeVersionModel _$RecipeVersionModelFromJson(Map<String, dynamic> json) {
  return _RecipeVersionModel.fromJson(json);
}

/// @nodoc
mixin _$RecipeVersionModel {
  String get id => throw _privateConstructorUsedError;
  String get recipeId => throw _privateConstructorUsedError;
  int get versionNumber => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get versionName => throw _privateConstructorUsedError; // 사용자 정의 버전명
  String get description => throw _privateConstructorUsedError;
  List<IngredientModel> get ingredients => throw _privateConstructorUsedError;
  List<StepModel> get steps => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  String? get changeLog => throw _privateConstructorUsedError;
  String? get baseVersionId => throw _privateConstructorUsedError;

  /// Serializes this RecipeVersionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecipeVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeVersionModelCopyWith<RecipeVersionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeVersionModelCopyWith<$Res> {
  factory $RecipeVersionModelCopyWith(
    RecipeVersionModel value,
    $Res Function(RecipeVersionModel) then,
  ) = _$RecipeVersionModelCopyWithImpl<$Res, RecipeVersionModel>;
  @useResult
  $Res call({
    String id,
    String recipeId,
    int versionNumber,
    String name,
    String? versionName,
    String description,
    List<IngredientModel> ingredients,
    List<StepModel> steps,
    String authorId,
    DateTime createdAt,
    DateTime updatedAt,
    bool isDeleted,
    String? changeLog,
    String? baseVersionId,
  });
}

/// @nodoc
class _$RecipeVersionModelCopyWithImpl<$Res, $Val extends RecipeVersionModel>
    implements $RecipeVersionModelCopyWith<$Res> {
  _$RecipeVersionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeVersionModel
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
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? changeLog = freezed,
    Object? baseVersionId = freezed,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            recipeId:
                null == recipeId
                    ? _value.recipeId
                    : recipeId // ignore: cast_nullable_to_non_nullable
                        as String,
            versionNumber:
                null == versionNumber
                    ? _value.versionNumber
                    : versionNumber // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            versionName:
                freezed == versionName
                    ? _value.versionName
                    : versionName // ignore: cast_nullable_to_non_nullable
                        as String?,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            ingredients:
                null == ingredients
                    ? _value.ingredients
                    : ingredients // ignore: cast_nullable_to_non_nullable
                        as List<IngredientModel>,
            steps:
                null == steps
                    ? _value.steps
                    : steps // ignore: cast_nullable_to_non_nullable
                        as List<StepModel>,
            authorId:
                null == authorId
                    ? _value.authorId
                    : authorId // ignore: cast_nullable_to_non_nullable
                        as String,
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
            isDeleted:
                null == isDeleted
                    ? _value.isDeleted
                    : isDeleted // ignore: cast_nullable_to_non_nullable
                        as bool,
            changeLog:
                freezed == changeLog
                    ? _value.changeLog
                    : changeLog // ignore: cast_nullable_to_non_nullable
                        as String?,
            baseVersionId:
                freezed == baseVersionId
                    ? _value.baseVersionId
                    : baseVersionId // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeVersionModelImplCopyWith<$Res>
    implements $RecipeVersionModelCopyWith<$Res> {
  factory _$$RecipeVersionModelImplCopyWith(
    _$RecipeVersionModelImpl value,
    $Res Function(_$RecipeVersionModelImpl) then,
  ) = __$$RecipeVersionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String recipeId,
    int versionNumber,
    String name,
    String? versionName,
    String description,
    List<IngredientModel> ingredients,
    List<StepModel> steps,
    String authorId,
    DateTime createdAt,
    DateTime updatedAt,
    bool isDeleted,
    String? changeLog,
    String? baseVersionId,
  });
}

/// @nodoc
class __$$RecipeVersionModelImplCopyWithImpl<$Res>
    extends _$RecipeVersionModelCopyWithImpl<$Res, _$RecipeVersionModelImpl>
    implements _$$RecipeVersionModelImplCopyWith<$Res> {
  __$$RecipeVersionModelImplCopyWithImpl(
    _$RecipeVersionModelImpl _value,
    $Res Function(_$RecipeVersionModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeVersionModel
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
    Object? updatedAt = null,
    Object? isDeleted = null,
    Object? changeLog = freezed,
    Object? baseVersionId = freezed,
  }) {
    return _then(
      _$RecipeVersionModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        recipeId:
            null == recipeId
                ? _value.recipeId
                : recipeId // ignore: cast_nullable_to_non_nullable
                    as String,
        versionNumber:
            null == versionNumber
                ? _value.versionNumber
                : versionNumber // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        versionName:
            freezed == versionName
                ? _value.versionName
                : versionName // ignore: cast_nullable_to_non_nullable
                    as String?,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        ingredients:
            null == ingredients
                ? _value._ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                    as List<IngredientModel>,
        steps:
            null == steps
                ? _value._steps
                : steps // ignore: cast_nullable_to_non_nullable
                    as List<StepModel>,
        authorId:
            null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                    as String,
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
        isDeleted:
            null == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                    as bool,
        changeLog:
            freezed == changeLog
                ? _value.changeLog
                : changeLog // ignore: cast_nullable_to_non_nullable
                    as String?,
        baseVersionId:
            freezed == baseVersionId
                ? _value.baseVersionId
                : baseVersionId // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipeVersionModelImpl implements _RecipeVersionModel {
  const _$RecipeVersionModelImpl({
    required this.id,
    required this.recipeId,
    required this.versionNumber,
    required this.name,
    this.versionName,
    required this.description,
    required final List<IngredientModel> ingredients,
    required final List<StepModel> steps,
    required this.authorId,
    required this.createdAt,
    required this.updatedAt,
    this.isDeleted = false,
    this.changeLog,
    this.baseVersionId,
  }) : _ingredients = ingredients,
       _steps = steps;

  factory _$RecipeVersionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipeVersionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String recipeId;
  @override
  final int versionNumber;
  @override
  final String name;
  @override
  final String? versionName;
  // 사용자 정의 버전명
  @override
  final String description;
  final List<IngredientModel> _ingredients;
  @override
  List<IngredientModel> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<StepModel> _steps;
  @override
  List<StepModel> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  final String authorId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final String? changeLog;
  @override
  final String? baseVersionId;

  @override
  String toString() {
    return 'RecipeVersionModel(id: $id, recipeId: $recipeId, versionNumber: $versionNumber, name: $name, versionName: $versionName, description: $description, ingredients: $ingredients, steps: $steps, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, changeLog: $changeLog, baseVersionId: $baseVersionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeVersionModelImpl &&
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
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.changeLog, changeLog) ||
                other.changeLog == changeLog) &&
            (identical(other.baseVersionId, baseVersionId) ||
                other.baseVersionId == baseVersionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
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
    updatedAt,
    isDeleted,
    changeLog,
    baseVersionId,
  );

  /// Create a copy of RecipeVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeVersionModelImplCopyWith<_$RecipeVersionModelImpl> get copyWith =>
      __$$RecipeVersionModelImplCopyWithImpl<_$RecipeVersionModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipeVersionModelImplToJson(this);
  }
}

abstract class _RecipeVersionModel implements RecipeVersionModel {
  const factory _RecipeVersionModel({
    required final String id,
    required final String recipeId,
    required final int versionNumber,
    required final String name,
    final String? versionName,
    required final String description,
    required final List<IngredientModel> ingredients,
    required final List<StepModel> steps,
    required final String authorId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final bool isDeleted,
    final String? changeLog,
    final String? baseVersionId,
  }) = _$RecipeVersionModelImpl;

  factory _RecipeVersionModel.fromJson(Map<String, dynamic> json) =
      _$RecipeVersionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get recipeId;
  @override
  int get versionNumber;
  @override
  String get name;
  @override
  String? get versionName; // 사용자 정의 버전명
  @override
  String get description;
  @override
  List<IngredientModel> get ingredients;
  @override
  List<StepModel> get steps;
  @override
  String get authorId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  bool get isDeleted;
  @override
  String? get changeLog;
  @override
  String? get baseVersionId;

  /// Create a copy of RecipeVersionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeVersionModelImplCopyWith<_$RecipeVersionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
