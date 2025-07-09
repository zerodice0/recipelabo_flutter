// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RecipeEntity {

 String get id; String get authorId; String get latestVersionId; String get name; String? get description; bool get isPublic; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeEntityCopyWith<RecipeEntity> get copyWith => _$RecipeEntityCopyWithImpl<RecipeEntity>(this as RecipeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecipeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.latestVersionId, latestVersionId) || other.latestVersionId == latestVersionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorId,latestVersionId,name,description,isPublic,createdAt,updatedAt);

@override
String toString() {
  return 'RecipeEntity(id: $id, authorId: $authorId, latestVersionId: $latestVersionId, name: $name, description: $description, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $RecipeEntityCopyWith<$Res>  {
  factory $RecipeEntityCopyWith(RecipeEntity value, $Res Function(RecipeEntity) _then) = _$RecipeEntityCopyWithImpl;
@useResult
$Res call({
 String id, String authorId, String latestVersionId, String name, String? description, bool isPublic, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$RecipeEntityCopyWithImpl<$Res>
    implements $RecipeEntityCopyWith<$Res> {
  _$RecipeEntityCopyWithImpl(this._self, this._then);

  final RecipeEntity _self;
  final $Res Function(RecipeEntity) _then;

/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorId = null,Object? latestVersionId = null,Object? name = null,Object? description = freezed,Object? isPublic = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,latestVersionId: null == latestVersionId ? _self.latestVersionId : latestVersionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [RecipeEntity].
extension RecipeEntityPatterns on RecipeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecipeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecipeEntity value)  $default,){
final _that = this;
switch (_that) {
case _RecipeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecipeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String authorId,  String latestVersionId,  String name,  String? description,  bool isPublic,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
return $default(_that.id,_that.authorId,_that.latestVersionId,_that.name,_that.description,_that.isPublic,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String authorId,  String latestVersionId,  String name,  String? description,  bool isPublic,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _RecipeEntity():
return $default(_that.id,_that.authorId,_that.latestVersionId,_that.name,_that.description,_that.isPublic,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String authorId,  String latestVersionId,  String name,  String? description,  bool isPublic,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _RecipeEntity() when $default != null:
return $default(_that.id,_that.authorId,_that.latestVersionId,_that.name,_that.description,_that.isPublic,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc


class _RecipeEntity implements RecipeEntity {
  const _RecipeEntity({required this.id, required this.authorId, required this.latestVersionId, required this.name, this.description, required this.isPublic, required this.createdAt, required this.updatedAt});
  

@override final  String id;
@override final  String authorId;
@override final  String latestVersionId;
@override final  String name;
@override final  String? description;
@override final  bool isPublic;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeEntityCopyWith<_RecipeEntity> get copyWith => __$RecipeEntityCopyWithImpl<_RecipeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecipeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.latestVersionId, latestVersionId) || other.latestVersionId == latestVersionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.isPublic, isPublic) || other.isPublic == isPublic)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorId,latestVersionId,name,description,isPublic,createdAt,updatedAt);

@override
String toString() {
  return 'RecipeEntity(id: $id, authorId: $authorId, latestVersionId: $latestVersionId, name: $name, description: $description, isPublic: $isPublic, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$RecipeEntityCopyWith<$Res> implements $RecipeEntityCopyWith<$Res> {
  factory _$RecipeEntityCopyWith(_RecipeEntity value, $Res Function(_RecipeEntity) _then) = __$RecipeEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String authorId, String latestVersionId, String name, String? description, bool isPublic, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$RecipeEntityCopyWithImpl<$Res>
    implements _$RecipeEntityCopyWith<$Res> {
  __$RecipeEntityCopyWithImpl(this._self, this._then);

  final _RecipeEntity _self;
  final $Res Function(_RecipeEntity) _then;

/// Create a copy of RecipeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorId = null,Object? latestVersionId = null,Object? name = null,Object? description = freezed,Object? isPublic = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_RecipeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,latestVersionId: null == latestVersionId ? _self.latestVersionId : latestVersionId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,isPublic: null == isPublic ? _self.isPublic : isPublic // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
