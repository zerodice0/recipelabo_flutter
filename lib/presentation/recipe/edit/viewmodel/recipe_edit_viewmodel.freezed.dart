// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe_edit_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RecipeEditState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<IngredientEntity> get ingredients => throw _privateConstructorUsedError;
  List<StepEntity> get steps => throw _privateConstructorUsedError;
  AsyncValue<void> get saveState => throw _privateConstructorUsedError;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipeEditStateCopyWith<RecipeEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeEditStateCopyWith<$Res> {
  factory $RecipeEditStateCopyWith(
    RecipeEditState value,
    $Res Function(RecipeEditState) then,
  ) = _$RecipeEditStateCopyWithImpl<$Res, RecipeEditState>;
  @useResult
  $Res call({
    String name,
    String description,
    List<IngredientEntity> ingredients,
    List<StepEntity> steps,
    AsyncValue<void> saveState,
  });
}

/// @nodoc
class _$RecipeEditStateCopyWithImpl<$Res, $Val extends RecipeEditState>
    implements $RecipeEditStateCopyWith<$Res> {
  _$RecipeEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? steps = null,
    Object? saveState = null,
  }) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            ingredients:
                null == ingredients
                    ? _value.ingredients
                    : ingredients // ignore: cast_nullable_to_non_nullable
                        as List<IngredientEntity>,
            steps:
                null == steps
                    ? _value.steps
                    : steps // ignore: cast_nullable_to_non_nullable
                        as List<StepEntity>,
            saveState:
                null == saveState
                    ? _value.saveState
                    : saveState // ignore: cast_nullable_to_non_nullable
                        as AsyncValue<void>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecipeEditStateImplCopyWith<$Res>
    implements $RecipeEditStateCopyWith<$Res> {
  factory _$$RecipeEditStateImplCopyWith(
    _$RecipeEditStateImpl value,
    $Res Function(_$RecipeEditStateImpl) then,
  ) = __$$RecipeEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String description,
    List<IngredientEntity> ingredients,
    List<StepEntity> steps,
    AsyncValue<void> saveState,
  });
}

/// @nodoc
class __$$RecipeEditStateImplCopyWithImpl<$Res>
    extends _$RecipeEditStateCopyWithImpl<$Res, _$RecipeEditStateImpl>
    implements _$$RecipeEditStateImplCopyWith<$Res> {
  __$$RecipeEditStateImplCopyWithImpl(
    _$RecipeEditStateImpl _value,
    $Res Function(_$RecipeEditStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? steps = null,
    Object? saveState = null,
  }) {
    return _then(
      _$RecipeEditStateImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        ingredients:
            null == ingredients
                ? _value._ingredients
                : ingredients // ignore: cast_nullable_to_non_nullable
                    as List<IngredientEntity>,
        steps:
            null == steps
                ? _value._steps
                : steps // ignore: cast_nullable_to_non_nullable
                    as List<StepEntity>,
        saveState:
            null == saveState
                ? _value.saveState
                : saveState // ignore: cast_nullable_to_non_nullable
                    as AsyncValue<void>,
      ),
    );
  }
}

/// @nodoc

class _$RecipeEditStateImpl
    with DiagnosticableTreeMixin
    implements _RecipeEditState {
  const _$RecipeEditStateImpl({
    this.name = '',
    this.description = '',
    final List<IngredientEntity> ingredients = const [],
    final List<StepEntity> steps = const [],
    this.saveState = const AsyncValue.data(null),
  }) : _ingredients = ingredients,
       _steps = steps;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  final List<IngredientEntity> _ingredients;
  @override
  @JsonKey()
  List<IngredientEntity> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<StepEntity> _steps;
  @override
  @JsonKey()
  List<StepEntity> get steps {
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_steps);
  }

  @override
  @JsonKey()
  final AsyncValue<void> saveState;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecipeEditState(name: $name, description: $description, ingredients: $ingredients, steps: $steps, saveState: $saveState)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecipeEditState'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('ingredients', ingredients))
      ..add(DiagnosticsProperty('steps', steps))
      ..add(DiagnosticsProperty('saveState', saveState));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipeEditStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(
              other._ingredients,
              _ingredients,
            ) &&
            const DeepCollectionEquality().equals(other._steps, _steps) &&
            (identical(other.saveState, saveState) ||
                other.saveState == saveState));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    description,
    const DeepCollectionEquality().hash(_ingredients),
    const DeepCollectionEquality().hash(_steps),
    saveState,
  );

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipeEditStateImplCopyWith<_$RecipeEditStateImpl> get copyWith =>
      __$$RecipeEditStateImplCopyWithImpl<_$RecipeEditStateImpl>(
        this,
        _$identity,
      );
}

abstract class _RecipeEditState implements RecipeEditState {
  const factory _RecipeEditState({
    final String name,
    final String description,
    final List<IngredientEntity> ingredients,
    final List<StepEntity> steps,
    final AsyncValue<void> saveState,
  }) = _$RecipeEditStateImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  List<IngredientEntity> get ingredients;
  @override
  List<StepEntity> get steps;
  @override
  AsyncValue<void> get saveState;

  /// Create a copy of RecipeEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipeEditStateImplCopyWith<_$RecipeEditStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
