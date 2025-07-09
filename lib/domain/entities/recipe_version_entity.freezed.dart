// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_version_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeVersionEntity {

 String get id; String get recipeId; int get versionNumber; String get name;// 레시피 이름 (모든 버전에서 동일)
 String? get versionName;// 사용자 정의 버전명 (예: "라볶이", "설탕 대체제")
 String get description; List<IngredientEntity> get ingredients; List<StepEntity> get steps; String get authorId; DateTime get createdAt; String? get changeLog; String? get baseVersionId;
/// Create a copy of RecipeVersionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeVersionEntityCopyWith<RecipeVersionEntity> get copyWith => _$RecipeVersionEntityCopyWithImpl<RecipeVersionEntity>(this as RecipeVersionEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeVersionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.steps, steps)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.changeLog, changeLog) || other.changeLog == changeLog)&&(identical(other.baseVersionId, baseVersionId) || other.baseVersionId == baseVersionId));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeId,versionNumber,name,versionName,description,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(steps),authorId,createdAt,changeLog,baseVersionId);

@override
String toString() {
  return 'RecipeVersionEntity(id: $id, recipeId: $recipeId, versionNumber: $versionNumber, name: $name, versionName: $versionName, description: $description, ingredients: $ingredients, steps: $steps, authorId: $authorId, createdAt: $createdAt, changeLog: $changeLog, baseVersionId: $baseVersionId)';
}


}

