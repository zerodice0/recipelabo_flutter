// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_version_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RecipeVersionModel {

 String get id; String get recipeId; int get versionNumber; String get name; String? get versionName;// 사용자 정의 버전명
 String get description; List<IngredientModel> get ingredients; List<StepModel> get steps; String get authorId; DateTime get createdAt; DateTime get updatedAt; bool get isDeleted; String? get changeLog; String? get baseVersionId;
/// Create a copy of RecipeVersionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeVersionModelCopyWith<RecipeVersionModel> get copyWith => _$RecipeVersionModelCopyWithImpl<RecipeVersionModel>(this as RecipeVersionModel, _$identity);

  /// Serializes this RecipeVersionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeVersionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.changeLog, changeLog) || other.changeLog == changeLog)&&(identical(other.baseVersionId, baseVersionId) || other.baseVersionId == baseVersionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeId,versionNumber,name,versionName,description,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps),authorId,createdAt,updatedAt,isDeleted,changeLog,baseVersionId);

@override
String toString() {
  return 'RecipeVersionModel(id: $id, recipeId: $recipeId, versionNumber: $versionNumber, name: $name, versionName: $versionName, description: $description, ingredients: $ingredients, steps: $steps, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, changeLog: $changeLog, baseVersionId: $baseVersionId)';
}


}

