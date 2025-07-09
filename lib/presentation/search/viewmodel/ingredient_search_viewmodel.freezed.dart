// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_search_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IngredientSearchState {

 List<String> get availableIngredients; List<String> get selectedIngredients; List<RecipeEntity> get filteredRecipes; String get searchQuery; bool get isLoading; bool get isSearchingRecipes; String? get error;
/// Create a copy of IngredientSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientSearchStateCopyWith<IngredientSearchState> get copyWith => _$IngredientSearchStateCopyWithImpl<IngredientSearchState>(this as IngredientSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientSearchState&&const DeepCollectionEquality().equals(other.availableIngredients, availableIngredients)&&const DeepCollectionEquality().equals(other.selectedIngredients, selectedIngredients)&&const DeepCollectionEquality().equals(other.filteredRecipes, filteredRecipes)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSearchingRecipes, isSearchingRecipes) || other.isSearchingRecipes == isSearchingRecipes)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableIngredients),const DeepCollectionEquality().hash(selectedIngredients),const DeepCollectionEquality().hash(filteredRecipes),searchQuery,isLoading,isSearchingRecipes,error);

@override
String toString() {
  return 'IngredientSearchState(availableIngredients: $availableIngredients, selectedIngredients: $selectedIngredients, filteredRecipes: $filteredRecipes, searchQuery: $searchQuery, isLoading: $isLoading, isSearchingRecipes: $isSearchingRecipes, error: $error)';
}


}