/// @nodoc
abstract mixin class $RecipeVersionEntityCopyWith<$Res>  {
  factory $RecipeVersionEntityCopyWith(RecipeVersionEntity value, $Res Function(RecipeVersionEntity) _then) = _$RecipeVersionEntityCopyWithImpl;
@useResult
$Res call({
 String id, String recipeId, int versionNumber, String name, String? versionName, String description, List<IngredientEntity> ingredients, List<StepEntity> steps, String authorId, DateTime createdAt, String? changeLog, String? baseVersionId
});




}
/// @nodoc
class _$RecipeVersionEntityCopyWithImpl<$Res>
    implements $RecipeVersionEntityCopyWith<$Res> {
  _$RecipeVersionEntityCopyWithImpl(this._self, this._then);

  final RecipeVersionEntity _self;
  final $Res Function(RecipeVersionEntity) _then;

/// Create a copy of RecipeVersionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeId = null,Object? versionNumber = null,Object? name = null,Object? versionName = freezed,Object? description = null,Object? ingredients = null,Object? steps = null,Object? authorId = null,Object? createdAt = null,Object? changeLog = freezed,Object? baseVersionId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,versionName: freezed == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientEntity>,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepEntity>,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,changeLog: freezed == changeLog ? _self.changeLog : changeLog // ignore: cast_nullable_to_non_nullable
as String?,baseVersionId: freezed == baseVersionId ? _self.baseVersionId : baseVersionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeVersionEntity].
extension RecipeVersionEntityPatterns on RecipeVersionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeVersionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeVersionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeVersionEntity value)  $default,){
final _that = this;
switch (_that) {
case _RecipeVersionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeVersionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeVersionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipeId,  int versionNumber,  String name,  String? versionName,  String description,  List<IngredientEntity> ingredients,  List<StepEntity> steps,  String authorId,  DateTime createdAt,  String? changeLog,  String? baseVersionId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeVersionEntity() when $default != null:
return $default(_that.id,_that.recipeId,_that.versionNumber,_that.name,_that.versionName,_that.description,_that.ingredients,_that.steps,_that.authorId,_that.createdAt,_that.changeLog,_that.baseVersionId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipeId,  int versionNumber,  String name,  String? versionName,  String description,  List<IngredientEntity> ingredients,  List<StepEntity> steps,  String authorId,  DateTime createdAt,  String? changeLog,  String? baseVersionId)  $default,) {final _that = this;
switch (_that) {
case _RecipeVersionEntity():
return $default(_that.id,_that.recipeId,_that.versionNumber,_that.name,_that.versionName,_that.description,_that.ingredients,_that.steps,_that.authorId,_that.createdAt,_that.changeLog,_that.baseVersionId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipeId,  int versionNumber,  String name,  String? versionName,  String description,  List<IngredientEntity> ingredients,  List<StepEntity> steps,  String authorId,  DateTime createdAt,  String? changeLog,  String? baseVersionId)?  $default,) {final _that = this;
switch (_that) {
case _RecipeVersionEntity() when $default != null:
return $default(_that.id,_that.recipeId,_that.versionNumber,_that.name,_that.versionName,_that.description,_that.ingredients,_that.steps,_that.authorId,_that.createdAt,_that.changeLog,_that.baseVersionId);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeVersionEntity extends RecipeVersionEntity {
  const _RecipeVersionEntity({required this.id, required this.recipeId, required this.versionNumber, required this.name, this.versionName, required this.description, required final  List<IngredientEntity> ingredients, required final  List<StepEntity> steps, required this.authorId, required this.createdAt, this.changeLog, this.baseVersionId}): _ingredients = ingredients,_steps = steps,super._();
  

@override final  String id;
@override final  String recipeId;
@override final  int versionNumber;
@override final  String name;
// 레시피 이름 (모든 버전에서 동일)
@override final  String? versionName;
// 사용자 정의 버전명 (예: "라볶이", "설탕 대체제")
@override final  String description;
 final  List<IngredientEntity> _ingredients;
@override List<IngredientEntity> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<StepEntity> _steps;
@override List<StepEntity> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

@override final  String authorId;
@override final  DateTime createdAt;
@override final  String? changeLog;
@override final  String? baseVersionId;

/// Create a copy of RecipeVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeVersionEntityCopyWith<_RecipeVersionEntity> get copyWith => __$RecipeVersionEntityCopyWithImpl<_RecipeVersionEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeVersionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeId, recipeId) || other.recipeId == recipeId)&&(identical(other.versionNumber, versionNumber) || other.versionNumber == versionNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.versionName, versionName) || other.versionName == versionName)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._steps, _steps)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.changeLog, changeLog) || other.changeLog == changeLog)&&(identical(other.baseVersionId, baseVersionId) || other.baseVersionId == baseVersionId));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeId,versionNumber,name,versionName,description,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_steps),authorId,createdAt,changeLog,baseVersionId);

@override
String toString() {
  return 'RecipeVersionEntity(id: $id, recipeId: $recipeId, versionNumber: $versionNumber, name: $name, versionName: $versionName, description: $description, ingredients: $ingredients, steps: $steps, authorId: $authorId, createdAt: $createdAt, changeLog: $changeLog, baseVersionId: $baseVersionId)';
}


}

/// @nodoc
abstract mixin class _$RecipeVersionEntityCopyWith<$Res> implements $RecipeVersionEntityCopyWith<$Res> {
  factory _$RecipeVersionEntityCopyWith(_RecipeVersionEntity value, $Res Function(_RecipeVersionEntity) _then) = __$RecipeVersionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipeId, int versionNumber, String name, String? versionName, String description, List<IngredientEntity> ingredients, List<StepEntity> steps, String authorId, DateTime createdAt, String? changeLog, String? baseVersionId
});




}
/// @nodoc
class __$RecipeVersionEntityCopyWithImpl<$Res>
    implements _$RecipeVersionEntityCopyWith<$Res> {
  __$RecipeVersionEntityCopyWithImpl(this._self, this._then);

  final _RecipeVersionEntity _self;
  final $Res Function(_RecipeVersionEntity) _then;

/// Create a copy of RecipeVersionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeId = null,Object? versionNumber = null,Object? name = null,Object? versionName = freezed,Object? description = null,Object? ingredients = null,Object? steps = null,Object? authorId = null,Object? createdAt = null,Object? changeLog = freezed,Object? baseVersionId = freezed,}) {
  return _then(_RecipeVersionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeId: null == recipeId ? _self.recipeId : recipeId // ignore: cast_nullable_to_non_nullable
as String,versionNumber: null == versionNumber ? _self.versionNumber : versionNumber // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,versionName: freezed == versionName ? _self.versionName : versionName // ignore: cast_nullable_to_non_nullable
as String?,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientEntity>,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<StepEntity>,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,changeLog: freezed == changeLog ? _self.changeLog : changeLog // ignore: cast_nullable_to_non_nullable
as String?,baseVersionId: freezed == baseVersionId ? _self.baseVersionId : baseVersionId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
