// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_edit_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecipeEditState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<IngredientEntity> get ingredients => throw _privateConstructorUsedError;
  List<StepEntity> get steps => throw _privateConstructorUsedError;
  AsyncValue<void> get saveState => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isEditMode => throw _privateConstructorUsedError;
  String? get recipeId => throw _privateConstructorUsedError;
  String? get recipeVersionId => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get showSaveOptions => throw _privateConstructorUsedError;
  bool get createNewVersion => throw _privateConstructorUsedError;
  String get changeLog => throw _privateConstructorUsedError;
  String get versionName => throw _privateConstructorUsedError; // 사용자 정의 버전명
  RecipeEntity? get originalRecipe => throw _privateConstructorUsedError;
  List<RecipeVersionEntity>? get allVersions =>
      throw _privateConstructorUsedError;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeEditStateCopyWith<RecipeEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeEditStateCopyWith<$Res> {
  factory $RecipeEditStateCopyWith(
    RecipeEditState value,
    $Res Function(RecipeEditState) then,
  ) = _$RecipeEditStateCopyWithImpl<$Res, RecipeEditState>;
  @useResult
  $Res call({
    String name,
    String description,
    List<IngredientEntity> ingredients,
    List<StepEntity> steps,
    AsyncValue<void> saveState,
    bool isLoading,
    bool isEditMode,
    String? recipeId,
    String? recipeVersionId,
    String? error,
    bool showSaveOptions,
    bool createNewVersion,
    String changeLog,
    String versionName,
    RecipeEntity? originalRecipe,
    List<RecipeVersionEntity>? allVersions,
  });

  $RecipeEntityCopyWith<$Res>? get originalRecipe;
}

