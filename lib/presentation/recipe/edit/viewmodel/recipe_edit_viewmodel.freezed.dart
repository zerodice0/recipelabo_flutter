// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_edit_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeEditState implements DiagnosticableTreeMixin {

 String get name; String get description; List<IngredientEntity> get ingredients; List<StepEntity> get steps; AsyncValue<void> get saveState; bool get isLoading; bool get isEditMode; String? get recipeId; String? get recipeVersionId; String? get initialVersionId;// 편집할 특정 버전 ID
 String? get error; bool get showSaveOptions; bool get createNewVersion; String get changeLog; String get versionName;// 사용자 정의 버전명
 RecipeEntity? get originalRecipe; List<RecipeVersionEntity>? get allVersions;
/// Create a copy of RecipeEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeEditStateCopyWith<RecipeEditState> get copyWith => _$RecipeEditStateCopyWithImpl<RecipeEditState>(this as RecipeEditState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecipeEditState'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('ingredients', ingredients))..add(DiagnosticsProperty('steps', steps))..add(DiagnosticsProperty('saveState', saveState))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('isEditMode', isEditMode))..add(DiagnosticsProperty('recipeId', recipeId))..add(DiagnosticsProperty('recipeVersionId', recipeVersionId))..add(DiagnosticsProperty('initialVersionId', initialVersionId))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('showSaveOptions', showSaveOptions))..add(DiagnosticsProperty('createNewVersion', createNewVersion))..add(DiagnosticsProperty('changeLog', changeLog))..add(DiagnosticsProperty('versionName', versionName))..add(DiagnosticsProperty('originalRecipe', originalRecipe))..add(DiagnosticsProperty('allVersions', allVersions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeEditState&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.saveState, saveState) || other.saveState == saveState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.initialVersionId, initialVersionId) || other.initialVersionId == initialVersionId)&&(identical(other.error, error) || other.error == error)&&(identical(other.showSaveOptions, showSaveOptions) || other.showSaveOptions == showSaveOptions)&&(identical(other.createNewVersion, createNewVersion) || other.createNewVersion == createNewVersion)&&(identical(other.changeLog, changeLog) || other.changeLog == changeLog)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.originalRecipe, originalRecipe) || other.originalRecipe == originalRecipe)&&const DeepCollectionEquality().equals(other.allVersions, allVersions));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps),saveState,isLoading,isEditMode,recipeId,recipeVersionId,initialVersionId,error,showSaveOptions,createNewVersion,changeLog,versionName,originalRecipe,const DeepCollectionEquality().hash(allVersions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecipeEditState(name: $name, description: $description, ingredients: $ingredients, steps: $steps, saveState: $saveState, isLoading: $isLoading, isEditMode: $isEditMode, recipeId: $recipeId, recipeVersionId: $recipeVersionId, initialVersionId: $initialVersionId, error: $error, showSaveOptions: $showSaveOptions, createNewVersion: $createNewVersion, changeLog: $changeLog, versionName: $versionName, originalRecipe: $originalRecipe, allVersions: $allVersions)';
}


}

