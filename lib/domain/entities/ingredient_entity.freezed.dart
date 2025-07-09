// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientEntity {

 String get id; String? get recipeVersionId; String get name; double get quantity; String get unit;
/// Create a copy of IngredientEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientEntityCopyWith<IngredientEntity> get copyWith => _$IngredientEntityCopyWithImpl<IngredientEntity>(this as IngredientEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,name,quantity,unit);

@override
String toString() {
  return 'IngredientEntity(id: $id, recipeVersionId: $recipeVersionId, name: $name, quantity: $quantity, unit: $unit)';
}


}

/// @nodoc
abstract mixin class $IngredientEntityCopyWith<$Res>  {
  factory $IngredientEntityCopyWith(IngredientEntity value, $Res Function(IngredientEntity) _then) = _$IngredientEntityCopyWithImpl;
@useResult
$Res call({
 String id, String? recipeVersionId, String name, double quantity, String unit
});




}
/// @nodoc
class _$IngredientEntityCopyWithImpl<$Res>
    implements $IngredientEntityCopyWith<$Res> {
  _$IngredientEntityCopyWithImpl(this._self, this._then);

  final IngredientEntity _self;
  final $Res Function(IngredientEntity) _then;

/// Create a copy of IngredientEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? recipeVersionId = freezed,Object? name = null,Object? quantity = null,Object? unit = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientEntity].
extension IngredientEntityPatterns on IngredientEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientEntity value)  $default,){
final _that = this;
switch (_that) {
case _IngredientEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientEntity value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? recipeVersionId,  String name,  double quantity,  String unit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientEntity() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.name,_that.quantity,_that.unit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? recipeVersionId,  String name,  double quantity,  String unit)  $default,) {final _that = this;
switch (_that) {
case _IngredientEntity():
return $default(_that.id,_that.recipeVersionId,_that.name,_that.quantity,_that.unit);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? recipeVersionId,  String name,  double quantity,  String unit)?  $default,) {final _that = this;
switch (_that) {
case _IngredientEntity() when $default != null:
return $default(_that.id,_that.recipeVersionId,_that.name,_that.quantity,_that.unit);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientEntity implements IngredientEntity {
  const _IngredientEntity({required this.id, this.recipeVersionId, required this.name, required this.quantity, required this.unit});
  

@override final  String id;
@override final  String? recipeVersionId;
@override final  String name;
@override final  double quantity;
@override final  String unit;

/// Create a copy of IngredientEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientEntityCopyWith<_IngredientEntity> get copyWith => __$IngredientEntityCopyWithImpl<_IngredientEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.recipeVersionId, recipeVersionId) || other.recipeVersionId == recipeVersionId)&&(identical(other.name, name) || other.name == name)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unit, unit) || other.unit == unit));
}


@override
int get hashCode => Object.hash(runtimeType,id,recipeVersionId,name,quantity,unit);

@override
String toString() {
  return 'IngredientEntity(id: $id, recipeVersionId: $recipeVersionId, name: $name, quantity: $quantity, unit: $unit)';
}


}

/// @nodoc
abstract mixin class _$IngredientEntityCopyWith<$Res> implements $IngredientEntityCopyWith<$Res> {
  factory _$IngredientEntityCopyWith(_IngredientEntity value, $Res Function(_IngredientEntity) _then) = __$IngredientEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String? recipeVersionId, String name, double quantity, String unit
});




}
/// @nodoc
class __$IngredientEntityCopyWithImpl<$Res>
    implements _$IngredientEntityCopyWith<$Res> {
  __$IngredientEntityCopyWithImpl(this._self, this._then);

  final _IngredientEntity _self;
  final $Res Function(_IngredientEntity) _then;

/// Create a copy of IngredientEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? recipeVersionId = freezed,Object? name = null,Object? quantity = null,Object? unit = null,}) {
  return _then(_IngredientEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,recipeVersionId: freezed == recipeVersionId ? _self.recipeVersionId : recipeVersionId // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
