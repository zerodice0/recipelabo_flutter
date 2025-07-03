// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IngredientSearchState {
  List<String> get availableIngredients => throw _privateConstructorUsedError;
  List<String> get selectedIngredients => throw _privateConstructorUsedError;
  List<RecipeEntity> get filteredRecipes => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearchingRecipes => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of IngredientSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientSearchStateCopyWith<IngredientSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientSearchStateCopyWith<$Res> {
  factory $IngredientSearchStateCopyWith(IngredientSearchState value,
          $Res Function(IngredientSearchState) then) =
      _$IngredientSearchStateCopyWithImpl<$Res, IngredientSearchState>;
  @useResult
  $Res call(
      {List<String> availableIngredients,
      List<String> selectedIngredients,
      List<RecipeEntity> filteredRecipes,
      String searchQuery,
      bool isLoading,
      bool isSearchingRecipes,
      String? error});
}

/// @nodoc
class _$IngredientSearchStateCopyWithImpl<$Res,
        $Val extends IngredientSearchState>
    implements $IngredientSearchStateCopyWith<$Res> {
  _$IngredientSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableIngredients = null,
    Object? selectedIngredients = null,
    Object? filteredRecipes = null,
    Object? searchQuery = null,
    Object? isLoading = null,
    Object? isSearchingRecipes = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      availableIngredients: null == availableIngredients
          ? _value.availableIngredients
          : availableIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedIngredients: null == selectedIngredients
          ? _value.selectedIngredients
          : selectedIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filteredRecipes: null == filteredRecipes
          ? _value.filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeEntity>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchingRecipes: null == isSearchingRecipes
          ? _value.isSearchingRecipes
          : isSearchingRecipes // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientSearchStateImplCopyWith<$Res>
    implements $IngredientSearchStateCopyWith<$Res> {
  factory _$$IngredientSearchStateImplCopyWith(
          _$IngredientSearchStateImpl value,
          $Res Function(_$IngredientSearchStateImpl) then) =
      __$$IngredientSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> availableIngredients,
      List<String> selectedIngredients,
      List<RecipeEntity> filteredRecipes,
      String searchQuery,
      bool isLoading,
      bool isSearchingRecipes,
      String? error});
}

/// @nodoc
class __$$IngredientSearchStateImplCopyWithImpl<$Res>
    extends _$IngredientSearchStateCopyWithImpl<$Res,
        _$IngredientSearchStateImpl>
    implements _$$IngredientSearchStateImplCopyWith<$Res> {
  __$$IngredientSearchStateImplCopyWithImpl(_$IngredientSearchStateImpl _value,
      $Res Function(_$IngredientSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableIngredients = null,
    Object? selectedIngredients = null,
    Object? filteredRecipes = null,
    Object? searchQuery = null,
    Object? isLoading = null,
    Object? isSearchingRecipes = null,
    Object? error = freezed,
  }) {
    return _then(_$IngredientSearchStateImpl(
      availableIngredients: null == availableIngredients
          ? _value._availableIngredients
          : availableIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedIngredients: null == selectedIngredients
          ? _value._selectedIngredients
          : selectedIngredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filteredRecipes: null == filteredRecipes
          ? _value._filteredRecipes
          : filteredRecipes // ignore: cast_nullable_to_non_nullable
              as List<RecipeEntity>,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearchingRecipes: null == isSearchingRecipes
          ? _value.isSearchingRecipes
          : isSearchingRecipes // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IngredientSearchStateImpl implements _IngredientSearchState {
  const _$IngredientSearchStateImpl(
      {final List<String> availableIngredients = const [],
      final List<String> selectedIngredients = const [],
      final List<RecipeEntity> filteredRecipes = const [],
      this.searchQuery = '',
      this.isLoading = false,
      this.isSearchingRecipes = false,
      this.error})
      : _availableIngredients = availableIngredients,
        _selectedIngredients = selectedIngredients,
        _filteredRecipes = filteredRecipes;

  final List<String> _availableIngredients;
  @override
  @JsonKey()
  List<String> get availableIngredients {
    if (_availableIngredients is EqualUnmodifiableListView)
      return _availableIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableIngredients);
  }

  final List<String> _selectedIngredients;
  @override
  @JsonKey()
  List<String> get selectedIngredients {
    if (_selectedIngredients is EqualUnmodifiableListView)
      return _selectedIngredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIngredients);
  }

  final List<RecipeEntity> _filteredRecipes;
  @override
  @JsonKey()
  List<RecipeEntity> get filteredRecipes {
    if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredRecipes);
  }

  @override
  @JsonKey()
  final String searchQuery;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isSearchingRecipes;
  @override
  final String? error;

  @override
  String toString() {
    return 'IngredientSearchState(availableIngredients: $availableIngredients, selectedIngredients: $selectedIngredients, filteredRecipes: $filteredRecipes, searchQuery: $searchQuery, isLoading: $isLoading, isSearchingRecipes: $isSearchingRecipes, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientSearchStateImpl &&
            const DeepCollectionEquality()
                .equals(other._availableIngredients, _availableIngredients) &&
            const DeepCollectionEquality()
                .equals(other._selectedIngredients, _selectedIngredients) &&
            const DeepCollectionEquality()
                .equals(other._filteredRecipes, _filteredRecipes) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearchingRecipes, isSearchingRecipes) ||
                other.isSearchingRecipes == isSearchingRecipes) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_availableIngredients),
      const DeepCollectionEquality().hash(_selectedIngredients),
      const DeepCollectionEquality().hash(_filteredRecipes),
      searchQuery,
      isLoading,
      isSearchingRecipes,
      error);

  /// Create a copy of IngredientSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientSearchStateImplCopyWith<_$IngredientSearchStateImpl>
      get copyWith => __$$IngredientSearchStateImplCopyWithImpl<
          _$IngredientSearchStateImpl>(this, _$identity);
}

abstract class _IngredientSearchState implements IngredientSearchState {
  const factory _IngredientSearchState(
      {final List<String> availableIngredients,
      final List<String> selectedIngredients,
      final List<RecipeEntity> filteredRecipes,
      final String searchQuery,
      final bool isLoading,
      final bool isSearchingRecipes,
      final String? error}) = _$IngredientSearchStateImpl;

  @override
  List<String> get availableIngredients;
  @override
  List<String> get selectedIngredients;
  @override
  List<RecipeEntity> get filteredRecipes;
  @override
  String get searchQuery;
  @override
  bool get isLoading;
  @override
  bool get isSearchingRecipes;
  @override
  String? get error;

  /// Create a copy of IngredientSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientSearchStateImplCopyWith<_$IngredientSearchStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
