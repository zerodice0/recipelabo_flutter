// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_log_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CookingLogEntity {

 String get id; String get recipeVersionId; String get authorId; String get title; String? get memo; String? get imageUrl; DateTime get cookedAt; DateTime get createdAt;
/// Create a copy of CookingLogEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookingLogEntityCopyWith<CookingLogEntity> get copyWith => _$CookingLogEntityCopyWithImpl<CookingLogEntity>(this as CookingLogEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookingLogEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.cookedAt, cookedAt) || other.cookedAt == cookedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,authorId,title,memo,imageUrl,cookedAt,createdAt);

@override
String toString() {
  return 'CookingLogEntity(id: $id, recipeVersionId: $recipeVersionId, authorId: $authorId, title: $title, memo: $memo, imageUrl: $imageUrl, cookedAt: $cookedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CookingLogEntityCopyWith<$Res>  {
  factory $CookingLogEntityCopyWith(CookingLogEntity value, $Res Function(CookingLogEntity) _then) = _$CookingLogEntityCopyWithImpl;
@useResult
$Res call({
 String id, String recipeVersionId, String authorId, String title, String? memo, String? imageUrl, DateTime cookedAt, DateTime createdAt
});




}
/// @nodoc
class _$CookingLogEntityCopyWithImpl<$Res>
    implements $CookingLogEntityCopyWith<$Res> {
  _$CookingLogEntityCopyWithImpl(this._self, this._then);

  final CookingLogEntity _self;
  final $Res Function(CookingLogEntity) _then;

/// Create a copy of CookingLogEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeVersionId = null,Object? authorId = null,Object? title = null,Object? memo = freezed,Object? imageUrl = freezed,Object? cookedAt = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: null == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,cookedAt: null == cookedAt ? _self.cookedAt : cookedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [CookingLogEntity].
extension CookingLogEntityPatterns on CookingLogEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CookingLogEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CookingLogEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CookingLogEntity value)  $default,){
final _that = this;
switch (_that) {
case _CookingLogEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CookingLogEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CookingLogEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipeVersionId,  String authorId,  String title,  String? memo,  String? imageUrl,  DateTime cookedAt,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CookingLogEntity() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.authorId,_that.title,_that.memo,_that.imageUrl,_that.cookedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipeVersionId,  String authorId,  String title,  String? memo,  String? imageUrl,  DateTime cookedAt,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _CookingLogEntity():
return $default(_that.id,_that.recipeVersionId,_that.authorId,_that.title,_that.memo,_that.imageUrl,_that.cookedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipeVersionId,  String authorId,  String title,  String? memo,  String? imageUrl,  DateTime cookedAt,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CookingLogEntity() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.authorId,_that.title,_that.memo,_that.imageUrl,_that.cookedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _CookingLogEntity implements CookingLogEntity {
  const _CookingLogEntity({required this.id, required this.recipeVersionId, required this.authorId, required this.title, this.memo, this.imageUrl, required this.cookedAt, required this.createdAt});
  

@override final  String id;
@override final  String recipeVersionId;
@override final  String authorId;
@override final  String title;
@override final  String? memo;
@override final  String? imageUrl;
@override final  DateTime cookedAt;
@override final  DateTime createdAt;

/// Create a copy of CookingLogEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookingLogEntityCopyWith<_CookingLogEntity> get copyWith => __$CookingLogEntityCopyWithImpl<_CookingLogEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookingLogEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.cookedAt, cookedAt) || other.cookedAt == cookedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,authorId,title,memo,imageUrl,cookedAt,createdAt);

@override
String toString() {
  return 'CookingLogEntity(id: $id, recipeVersionId: $recipeVersionId, authorId: $authorId, title: $title, memo: $memo, imageUrl: $imageUrl, cookedAt: $cookedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CookingLogEntityCopyWith<$Res> implements $CookingLogEntityCopyWith<$Res> {
  factory _$CookingLogEntityCopyWith(_CookingLogEntity value, $Res Function(_CookingLogEntity) _then) = __$CookingLogEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipeVersionId, String authorId, String title, String? memo, String? imageUrl, DateTime cookedAt, DateTime createdAt
});




}
/// @nodoc
class __$CookingLogEntityCopyWithImpl<$Res>
    implements _$CookingLogEntityCopyWith<$Res> {
  __$CookingLogEntityCopyWithImpl(this._self, this._then);

  final _CookingLogEntity _self;
  final $Res Function(_CookingLogEntity) _then;

/// Create a copy of CookingLogEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeVersionId = null,Object? authorId = null,Object? title = null,Object? memo = freezed,Object? imageUrl = freezed,Object? cookedAt = null,Object? createdAt = null,}) {
  return _then(_CookingLogEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: null == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,cookedAt: null == cookedAt ? _self.cookedAt : cookedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