/// @nodoc
abstract mixin class $RecipeEditStateCopyWith<$Res>  {
  factory $RecipeEditStateCopyWith(RecipeEditState value, $Res Function(RecipeEditState) _then) = _$RecipeEditStateCopyWithImpl;
@useResult
$Res call({
 String name, String description, List<IngredientEntity> ingredients, List<StepEntity> steps, AsyncValue<void> saveState, bool isLoading, bool isEditMode, String? recipeId, String? recipeVersionId, String? initialVersionId, String? error, bool showSaveOptions, bool createNewVersion, String changeLog, String versionName, RecipeEntity? originalRecipe, List<RecipeVersionEntity>? allVersions
});


$RecipeEntityCopyWith<$Res>? get originalRecipe;

}
/// @nodoc
class _$RecipeEditStateCopyWithImpl<$Res>
    implements $RecipeEditStateCopyWith<$Res> {
  _$RecipeEditStateCopyWithImpl(this._self, this._then);

  final RecipeEditState _self;
  final $Res Function(RecipeEditState) _then;

/// Create a copy of RecipeEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,Object? ingredients = null,Object? steps = null,Object? saveState = null,Object? isLoading = null,Object? isEditMode = null,Object? recipeId = freezed,Object? recipeVersionId = freezed,Object? initialVersionId = freezed,Object? error = freezed,Object? showSaveOptions = null,Object? createNewVersion = null,Object? changeLog = null,Object? versionName = null,Object? originalRecipe = freezed,Object? allVersions = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientEntity>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepEntity>,saveState: null == saveState ? _self.saveState : saveState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,initialVersionId: freezed == initialVersionId ? _self.initialVersionId : initialVersionId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,showSaveOptions: null == showSaveOptions ? _self.showSaveOptions : showSaveOptions // ignore: cast_nullable_to_non_nullable
as bool,createNewVersion: null == createNewVersion ? _self.createNewVersion : createNewVersion // ignore: cast_nullable_to_non_nullable
as bool,changeLog: null == changeLog ? _self.changeLog : changeLog // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,originalRecipe: freezed == originalRecipe ? _self.originalRecipe : originalRecipe // ignore: cast_nullable_to_non_nullable
as RecipeEntity?,allVersions: freezed == allVersions ? _self.allVersions : allVersions // ignore: cast_nullable_to_non_nullable
as List<RecipeVersionEntity>?,
  ));
}
/// Create a copy of RecipeEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeEntityCopyWith<$Res>? get originalRecipe {
    if (_self.originalRecipe == null) {
    return null;
  }

  return $RecipeEntityCopyWith<$Res>(_self.originalRecipe!, (value) {
    return _then(_self.copyWith(originalRecipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [RecipeEditState].
extension RecipeEditStatePatterns on RecipeEditState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeEditState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeEditState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeEditState value)  $default,){
final _that = this;
switch (_that) {
case _RecipeEditState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeEditState value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeEditState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String description,  List<IngredientEntity> ingredients,  List<StepEntity> steps,  AsyncValue<void> saveState,  bool isLoading,  bool isEditMode,  String? recipeId,  String? recipeVersionId,  String? initialVersionId,  String? error,  bool showSaveOptions,  bool createNewVersion,  String changeLog,  String versionName,  RecipeEntity? originalRecipe,  List<RecipeVersionEntity>? allVersions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeEditState() when $default != null:
return $default(_that.name,_that.description,_that.ingredients,_that.steps,_that.saveState,_that.isLoading,_that.isEditMode,_that.recipeId,_that.recipeVersionId,_that.initialVersionId,_that.error,_that.showSaveOptions,_that.createNewVersion,_that.changeLog,_that.versionName,_that.originalRecipe,_that.allVersions);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String description,  List<IngredientEntity> ingredients,  List<StepEntity> steps,  AsyncValue<void> saveState,  bool isLoading,  bool isEditMode,  String? recipeId,  String? recipeVersionId,  String? initialVersionId,  String? error,  bool showSaveOptions,  bool createNewVersion,  String changeLog,  String versionName,  RecipeEntity? originalRecipe,  List<RecipeVersionEntity>? allVersions)  $default,) {final _that = this;
switch (_that) {
case _RecipeEditState():
return $default(_that.name,_that.description,_that.ingredients,_that.steps,_that.saveState,_that.isLoading,_that.isEditMode,_that.recipeId,_that.recipeVersionId,_that.initialVersionId,_that.error,_that.showSaveOptions,_that.createNewVersion,_that.changeLog,_that.versionName,_that.originalRecipe,_that.allVersions);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String description,  List<IngredientEntity> ingredients,  List<StepEntity> steps,  AsyncValue<void> saveState,  bool isLoading,  bool isEditMode,  String? recipeId,  String? recipeVersionId,  String? initialVersionId,  String? error,  bool showSaveOptions,  bool createNewVersion,  String changeLog,  String versionName,  RecipeEntity? originalRecipe,  List<RecipeVersionEntity>? allVersions)?  $default,) {final _that = this;
switch (_that) {
case _RecipeEditState() when $default != null:
return $default(_that.name,_that.description,_that.ingredients,_that.steps,_that.saveState,_that.isLoading,_that.isEditMode,_that.recipeId,_that.recipeVersionId,_that.initialVersionId,_that.error,_that.showSaveOptions,_that.createNewVersion,_that.changeLog,_that.versionName,_that.originalRecipe,_that.allVersions);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeEditState with DiagnosticableTreeMixin implements RecipeEditState {
  const _RecipeEditState({this.name = '', this.description = '', final  List<IngredientEntity> ingredients = const [], final  List<StepEntity> steps = const [], this.saveState = const AsyncValue.data(null), this.isLoading = false, this.isEditMode = false, this.recipeId, this.recipeVersionId, this.initialVersionId, this.error, this.showSaveOptions = false, this.createNewVersion = true, this.changeLog = '', this.versionName = '', this.originalRecipe, final  List<RecipeVersionEntity>? allVersions}): _ingredients = ingredients,_steps = steps,_allVersions = allVersions;
  

@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
 final  List<IngredientEntity> _ingredients;
@override@JsonKey() List<IngredientEntity> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<StepEntity> _steps;
@override@JsonKey() List<StepEntity> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override@JsonKey() final  AsyncValue<void> saveState;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isEditMode;
@override final  String? recipeId;
@override final  String? recipeVersionId;
@override final  String? initialVersionId;
// 편집할 특정 버전 ID
@override final  String? error;
@override@JsonKey() final  bool showSaveOptions;
@override@JsonKey() final  bool createNewVersion;
@override@JsonKey() final  String changeLog;
@override@JsonKey() final  String versionName;
// 사용자 정의 버전명
@override final  RecipeEntity? originalRecipe;
 final  List<RecipeVersionEntity>? _allVersions;
@override List<RecipeVersionEntity>? get allVersions {
  final value = _allVersions;
  if (value == null) return null;
  if (_allVersions is EqualUnmodifiableListView) return _allVersions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of RecipeEditState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeEditStateCopyWith<_RecipeEditState> get copyWith => __$RecipeEditStateCopyWithImpl<_RecipeEditState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RecipeEditState'))
    ..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('ingredients', ingredients))..add(DiagnosticsProperty('steps', steps))..add(DiagnosticsProperty('saveState', saveState))..add(DiagnosticsProperty('isLoading', isLoading))..add(DiagnosticsProperty('isEditMode', isEditMode))..add(DiagnosticsProperty('recipeId', recipeId))..add(DiagnosticsProperty('recipeVersionId', recipeVersionId))..add(DiagnosticsProperty('initialVersionId', initialVersionId))..add(DiagnosticsProperty('error', error))..add(DiagnosticsProperty('showSaveOptions', showSaveOptions))..add(DiagnosticsProperty('createNewVersion', createNewVersion))..add(DiagnosticsProperty('changeLog', changeLog))..add(DiagnosticsProperty('versionName', versionName))..add(DiagnosticsProperty('originalRecipe', originalRecipe))..add(DiagnosticsProperty('allVersions', allVersions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeEditState&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.saveState, saveState) || other.saveState == saveState)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isEditMode, isEditMode) || other.isEditMode == isEditMode)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.initialVersionId, initialVersionId) || other.initialVersionId == initialVersionId)&&(identical(other.error, error) || other.error == error)&&(identical(other.showSaveOptions, showSaveOptions) || other.showSaveOptions == showSaveOptions)&&(identical(other.createNewVersion, createNewVersion) || other.createNewVersion == createNewVersion)&&(identical(other.changeLog, changeLog) || other.changeLog == changeLog)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.originalRecipe, originalRecipe) || other.originalRecipe == originalRecipe)&&const DeepCollectionEquality().equals(other._allVersions, _allVersions));
}


