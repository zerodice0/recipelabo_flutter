// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_master_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientMasterModel {

 String get id; String get name; String get categoryId; String? get category;// 마이그레이션 기간 동안 임시 유지
 String? get subCategory;// 세부 카테고리
 String? get description; String get createdAt; String get updatedAt; int get usageCount;
/// Create a copy of IngredientMasterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientMasterModelCopyWith<IngredientMasterModel> get copyWith => _$IngredientMasterModelCopyWithImpl<IngredientMasterModel>(this as IngredientMasterModel, _$identity);

  /// Serializes this IngredientMasterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientMasterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,category,subCategory,description,createdAt,updatedAt,usageCount);

@override
String toString() {
  return 'IngredientMasterModel(id: $id, name: $name, categoryId: $categoryId, category: $category, subCategory: $subCategory, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
}


}

/// @nodoc
abstract mixin class $IngredientMasterModelCopyWith<$Res>  {
  factory $IngredientMasterModelCopyWith(IngredientMasterModel value, $Res Function(IngredientMasterModel) _then) = _$IngredientMasterModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String categoryId, String? category, String? subCategory, String? description, String createdAt, String updatedAt, int usageCount
});




}
/// @nodoc
class _$IngredientMasterModelCopyWithImpl<$Res>
    implements $IngredientMasterModelCopyWith<$Res> {
  _$IngredientMasterModelCopyWithImpl(this._self, this._then);

  final IngredientMasterModel _self;
  final $Res Function(IngredientMasterModel) _then;

/// Create a copy of IngredientMasterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? category = freezed,Object? subCategory = freezed,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? usageCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientMasterModel].
extension IngredientMasterModelPatterns on IngredientMasterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientMasterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientMasterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientMasterModel value)  $default,){
final _that = this;
switch (_that) {
case _IngredientMasterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientMasterModel value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientMasterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String categoryId,  String? category,  String? subCategory,  String? description,  String createdAt,  String updatedAt,  int usageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientMasterModel() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.category,_that.subCategory,_that.description,_that.createdAt,_that.updatedAt,_that.usageCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String categoryId,  String? category,  String? subCategory,  String? description,  String createdAt,  String updatedAt,  int usageCount)  $default,) {final _that = this;
switch (_that) {
case _IngredientMasterModel():
return $default(_that.id,_that.name,_that.categoryId,_that.category,_that.subCategory,_that.description,_that.createdAt,_that.updatedAt,_that.usageCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String categoryId,  String? category,  String? subCategory,  String? description,  String createdAt,  String updatedAt,  int usageCount)?  $default,) {final _that = this;
switch (_that) {
case _IngredientMasterModel() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.category,_that.subCategory,_that.description,_that.createdAt,_that.updatedAt,_that.usageCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IngredientMasterModel implements IngredientMasterModel {
  const _IngredientMasterModel({required this.id, required this.name, required this.categoryId, this.category, this.subCategory, this.description, required this.createdAt, required this.updatedAt, this.usageCount = 0});
  factory _IngredientMasterModel.fromJson(Map<String, dynamic> json) => _$IngredientMasterModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String categoryId;
@override final  String? category;
// 마이그레이션 기간 동안 임시 유지
@override final  String? subCategory;
// 세부 카테고리
@override final  String? description;
@override final  String createdAt;
@override final  String updatedAt;
@override@JsonKey() final  int usageCount;

/// Create a copy of IngredientMasterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientMasterModelCopyWith<_IngredientMasterModel> get copyWith => __$IngredientMasterModelCopyWithImpl<_IngredientMasterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientMasterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientMasterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,category,subCategory,description,createdAt,updatedAt,usageCount);

@override
String toString() {
  return 'IngredientMasterModel(id: $id, name: $name, categoryId: $categoryId, category: $category, subCategory: $subCategory, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
}


}

/// @nodoc
abstract mixin class _$IngredientMasterModelCopyWith<$Res> implements $IngredientMasterModelCopyWith<$Res> {
  factory _$IngredientMasterModelCopyWith(_IngredientMasterModel value, $Res Function(_IngredientMasterModel) _then) = __$IngredientMasterModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String categoryId, String? category, String? subCategory, String? description, String createdAt, String updatedAt, int usageCount
});




}
/// @nodoc
class __$IngredientMasterModelCopyWithImpl<$Res>
    implements _$IngredientMasterModelCopyWith<$Res> {
  __$IngredientMasterModelCopyWithImpl(this._self, this._then);

  final _IngredientMasterModel _self;
  final $Res Function(_IngredientMasterModel) _then;

/// Create a copy of IngredientMasterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? category = freezed,Object? subCategory = freezed,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? usageCount = null,}) {
  return _then(_IngredientMasterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
