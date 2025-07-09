// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CookingLogModel {

 String get id; String get recipeVersionId; String get authorId; String get title; String? get memo; String? get base64EncodedImageData; DateTime get cookedAt; DateTime get createdAt; DateTime get updatedAt; bool get isDeleted;
/// Create a copy of CookingLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookingLogModelCopyWith<CookingLogModel> get copyWith => _$CookingLogModelCopyWithImpl<CookingLogModel>(this as CookingLogModel, _$identity);

  /// Serializes this CookingLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookingLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.base64EncodedImageData, base64EncodedImageData) || other.base64EncodedImageData == base64EncodedImageData)&&(identical(other.cookedAt, cookedAt) || other.cookedAt == cookedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,authorId,title,memo,base64EncodedImageData,cookedAt,createdAt,updatedAt,isDeleted);

@override
String toString() {
  return 'CookingLogModel(id: $id, recipeVersionId: $recipeVersionId, authorId: $authorId, title: $title, memo: $memo, base64EncodedImageData: $base64EncodedImageData, cookedAt: $cookedAt, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $CookingLogModelCopyWith<$Res>  {
  factory $CookingLogModelCopyWith(CookingLogModel value, $Res Function(CookingLogModel) _then) = _$CookingLogModelCopyWithImpl;
@useResult
$Res call({
 String id, String recipeVersionId, String authorId, String title, String? memo, String? base64EncodedImageData, DateTime cookedAt, DateTime createdAt, DateTime updatedAt, bool isDeleted
});




}
/// @nodoc
class _$CookingLogModelCopyWithImpl<$Res>
    implements $CookingLogModelCopyWith<$Res> {
  _$CookingLogModelCopyWithImpl(this._self, this._then);

  final CookingLogModel _self;
  final $Res Function(CookingLogModel) _then;

/// Create a copy of CookingLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeVersionId = null,Object? authorId = null,Object? title = null,Object? memo = freezed,Object? base64EncodedImageData = freezed,Object? cookedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: null == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,base64EncodedImageData: freezed == base64EncodedImageData ? _self.base64EncodedImageData : base64EncodedImageData // ignore: cast_nullable_to_non_nullable
as String?,cookedAt: null == cookedAt ? _self.cookedAt : cookedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CookingLogModel].
extension CookingLogModelPatterns on CookingLogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CookingLogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CookingLogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CookingLogModel value)  $default,){
final _that = this;
switch (_that) {
case _CookingLogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CookingLogModel value)?  $default,){
final _that = this;
switch (_that) {
case _CookingLogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String recipeVersionId,  String authorId,  String title,  String? memo,  String? base64EncodedImageData,  DateTime cookedAt,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CookingLogModel() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.authorId,_that.title,_that.memo,_that.base64EncodedImageData,_that.cookedAt,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String recipeVersionId,  String authorId,  String title,  String? memo,  String? base64EncodedImageData,  DateTime cookedAt,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _CookingLogModel():
return $default(_that.id,_that.recipeVersionId,_that.authorId,_that.title,_that.memo,_that.base64EncodedImageData,_that.cookedAt,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String recipeVersionId,  String authorId,  String title,  String? memo,  String? base64EncodedImageData,  DateTime cookedAt,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _CookingLogModel() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.authorId,_that.title,_that.memo,_that.base64EncodedImageData,_that.cookedAt,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CookingLogModel implements CookingLogModel {
  const _CookingLogModel({required this.id, required this.recipeVersionId, required this.authorId, required this.title, this.memo, this.base64EncodedImageData, required this.cookedAt, required this.createdAt, required this.updatedAt, this.isDeleted = false});
  factory _CookingLogModel.fromJson(Map<String, dynamic> json) => _$CookingLogModelFromJson(json);

@override final  String id;
@override final  String recipeVersionId;
@override final  String authorId;
@override final  String title;
@override final  String? memo;
@override final  String? base64EncodedImageData;
@override final  DateTime cookedAt;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of CookingLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookingLogModelCopyWith<_CookingLogModel> get copyWith => __$CookingLogModelCopyWithImpl<_CookingLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CookingLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookingLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.title, title) || other.title == title)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.base64EncodedImageData, base64EncodedImageData) || other.base64EncodedImageData == base64EncodedImageData)&&(identical(other.cookedAt, cookedAt) || other.cookedAt == cookedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,authorId,title,memo,base64EncodedImageData,cookedAt,createdAt,updatedAt,isDeleted);

@override
String toString() {
  return 'CookingLogModel(id: $id, recipeVersionId: $recipeVersionId, authorId: $authorId, title: $title, memo: $memo, base64EncodedImageData: $base64EncodedImageData, cookedAt: $cookedAt, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$CookingLogModelCopyWith<$Res> implements $CookingLogModelCopyWith<$Res> {
  factory _$CookingLogModelCopyWith(_CookingLogModel value, $Res Function(_CookingLogModel) _then) = __$CookingLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String recipeVersionId, String authorId, String title, String? memo, String? base64EncodedImageData, DateTime cookedAt, DateTime createdAt, DateTime updatedAt, bool isDeleted
});




}
/// @nodoc
class __$CookingLogModelCopyWithImpl<$Res>
    implements _$CookingLogModelCopyWith<$Res> {
  __$CookingLogModelCopyWithImpl(this._self, this._then);

  final _CookingLogModel _self;
  final $Res Function(_CookingLogModel) _then;

/// Create a copy of CookingLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeVersionId = null,Object? authorId = null,Object? title = null,Object? memo = freezed,Object? base64EncodedImageData = freezed,Object? cookedAt = null,Object? createdAt = null,Object? updatedAt = null,Object? isDeleted = null,}) {
  return _then(_CookingLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: null == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,memo: freezed == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String?,base64EncodedImageData: freezed == base64EncodedImageData ? _self.base64EncodedImageData : base64EncodedImageData // ignore: cast_nullable_to_non_nullable
as String?,cookedAt: null == cookedAt ? _self.cookedAt : cookedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