/// @nodoc
class _$RecipeEditStateCopyWithImpl<$Res, $Val extends RecipeEditState>
    implements $RecipeEditStateCopyWith<$Res> {
  _$RecipeEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? steps = null,
    Object? saveState = null,
    Object? isLoading = null,
    Object? isEditMode = null,
    Object? recipeId = freezed,
    Object? recipeVersionId = freezed,
    Object? error = freezed,
    Object? showSaveOptions = null,
    Object? createNewVersion = null,
    Object? changeLog = null,
    Object? versionName = null,
    Object? originalRecipe = freezed,
    Object? allVersions = freezed,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            ingredients:
                null == ingredients
                    ? _value.ingredients
                    : ingredients // ignore: cast_nullable_to_non_nullable
                        as List<IngredientEntity>,
            steps:
                null == steps
                    ? _value.steps
                    : steps // ignore: cast_nullable_to_non_nullable
                        as List<StepEntity>,
            saveState:
                null == saveState
                    ? _value.saveState
                    : saveState // ignore: cast_nullable_to_non_nullable
                        as AsyncValue<void>,
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            isEditMode:
                null == isEditMode
                    ? _value.isEditMode
                    : isEditMode // ignore: cast_nullable_to_non_nullable
                        as bool,
            recipeId:
                freezed == recipeId
                    ? _value.recipeId
                    : recipeId // ignore: cast_nullable_to_non_nullable
                        as String?,
            recipeVersionId:
                freezed == recipeVersionId
                    ? _value.recipeVersionId
                    : recipeVersionId // ignore: cast_nullable_to_non_nullable
                        as String?,
            error:
                freezed == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as String?,
            showSaveOptions:
                null == showSaveOptions
                    ? _value.showSaveOptions
                    : showSaveOptions // ignore: cast_nullable_to_non_nullable
                        as bool,
            createNewVersion:
                null == createNewVersion
                    ? _value.createNewVersion
                    : createNewVersion // ignore: cast_nullable_to_non_nullable
                        as bool,
            changeLog:
                null == changeLog
                    ? _value.changeLog
                    : changeLog // ignore: cast_nullable_to_non_nullable
                        as String,
            versionName:
                null == versionName
                    ? _value.versionName
                    : versionName // ignore: cast_nullable_to_non_nullable
                        as String,
            originalRecipe:
                freezed == originalRecipe
                    ? _value.originalRecipe
                    : originalRecipe // ignore: cast_nullable_to_non_nullable
                        as RecipeEntity?,
            allVersions:
                freezed == allVersions
                    ? _value.allVersions
                    : allVersions // ignore: cast_nullable_to_non_nullable
                        as List<RecipeVersionEntity>?,
          )
          as $Val,
    );
  }

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RecipeEntityCopyWith<$Res>? get originalRecipe {
    if (_value.originalRecipe == null) {
      return null;
    }

    return $RecipeEntityCopyWith<$Res>(_value.originalRecipe!, (value) {
      return _then(_value.copyWith(originalRecipe: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipeEditStateImplCopyWith<$Res>
    implements $RecipeEditStateCopyWith<$Res> {
  factory _$$RecipeEditStateImplCopyWith(
    _$RecipeEditStateImpl value,
    $Res Function(_$RecipeEditStateImpl) then,
  ) = __$$RecipeEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    List<IngredientEntity> ingredients,
    List<StepEntity> steps,
    AsyncValue<void> saveState,
    bool isLoading,
    bool isEditMode,
    String? recipeId,
    String? recipeVersionId,
    String? error,
    bool showSaveOptions,
    bool createNewVersion,
    String changeLog,
    String versionName,
    RecipeEntity? originalRecipe,
    List<RecipeVersionEntity>? allVersions,
  });

  @override
  $RecipeEntityCopyWith<$Res>? get originalRecipe;
}

/// @nodoc
class __$$RecipeEditStateImplCopyWithImpl<$Res>
    extends _$RecipeEditStateCopyWithImpl<$Res, _$RecipeEditStateImpl>
    implements _$$RecipeEditStateImplCopyWith<$Res> {
  __$$RecipeEditStateImplCopyWithImpl(
    _$RecipeEditStateImpl _value,
    $Res Function(_$RecipeEditStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? steps = null,
    Object? saveState = null,
    Object? isLoading = null,
    Object? isEditMode = null,
    Object? recipeId = freezed,
    Object? recipeVersionId = freezed,
    Object? error = freezed,
    Object? showSaveOptions = null,
    Object? createNewVersion = null,
    Object? changeLog = null,
    Object? versionName = null,
    Object? originalRecipe = freezed,
    Object? allVersions = freezed,
  }) {
    return _then(
      _$RecipeEditStateImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        ingredients:
            null == ingredients
                ? _value._ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                    as List<IngredientEntity>,
        steps:
            null == steps
                ? _value._steps
                : steps // ignore: cast_nullable_to_non_nullable
                    as List<StepEntity>,
        saveState:
            null == saveState
                ? _value.saveState
                : saveState // ignore: cast_nullable_to_non_nullable
                    as AsyncValue<void>,
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        isEditMode:
            null == isEditMode
                ? _value.isEditMode
                : isEditMode // ignore: cast_nullable_to_non_nullable
                    as bool,
        recipeId:
            freezed == recipeId
                ? _value.recipeId
                : recipeId // ignore: cast_nullable_to_non_nullable
                    as String?,
        recipeVersionId:
            freezed == recipeVersionId
                ? _value.recipeVersionId
                : recipeVersionId // ignore: cast_nullable_to_non_nullable
                    as String?,
        error:
            freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as String?,
        showSaveOptions:
            null == showSaveOptions
                ? _value.showSaveOptions
                : showSaveOptions // ignore: cast_nullable_to_non_nullable
                    as bool,
        createNewVersion:
            null == createNewVersion
                ? _value.createNewVersion
                : createNewVersion // ignore: cast_nullable_to_non_nullable
                    as bool,
        changeLog:
            null == changeLog
                ? _value.changeLog
                : changeLog // ignore: cast_nullable_to_non_nullable
                    as String,
        versionName:
            null == versionName
                ? _value.versionName
                : versionName // ignore: cast_nullable_to_non_nullable
                    as String,
        originalRecipe:
            freezed == originalRecipe
                ? _value.originalRecipe
                : originalRecipe // ignore: cast_nullable_to_non_nullable
                    as RecipeEntity?,
        allVersions:
            freezed == allVersions
                ? _value._allVersions
                : allVersions // ignore: cast_nullable_to_non_nullable
                    as List<RecipeVersionEntity>?,
      ),
    );
  }
}

/// @nodoc

class _$RecipeEditStateImpl
    with DiagnosticableTreeMixin
    implements _RecipeEditState {
  const _$RecipeEditStateImpl({
    this.name = '',
    this.description = '',
    final List<IngredientEntity> ingredients = const [],
    final List<StepEntity> steps = const [],
    this.saveState = const AsyncValue.data(null),
    this.isLoading = false,
    this.isEditMode = false,
    this.recipeId,
    this.recipeVersionId,
    this.error,
    this.showSaveOptions = false,
    this.createNewVersion = true,
    this.changeLog = '',
    this.versionName = '',
    this.originalRecipe,
    final List<RecipeVersionEntity>? allVersions,
  }) : _ingredients = ingredients,
       _steps = steps,
       _allVersions = allVersions;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<IngredientEntity> _ingredients;
  @override
  @JsonKey()
  List<IngredientEntity> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<StepEntity> _steps;
  @override
  @JsonKey()
  List<StepEntity> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  @JsonKey()
  final AsyncValue<void> saveState;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isEditMode;
  @override
  final String? recipeId;
  @override
  final String? recipeVersionId;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool showSaveOptions;
  @override
  @JsonKey()
  final bool createNewVersion;
  @override
  @JsonKey()
  final String changeLog;
  @override
  @JsonKey()
  final String versionName;
  // 사용자 정의 버전명
  @override
  final RecipeEntity? originalRecipe;
  final List<RecipeVersionEntity>? _allVersions;
  @override
  List<RecipeVersionEntity>? get allVersions {
    final value = _allVersions;
    if (value == null) return null;
    if (_allVersions is EqualUnmodifiableListView) return _allVersions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecipeEditState(name: $name, description: $description, ingredients: $ingredients, steps: $steps, saveState: $saveState, isLoading: $isLoading, isEditMode: $isEditMode, recipeId: $recipeId, recipeVersionId: $recipeVersionId, error: $error, showSaveOptions: $showSaveOptions, createNewVersion: $createNewVersion, changeLog: $changeLog, versionName: $versionName, originalRecipe: $originalRecipe, allVersions: $allVersions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecipeEditState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('ingredients', ingredients))
      ..add(DiagnosticsProperty('steps', steps))
      ..add(DiagnosticsProperty('saveState', saveState))
      ..add(DiagnosticsProperty('isLoading', isLoading))
      ..add(DiagnosticsProperty('isEditMode', isEditMode))
      ..add(DiagnosticsProperty('recipeId', recipeId))
      ..add(DiagnosticsProperty('recipeVersionId', recipeVersionId))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('showSaveOptions', showSaveOptions))
      ..add(DiagnosticsProperty('createNewVersion', createNewVersion))
      ..add(DiagnosticsProperty('changeLog', changeLog))
      ..add(DiagnosticsProperty('versionName', versionName))
      ..add(DiagnosticsProperty('originalRecipe', originalRecipe))
      ..add(DiagnosticsProperty('allVersions', allVersions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeEditStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.saveState, saveState) ||
                other.saveState == saveState) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isEditMode, isEditMode) ||
                other.isEditMode == isEditMode) &&
            (identical(other.recipeId, recipeId) ||
                other.recipeId == recipeId) &&
            (identical(other.recipeVersionId, recipeVersionId) ||
                other.recipeVersionId == recipeVersionId) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.showSaveOptions, showSaveOptions) ||
                other.showSaveOptions == showSaveOptions) &&
            (identical(other.createNewVersion, createNewVersion) ||
                other.createNewVersion == createNewVersion) &&
            (identical(other.changeLog, changeLog) ||
                other.changeLog == changeLog) &&
            (identical(other.versionName, versionName) ||
                other.versionName == versionName) &&
            (identical(other.originalRecipe, originalRecipe) ||
                other.originalRecipe == originalRecipe) &&
            const DeepCollectionEquality().equals(
              other._allVersions,
              _allVersions,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_ingredients),
    const DeepCollectionEquality().hash(_steps),
    saveState,
    isLoading,
    isEditMode,
    recipeId,
    recipeVersionId,
    error,
    showSaveOptions,
    createNewVersion,
    changeLog,
    versionName,
    originalRecipe,
    const DeepCollectionEquality().hash(_allVersions),
  );

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeEditStateImplCopyWith<_$RecipeEditStateImpl> get copyWith =>
      __$$RecipeEditStateImplCopyWithImpl<_$RecipeEditStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RecipeEditState implements RecipeEditState {
  const factory _RecipeEditState({
    final String name,
    final String description,
    final List<IngredientEntity> ingredients,
    final List<StepEntity> steps,
    final AsyncValue<void> saveState,
    final bool isLoading,
    final bool isEditMode,
    final String? recipeId,
    final String? recipeVersionId,
    final String? error,
    final bool showSaveOptions,
    final bool createNewVersion,
    final String changeLog,
    final String versionName,
    final RecipeEntity? originalRecipe,
    final List<RecipeVersionEntity>? allVersions,
  }) = _$RecipeEditStateImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  List<IngredientEntity> get ingredients;
  @override
  List<StepEntity> get steps;
  @override
  AsyncValue<void> get saveState;
  @override
  bool get isLoading;
  @override
  bool get isEditMode;
  @override
  String? get recipeId;
  @override
  String? get recipeVersionId;
  @override
  String? get error;
  @override
  bool get showSaveOptions;
  @override
  bool get createNewVersion;
  @override
  String get changeLog;
  @override
  String get versionName; // 사용자 정의 버전명
  @override
  RecipeEntity? get originalRecipe;
  @override
  List<RecipeVersionEntity>? get allVersions;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeEditStateImplCopyWith<_$RecipeEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
