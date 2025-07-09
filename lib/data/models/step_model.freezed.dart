// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StepModel {

 String get id; String? get recipeVersionId; int get stepNumber; String get description; String? get imageUrl; DateTime get createdAt; DateTime get updatedAt; bool get isDeleted;
/// Create a copy of StepModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StepModelCopyWith<StepModel> get copyWith => _$StepModelCopyWithImpl<StepModel>(this as StepModel, _$identity);

  /// Serializes this StepModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StepModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,stepNumber,description,imageUrl,createdAt,updatedAt,isDeleted);

@override
String toString() {
  return 'StepModel(id: $id, recipeVersionId: $recipeVersionId, stepNumber: $stepNumber, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class $StepModelCopyWith<$Res>  {
  factory $StepModelCopyWith(StepModel value, $Res Function(StepModel) _then) = _$StepModelCopyWithImpl;
@useResult
$Res call({
 String id, String? recipeVersionId, int stepNumber, String description, String? imageUrl, DateTime createdAt, DateTime updatedAt, bool isDeleted
});




}
/// @nodoc
class _$StepModelCopyWithImpl<$Res>
    implements $StepModelCopyWith<$Res> {
  _$StepModelCopyWithImpl(this._self, this._then);

  final StepModel _self;
  final $Res Function(StepModel) _then;

/// Create a copy of StepModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeVersionId = freezed,Object? stepNumber = null,Object? description = null,Object? imageUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isDeleted = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [StepModel].
extension StepModelPatterns on StepModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StepModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StepModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StepModel value)  $default,){
final _that = this;
switch (_that) {
case _StepModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StepModel value)?  $default,){
final _that = this;
switch (_that) {
case _StepModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? recipeVersionId,  int stepNumber,  String description,  String? imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StepModel() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.stepNumber,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? recipeVersionId,  int stepNumber,  String description,  String? imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted)  $default,) {final _that = this;
switch (_that) {
case _StepModel():
return $default(_that.id,_that.recipeVersionId,_that.stepNumber,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? recipeVersionId,  int stepNumber,  String description,  String? imageUrl,  DateTime createdAt,  DateTime updatedAt,  bool isDeleted)?  $default,) {final _that = this;
switch (_that) {
case _StepModel() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.stepNumber,_that.description,_that.imageUrl,_that.createdAt,_that.updatedAt,_that.isDeleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StepModel implements StepModel {
  const _StepModel({required this.id, this.recipeVersionId, required this.stepNumber, required this.description, this.imageUrl, required this.createdAt, required this.updatedAt, this.isDeleted = false});
  factory _StepModel.fromJson(Map<String, dynamic> json) => _$StepModelFromJson(json);

@override final  String id;
@override final  String? recipeVersionId;
@override final  int stepNumber;
@override final  String description;
@override final  String? imageUrl;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override@JsonKey() final  bool isDeleted;

/// Create a copy of StepModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StepModelCopyWith<_StepModel> get copyWith => __$StepModelCopyWithImpl<_StepModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StepModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StepModel&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.stepNumber, stepNumber) || other.stepNumber == stepNumber)&&(identical(other.description, description) || other.description == description)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,stepNumber,description,imageUrl,createdAt,updatedAt,isDeleted);

@override
String toString() {
  return 'StepModel(id: $id, recipeVersionId: $recipeVersionId, stepNumber: $stepNumber, description: $description, imageUrl: $imageUrl, createdAt: $createdAt, updatedAt: $updatedAt, isDeleted: $isDeleted)';
}


}

/// @nodoc
abstract mixin class _$StepModelCopyWith<$Res> implements $StepModelCopyWith<$Res> {
  factory _$StepModelCopyWith(_StepModel value, $Res Function(_StepModel) _then) = __$StepModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? recipeVersionId, int stepNumber, String description, String? imageUrl, DateTime createdAt, DateTime updatedAt, bool isDeleted
});




}
/// @nodoc
class __$StepModelCopyWithImpl<$Res>
    implements _$StepModelCopyWith<$Res> {
  __$StepModelCopyWithImpl(this._self, this._then);

  final _StepModel _self;
  final $Res Function(_StepModel) _then;

/// Create a copy of StepModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeVersionId = freezed,Object? stepNumber = null,Object? description = null,Object? imageUrl = freezed,Object? createdAt = null,Object? updatedAt = null,Object? isDeleted = null,}) {
  return _then(_StepModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,stepNumber: null == stepNumber ? _self.stepNumber : stepNumber // ignore: cast_nullable_to_non_nullable
as int,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