@override
int get hashCode => Object.hash(runtimeType,name,description,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps),saveState,isLoading,isEditMode,recipeId,recipeVersionId,initialVersionId,error,showSaveOptions,createNewVersion,changeLog,versionName,originalRecipe,const DeepCollectionEquality().hash(_allVersions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RecipeEditState(name: $name, description: $description, ingredients: $ingredients, steps: $steps, saveState: $saveState, isLoading: $isLoading, isEditMode: $isEditMode, recipeId: $recipeId, recipeVersionId: $recipeVersionId, initialVersionId: $initialVersionId, error: $error, showSaveOptions: $showSaveOptions, createNewVersion: $createNewVersion, changeLog: $changeLog, versionName: $versionName, originalRecipe: $originalRecipe, allVersions: $allVersions)';
}


}

/// @nodoc
abstract mixin class _$RecipeEditStateCopyWith<$Res> implements $RecipeEditStateCopyWith<$Res> {
  factory _$RecipeEditStateCopyWith(_RecipeEditState value, $Res Function(_RecipeEditState) _then) = __$RecipeEditStateCopyWithImpl;
@override @useResult
$Res call({
 String name, String description, List<IngredientEntity> ingredients, List<StepEntity> steps, AsyncValue<void> saveState, bool isLoading, bool isEditMode, String? recipeId, String? recipeVersionId, String? initialVersionId, String? error, bool showSaveOptions, bool createNewVersion, String changeLog, String versionName, RecipeEntity? originalRecipe, List<RecipeVersionEntity>? allVersions
});


@override $RecipeEntityCopyWith<$Res>? get originalRecipe;

}
/// @nodoc
class __$RecipeEditStateCopyWithImpl<$Res>
    implements _$RecipeEditStateCopyWith<$Res> {
  __$RecipeEditStateCopyWithImpl(this._self, this._then);

  final _RecipeEditState _self;
  final $Res Function(_RecipeEditState) _then;

/// Create a copy of RecipeEditState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = null,Object? ingredients = null,Object? steps = null,Object? saveState = null,Object? isLoading = null,Object? isEditMode = null,Object? recipeId = freezed,Object? recipeVersionId = freezed,Object? initialVersionId = freezed,Object? error = freezed,Object? showSaveOptions = null,Object? createNewVersion = null,Object? changeLog = null,Object? versionName = null,Object? originalRecipe = freezed,Object? allVersions = freezed,}) {
  return _then(_RecipeEditState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientEntity>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepEntity>,saveState: null == saveState ? _self.saveState : saveState // ignore: cast_nullable_to_non_nullable
as AsyncValue<void>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isEditMode: null == isEditMode ? _self.isEditMode : isEditMode // ignore: cast_nullable_to_non_nullable
as bool,recipeId: freezed == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String?,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,initialVersionId: freezed == initialVersionId ? _self.initialVersionId : initialVersionId // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,showSaveOptions: null == showSaveOptions ? _self.showSaveOptions : showSaveOptions // ignore: cast_nullable_to_non_nullable
as bool,createNewVersion: null == createNewVersion ? _self.createNewVersion : createNewVersion // ignore: cast_nullable_to_non_nullable
as bool,changeLog: null == changeLog ? _self.changeLog : changeLog // ignore: cast_nullable_to_non_nullable
as String,versionName: null == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String,originalRecipe: freezed == originalRecipe ? _self.originalRecipe : originalRecipe // ignore: cast_nullable_to_non_nullable
as RecipeEntity?,allVersions: freezed == allVersions ? _self._allVersions : allVersions // ignore: cast_nullable_to_non_nullable
as List<RecipeVersionEntity>?,
  ));
}

/// Create a copy of RecipeEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RecipeEntityCopyWith<$Res>? get originalRecipe {
    if (_self.originalRecipe == null) {
    return null;
  }

  return $RecipeEntityCopyWith<$Res>(_self.originalRecipe!, (value) {
    return _then(_self.copyWith(originalRecipe: value));
  });
}
}

// dart format on
