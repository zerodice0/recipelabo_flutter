// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_master_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientMasterEntity {

 String get id; String get name; String get categoryId;// CategoryEntity의 ID 참조
 String? get subCategory;// 세부 카테고리 (예: 단위의 경우 '무게', '부피', '개수', '기타')
 String? get description; DateTime get createdAt; DateTime get updatedAt; int get usageCount;
/// Create a copy of IngredientMasterEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientMasterEntityCopyWith<IngredientMasterEntity> get copyWith => _$IngredientMasterEntityCopyWithImpl<IngredientMasterEntity>(this as IngredientMasterEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientMasterEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,subCategory,description,createdAt,updatedAt,usageCount);

@override
String toString() {
  return 'IngredientMasterEntity(id: $id, name: $name, categoryId: $categoryId, subCategory: $subCategory, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
}


}

/// @nodoc
abstract mixin class $IngredientMasterEntityCopyWith<$Res>  {
  factory $IngredientMasterEntityCopyWith(IngredientMasterEntity value, $Res Function(IngredientMasterEntity) _then) = _$IngredientMasterEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, String categoryId, String? subCategory, String? description, DateTime createdAt, DateTime updatedAt, int usageCount
});




}
/// @nodoc
class _$IngredientMasterEntityCopyWithImpl<$Res>
    implements $IngredientMasterEntityCopyWith<$Res> {
  _$IngredientMasterEntityCopyWithImpl(this._self, this._then);

  final IngredientMasterEntity _self;
  final $Res Function(IngredientMasterEntity) _then;

/// Create a copy of IngredientMasterEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? subCategory = freezed,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? usageCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientMasterEntity].
extension IngredientMasterEntityPatterns on IngredientMasterEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientMasterEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientMasterEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientMasterEntity value)  $default,){
final _that = this;
switch (_that) {
case _IngredientMasterEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientMasterEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientMasterEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String categoryId,  String? subCategory,  String? description,  DateTime createdAt,  DateTime updatedAt,  int usageCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientMasterEntity() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.subCategory,_that.description,_that.createdAt,_that.updatedAt,_that.usageCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String categoryId,  String? subCategory,  String? description,  DateTime createdAt,  DateTime updatedAt,  int usageCount)  $default,) {final _that = this;
switch (_that) {
case _IngredientMasterEntity():
return $default(_that.id,_that.name,_that.categoryId,_that.subCategory,_that.description,_that.createdAt,_that.updatedAt,_that.usageCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String categoryId,  String? subCategory,  String? description,  DateTime createdAt,  DateTime updatedAt,  int usageCount)?  $default,) {final _that = this;
switch (_that) {
case _IngredientMasterEntity() when $default != null:
return $default(_that.id,_that.name,_that.categoryId,_that.subCategory,_that.description,_that.createdAt,_that.updatedAt,_that.usageCount);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientMasterEntity extends IngredientMasterEntity {
  const _IngredientMasterEntity({required this.id, required this.name, required this.categoryId, this.subCategory, this.description, required this.createdAt, required this.updatedAt, this.usageCount = 0}): super._();
  

@override final  String id;
@override final  String name;
@override final  String categoryId;
// CategoryEntity의 ID 참조
@override final  String? subCategory;
// 세부 카테고리 (예: 단위의 경우 '무게', '부피', '개수', '기타')
@override final  String? description;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  int usageCount;

/// Create a copy of IngredientMasterEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientMasterEntityCopyWith<_IngredientMasterEntity> get copyWith => __$IngredientMasterEntityCopyWithImpl<_IngredientMasterEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientMasterEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategory, subCategory) || other.subCategory == subCategory)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.usageCount, usageCount) || other.usageCount == usageCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,categoryId,subCategory,description,createdAt,updatedAt,usageCount);

@override
String toString() {
  return 'IngredientMasterEntity(id: $id, name: $name, categoryId: $categoryId, subCategory: $subCategory, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, usageCount: $usageCount)';
}


}

/// @nodoc
abstract mixin class _$IngredientMasterEntityCopyWith<$Res> implements $IngredientMasterEntityCopyWith<$Res> {
  factory _$IngredientMasterEntityCopyWith(_IngredientMasterEntity value, $Res Function(_IngredientMasterEntity) _then) = __$IngredientMasterEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String categoryId, String? subCategory, String? description, DateTime createdAt, DateTime updatedAt, int usageCount
});




}
/// @nodoc
class __$IngredientMasterEntityCopyWithImpl<$Res>
    implements _$IngredientMasterEntityCopyWith<$Res> {
  __$IngredientMasterEntityCopyWithImpl(this._self, this._then);

  final _IngredientMasterEntity _self;
  final $Res Function(_IngredientMasterEntity) _then;

/// Create a copy of IngredientMasterEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? categoryId = null,Object? subCategory = freezed,Object? description = freezed,Object? createdAt = null,Object? updatedAt = null,Object? usageCount = null,}) {
  return _then(_IngredientMasterEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,subCategory: freezed == subCategory ? _self.subCategory : subCategory // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,usageCount: null == usageCount ? _self.usageCount : usageCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