/// @nodoc
abstract mixin class $IngredientSearchStateCopyWith<$Res>  {
  factory $IngredientSearchStateCopyWith(IngredientSearchState value, $Res Function(IngredientSearchState) _then) = _$IngredientSearchStateCopyWithImpl;
@useResult
$Res call({
 List<String> availableIngredients, List<String> selectedIngredients, List<RecipeEntity> filteredRecipes, String searchQuery, bool isLoading, bool isSearchingRecipes, String? error
});




}
/// @nodoc
class _$IngredientSearchStateCopyWithImpl<$Res>
    implements $IngredientSearchStateCopyWith<$Res> {
  _$IngredientSearchStateCopyWithImpl(this._self, this._then);

  final IngredientSearchState _self;
  final $Res Function(IngredientSearchState) _then;

/// Create a copy of IngredientSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableIngredients = null,Object? selectedIngredients = null,Object? filteredRecipes = null,Object? searchQuery = null,Object? isLoading = null,Object? isSearchingRecipes = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
availableIngredients: null == availableIngredients ? _self.availableIngredients : availableIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,selectedIngredients: null == selectedIngredients ? _self.selectedIngredients : selectedIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,filteredRecipes: null == filteredRecipes ? _self.filteredRecipes : filteredRecipes // ignore: cast_nullable_to_non_nullable
as List<RecipeEntity>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSearchingRecipes: null == isSearchingRecipes ? _self.isSearchingRecipes : isSearchingRecipes // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientSearchState].
extension IngredientSearchStatePatterns on IngredientSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientSearchState value)  $default,){
final _that = this;
switch (_that) {
case _IngredientSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> availableIngredients,  List<String> selectedIngredients,  List<RecipeEntity> filteredRecipes,  String searchQuery,  bool isLoading,  bool isSearchingRecipes,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientSearchState() when $default != null:
return $default(_that.availableIngredients,_that.selectedIngredients,_that.filteredRecipes,_that.searchQuery,_that.isLoading,_that.isSearchingRecipes,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> availableIngredients,  List<String> selectedIngredients,  List<RecipeEntity> filteredRecipes,  String searchQuery,  bool isLoading,  bool isSearchingRecipes,  String? error)  $default,) {final _that = this;
switch (_that) {
case _IngredientSearchState():
return $default(_that.availableIngredients,_that.selectedIngredients,_that.filteredRecipes,_that.searchQuery,_that.isLoading,_that.isSearchingRecipes,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> availableIngredients,  List<String> selectedIngredients,  List<RecipeEntity> filteredRecipes,  String searchQuery,  bool isLoading,  bool isSearchingRecipes,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _IngredientSearchState() when $default != null:
return $default(_that.availableIngredients,_that.selectedIngredients,_that.filteredRecipes,_that.searchQuery,_that.isLoading,_that.isSearchingRecipes,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _IngredientSearchState implements IngredientSearchState {
  const _IngredientSearchState({final  List<String> availableIngredients = const [], final  List<String> selectedIngredients = const [], final  List<RecipeEntity> filteredRecipes = const [], this.searchQuery = '', this.isLoading = false, this.isSearchingRecipes = false, this.error}): _availableIngredients = availableIngredients,_selectedIngredients = selectedIngredients,_filteredRecipes = filteredRecipes;
  

 final  List<String> _availableIngredients;
@override@JsonKey() List<String> get availableIngredients {
  if (_availableIngredients is EqualUnmodifiableListView) return _availableIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableIngredients);
}

 final  List<String> _selectedIngredients;
@override@JsonKey() List<String> get selectedIngredients {
  if (_selectedIngredients is EqualUnmodifiableListView) return _selectedIngredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedIngredients);
}

 final  List<RecipeEntity> _filteredRecipes;
@override@JsonKey() List<RecipeEntity> get filteredRecipes {
  if (_filteredRecipes is EqualUnmodifiableListView) return _filteredRecipes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredRecipes);
}

@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isSearchingRecipes;
@override final  String? error;

/// Create a copy of IngredientSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientSearchStateCopyWith<_IngredientSearchState> get copyWith => __$IngredientSearchStateCopyWithImpl<_IngredientSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientSearchState&&const DeepCollectionEquality().equals(other._availableIngredients, _availableIngredients)&&const DeepCollectionEquality().equals(other._selectedIngredients, _selectedIngredients)&&const DeepCollectionEquality().equals(other._filteredRecipes, _filteredRecipes)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isSearchingRecipes, isSearchingRecipes) || other.isSearchingRecipes == isSearchingRecipes)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableIngredients),const DeepCollectionEquality().hash(_selectedIngredients),const DeepCollectionEquality().hash(_filteredRecipes),searchQuery,isLoading,isSearchingRecipes,error);

@override
String toString() {
  return 'IngredientSearchState(availableIngredients: $availableIngredients, selectedIngredients: $selectedIngredients, filteredRecipes: $filteredRecipes, searchQuery: $searchQuery, isLoading: $isLoading, isSearchingRecipes: $isSearchingRecipes, error: $error)';
}


}

/// @nodoc
abstract mixin class _$IngredientSearchStateCopyWith<$Res> implements $IngredientSearchStateCopyWith<$Res> {
  factory _$IngredientSearchStateCopyWith(_IngredientSearchState value, $Res Function(_IngredientSearchState) _then) = __$IngredientSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> availableIngredients, List<String> selectedIngredients, List<RecipeEntity> filteredRecipes, String searchQuery, bool isLoading, bool isSearchingRecipes, String? error
});




}
/// @nodoc
class __$IngredientSearchStateCopyWithImpl<$Res>
    implements _$IngredientSearchStateCopyWith<$Res> {
  __$IngredientSearchStateCopyWithImpl(this._self, this._then);

  final _IngredientSearchState _self;
  final $Res Function(_IngredientSearchState) _then;

/// Create a copy of IngredientSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableIngredients = null,Object? selectedIngredients = null,Object? filteredRecipes = null,Object? searchQuery = null,Object? isLoading = null,Object? isSearchingRecipes = null,Object? error = freezed,}) {
  return _then(_IngredientSearchState(
availableIngredients: null == availableIngredients ? _self._availableIngredients : availableIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,selectedIngredients: null == selectedIngredients ? _self._selectedIngredients : selectedIngredients // ignore: cast_nullable_to_non_nullable
as List<String>,filteredRecipes: null == filteredRecipes ? _self._filteredRecipes : filteredRecipes // ignore: cast_nullable_to_non_nullable
as List<RecipeEntity>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isSearchingRecipes: null == isSearchingRecipes ? _self.isSearchingRecipes : isSearchingRecipes // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