/// @nodoc
abstract mixin class $RecipeVersionModelCopyWith<$Res>  {
  factory $RecipeVersionModelCopyWith(RecipeVersionModel value, $Res Function(RecipeVersionModel) _then) = _$RecipeVersionModelCopyWithImpl;
@useResult
$Res call({
 String id, String recipeId, int versionNumber, String name, String? versionName, String description, List<IngredientModel> ingredients, List<StepModel> steps, String authorId, DateTime createdAt, DateTime updatedAt, bool isDeleted, String? changeLog, String? baseVersionId
});




}
/// @nodoc
class _$RecipeVersionModelCopyWithImpl<$Res>
    implements $RecipeVersionModelCopyWith<$Res> {
  _$RecipeVersionModelCopyWithImpl(this._self, this._then);

  final RecipeVersionModel _self;
  final $Res Function(RecipeVersionModel) _then;

/// Create a copy of RecipeVersionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeId = null,Object? versionNumber = null,Object? name = null,Object? versionName = freezed,Object? description = null,Object? ingredients = null,Object? steps = null,Object? authorId = null,Object? createdAt = null,Object? updatedAt = null,Object? isDeleted = null,Object? changeLog = freezed,Object? baseVersionId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,versionName: freezed == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientModel>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepModel>,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,changeLog: freezed == changeLog ? _self.changeLog : changeLog // ignore: cast_nullable_to_non_nullable
as String?,baseVersionId: freezed == baseVersionId ? _self.baseVersionId : baseVersionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeVersionModel].
extension RecipeVersionModelPatterns on RecipeVersionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeVersionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeVersionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeVersionModel value)  $default,){
final _that = this;
switch (_that) {
case _RecipeVersionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeVersionModel value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeVersionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipeId,  int versionNumber,  String name,  String? versionName,  String description,  List<IngredientModel> ingredients,  List<StepModel> steps,  String authorId,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted,  String? changeLog,  String? baseVersionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeVersionModel() when $default != null:
return $default(_that.id,_that.recipeId,_that.versionNumber,_that.name,_that.versionName,_that.description,_that.ingredients,_that.steps,_that.authorId,_that.createdAt,_that.updatedAt,_that.isDeleted,_that.changeLog,_that.baseVersionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipeId,  int versionNumber,  String name,  String? versionName,  String description,  List<IngredientModel> ingredients,  List<StepModel> steps,  String authorId,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted,  String? changeLog,  String? baseVersionId)  $default,) {final _that = this;
switch (_that) {
case _RecipeVersionModel():
return $default(_that.id,_that.recipeId,_that.versionNumber,_that.name,_that.versionName,_that.description,_that.ingredients,_that.steps,_that.authorId,_that.createdAt,_that.updatedAt,_that.isDeleted,_that.changeLog,_that.baseVersionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipeId,  int versionNumber,  String name,  String? versionName,  String description,  List<IngredientModel> ingredients,  List<StepModel> steps,  String authorId,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted,  String? changeLog,  String? baseVersionId)?  $default,) {final _that = this;
switch (_that) {
case _RecipeVersionModel() when $default != null:
return $default(_that.id,_that.recipeId,_that.versionNumber,_that.name,_that.versionName,_that.description,_that.ingredients,_that.steps,_that.authorId,_that.createdAt,_that.updatedAt,_that.isDeleted,_that.changeLog,_that.baseVersionId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecipeVersionModel implements RecipeVersionModel {
  const _RecipeVersionModel({required this.id, required this.recipeId, required this.versionNumber, required this.name, this.versionName, required this.description, required final  List<IngredientModel> ingredients, required final  List<StepModel> steps, required this.authorId, required this.createdAt, required this.updatedAt, this.isDeleted = false, this.changeLog, this.baseVersionId}): _ingredients = ingredients,_steps = steps;
  factory _RecipeVersionModel.fromJson(Map<String, dynamic> json) => _$RecipeVersionModelFromJson(json);

@override final  String id;
@override final  String recipeId;
@override final  int versionNumber;
@override final  String name;
@override final  String? versionName;
// 사용자 정의 버전명
@override final  String description;
 final  List<IngredientModel> _ingredients;
@override List<IngredientModel> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<StepModel> _steps;
@override List<StepModel> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  String authorId;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isDeleted;
@override final  String? changeLog;
@override final  String? baseVersionId;

/// Create a copy of RecipeVersionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeVersionModelCopyWith<_RecipeVersionModel> get copyWith => __$RecipeVersionModelCopyWithImpl<_RecipeVersionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeVersionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeVersionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.changeLog, changeLog) || other.changeLog == changeLog)&&(identical(other.baseVersionId, baseVersionId) || other.baseVersionId == baseVersionId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeId,versionNumber,name,versionName,description,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps),authorId,createdAt,updatedAt,isDeleted,changeLog,baseVersionId);

@override
String toString() {
  return 'RecipeVersionModel(id: $id, recipeId: $recipeId, versionNumber: $versionNumber, name: $name, versionName: $versionName, description: $description, ingredients: $ingredients, steps: $steps, authorId: $authorId, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted, changeLog: $changeLog, baseVersionId: $baseVersionId)';
}


}

/// @nodoc
abstract mixin class _$RecipeVersionModelCopyWith<$Res> implements $RecipeVersionModelCopyWith<$Res> {
  factory _$RecipeVersionModelCopyWith(_RecipeVersionModel value, $Res Function(_RecipeVersionModel) _then) = __$RecipeVersionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipeId, int versionNumber, String name, String? versionName, String description, List<IngredientModel> ingredients, List<StepModel> steps, String authorId, DateTime createdAt, DateTime updatedAt, bool isDeleted, String? changeLog, String? baseVersionId
});




}
/// @nodoc
class __$RecipeVersionModelCopyWithImpl<$Res>
    implements _$RecipeVersionModelCopyWith<$Res> {
  __$RecipeVersionModelCopyWithImpl(this._self, this._then);

  final _RecipeVersionModel _self;
  final $Res Function(_RecipeVersionModel) _then;

/// Create a copy of RecipeVersionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeId = null,Object? versionNumber = null,Object? name = null,Object? versionName = freezed,Object? description = null,Object? ingredients = null,Object? steps = null,Object? authorId = null,Object? createdAt = null,Object? updatedAt = null,Object? isDeleted = null,Object? changeLog = freezed,Object? baseVersionId = freezed,}) {
  return _then(_RecipeVersionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,versionName: freezed == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientModel>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepModel>,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,changeLog: freezed == changeLog ? _self.changeLog : changeLog // ignore: cast_nullable_to_non_nullable
as String?,baseVersionId: freezed == baseVersionId ? _self.baseVersionId : baseVersionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
