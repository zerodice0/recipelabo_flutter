// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$IngredientEntity {
  String get id => throw _privateConstructorUsedError;
  String? get recipeVersionId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientEntityCopyWith<IngredientEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientEntityCopyWith<$Res> {
  factory $IngredientEntityCopyWith(
    IngredientEntity value,
    $Res Function(IngredientEntity) then,
  ) = _$IngredientEntityCopyWithImpl<$Res, IngredientEntity>;
  @useResult
  $Res call({
    String id,
    String? recipeVersionId,
    String name,
    double quantity,
    String unit,
  });
}

/// @nodoc
class _$IngredientEntityCopyWithImpl<$Res, $Val extends IngredientEntity>
    implements $IngredientEntityCopyWith<$Res> {
  _$IngredientEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeVersionId = freezed,
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            recipeVersionId: freezed == recipeVersionId
                ? _value.recipeVersionId
                : recipeVersionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            quantity: null == quantity
                ? _value.quantity
                : quantity // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IngredientEntityImplCopyWith<$Res>
    implements $IngredientEntityCopyWith<$Res> {
  factory _$$IngredientEntityImplCopyWith(
    _$IngredientEntityImpl value,
    $Res Function(_$IngredientEntityImpl) then,
  ) = __$$IngredientEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String? recipeVersionId,
    String name,
    double quantity,
    String unit,
  });
}

/// @nodoc
class __$$IngredientEntityImplCopyWithImpl<$Res>
    extends _$IngredientEntityCopyWithImpl<$Res, _$IngredientEntityImpl>
    implements _$$IngredientEntityImplCopyWith<$Res> {
  __$$IngredientEntityImplCopyWithImpl(
    _$IngredientEntityImpl _value,
    $Res Function(_$IngredientEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recipeVersionId = freezed,
    Object? name = null,
    Object? quantity = null,
    Object? unit = null,
  }) {
    return _then(
      _$IngredientEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        recipeVersionId: freezed == recipeVersionId
            ? _value.recipeVersionId
            : recipeVersionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        quantity: null == quantity
            ? _value.quantity
            : quantity // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$IngredientEntityImpl implements _IngredientEntity {
  const _$IngredientEntityImpl({
    required this.id,
    this.recipeVersionId,
    required this.name,
    required this.quantity,
    required this.unit,
  });

  @override
  final String id;
  @override
  final String? recipeVersionId;
  @override
  final String name;
  @override
  final double quantity;
  @override
  final String unit;

  @override
  String toString() {
    return 'IngredientEntity(id: $id, recipeVersionId: $recipeVersionId, name: $name, quantity: $quantity, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recipeVersionId, recipeVersionId) ||
                other.recipeVersionId == recipeVersionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, recipeVersionId, name, quantity, unit);

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientEntityImplCopyWith<_$IngredientEntityImpl> get copyWith =>
      __$$IngredientEntityImplCopyWithImpl<_$IngredientEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _IngredientEntity implements IngredientEntity {
  const factory _IngredientEntity({
    required final String id,
    final String? recipeVersionId,
    required final String name,
    required final double quantity,
    required final String unit,
  }) = _$IngredientEntityImpl;

  @override
  String get id;
  @override
  String? get recipeVersionId;
  @override
  String get name;
  @override
  double get quantity;
  @override
  String get unit;

  /// Create a copy of IngredientEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientEntityImplCopyWith<_$IngredientEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
