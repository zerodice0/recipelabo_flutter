// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seasoning_management_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SeasoningManagementState {

 List<IngredientMasterEntity> get seasonings;// 현재 표시되는 데이터
 List<IngredientMasterEntity> get allSeasonings;// 원본 전체 데이터
 List<String> get categories; String get searchQuery; String? get selectedCategory; bool get isLoading; bool get isCreating; String? get error;
/// Create a copy of SeasoningManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasoningManagementStateCopyWith<SeasoningManagementState> get copyWith => _$SeasoningManagementStateCopyWithImpl<SeasoningManagementState>(this as SeasoningManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasoningManagementState&&const DeepCollectionEquality().equals(other.seasonings, seasonings)&&const DeepCollectionEquality().equals(other.allSeasonings, allSeasonings)&&const DeepCollectionEquality().equals(other.categories, categories)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(seasonings),const DeepCollectionEquality().hash(allSeasonings),const DeepCollectionEquality().hash(categories),searchQuery,selectedCategory,isLoading,isCreating,error);

@override
String toString() {
  return 'SeasoningManagementState(seasonings: $seasonings, allSeasonings: $allSeasonings, categories: $categories, searchQuery: $searchQuery, selectedCategory: $selectedCategory, isLoading: $isLoading, isCreating: $isCreating, error: $error)';
}


}

/// @nodoc
abstract mixin class $SeasoningManagementStateCopyWith<$Res>  {
  factory $SeasoningManagementStateCopyWith(SeasoningManagementState value, $Res Function(SeasoningManagementState) _then) = _$SeasoningManagementStateCopyWithImpl;
@useResult
$Res call({
 List<IngredientMasterEntity> seasonings, List<IngredientMasterEntity> allSeasonings, List<String> categories, String searchQuery, String? selectedCategory, bool isLoading, bool isCreating, String? error
});




}
/// @nodoc
class _$SeasoningManagementStateCopyWithImpl<$Res>
    implements $SeasoningManagementStateCopyWith<$Res> {
  _$SeasoningManagementStateCopyWithImpl(this._self, this._then);

  final SeasoningManagementState _self;
  final $Res Function(SeasoningManagementState) _then;

/// Create a copy of SeasoningManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? seasonings = null,Object? allSeasonings = null,Object? categories = null,Object? searchQuery = null,Object? selectedCategory = freezed,Object? isLoading = null,Object? isCreating = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
seasonings: null == seasonings ? _self.seasonings : seasonings // ignore: cast_nullable_to_non_nullable
as List<IngredientMasterEntity>,allSeasonings: null == allSeasonings ? _self.allSeasonings : allSeasonings // ignore: cast_nullable_to_non_nullable
as List<IngredientMasterEntity>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasoningManagementState].
extension SeasoningManagementStatePatterns on SeasoningManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasoningManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasoningManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasoningManagementState value)  $default,){
final _that = this;
switch (_that) {
case _SeasoningManagementState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasoningManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _SeasoningManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<IngredientMasterEntity> seasonings,  List<IngredientMasterEntity> allSeasonings,  List<String> categories,  String searchQuery,  String? selectedCategory,  bool isLoading,  bool isCreating,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasoningManagementState() when $default != null:
return $default(_that.seasonings,_that.allSeasonings,_that.categories,_that.searchQuery,_that.selectedCategory,_that.isLoading,_that.isCreating,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<IngredientMasterEntity> seasonings,  List<IngredientMasterEntity> allSeasonings,  List<String> categories,  String searchQuery,  String? selectedCategory,  bool isLoading,  bool isCreating,  String? error)  $default,) {final _that = this;
switch (_that) {
case _SeasoningManagementState():
return $default(_that.seasonings,_that.allSeasonings,_that.categories,_that.searchQuery,_that.selectedCategory,_that.isLoading,_that.isCreating,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<IngredientMasterEntity> seasonings,  List<IngredientMasterEntity> allSeasonings,  List<String> categories,  String searchQuery,  String? selectedCategory,  bool isLoading,  bool isCreating,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _SeasoningManagementState() when $default != null:
return $default(_that.seasonings,_that.allSeasonings,_that.categories,_that.searchQuery,_that.selectedCategory,_that.isLoading,_that.isCreating,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _SeasoningManagementState implements SeasoningManagementState {
  const _SeasoningManagementState({final  List<IngredientMasterEntity> seasonings = const [], final  List<IngredientMasterEntity> allSeasonings = const [], final  List<String> categories = const [], this.searchQuery = '', this.selectedCategory, this.isLoading = false, this.isCreating = false, this.error}): _seasonings = seasonings,_allSeasonings = allSeasonings,_categories = categories;
  

 final  List<IngredientMasterEntity> _seasonings;
@override@JsonKey() List<IngredientMasterEntity> get seasonings {
  if (_seasonings is EqualUnmodifiableListView) return _seasonings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_seasonings);
}

// 현재 표시되는 데이터
 final  List<IngredientMasterEntity> _allSeasonings;
// 현재 표시되는 데이터
@override@JsonKey() List<IngredientMasterEntity> get allSeasonings {
  if (_allSeasonings is EqualUnmodifiableListView) return _allSeasonings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allSeasonings);
}

// 원본 전체 데이터
 final  List<String> _categories;
// 원본 전체 데이터
@override@JsonKey() List<String> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

@override@JsonKey() final  String searchQuery;
@override final  String? selectedCategory;
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isCreating;
@override final  String? error;

/// Create a copy of SeasoningManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasoningManagementStateCopyWith<_SeasoningManagementState> get copyWith => __$SeasoningManagementStateCopyWithImpl<_SeasoningManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasoningManagementState&&const DeepCollectionEquality().equals(other._seasonings, _seasonings)&&const DeepCollectionEquality().equals(other._allSeasonings, _allSeasonings)&&const DeepCollectionEquality().equals(other._categories, _categories)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isCreating, isCreating) || other.isCreating == isCreating)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_seasonings),const DeepCollectionEquality().hash(_allSeasonings),const DeepCollectionEquality().hash(_categories),searchQuery,selectedCategory,isLoading,isCreating,error);

@override
String toString() {
  return 'SeasoningManagementState(seasonings: $seasonings, allSeasonings: $allSeasonings, categories: $categories, searchQuery: $searchQuery, selectedCategory: $selectedCategory, isLoading: $isLoading, isCreating: $isCreating, error: $error)';
}


}

/// @nodoc
abstract mixin class _$SeasoningManagementStateCopyWith<$Res> implements $SeasoningManagementStateCopyWith<$Res> {
  factory _$SeasoningManagementStateCopyWith(_SeasoningManagementState value, $Res Function(_SeasoningManagementState) _then) = __$SeasoningManagementStateCopyWithImpl;
@override @useResult
$Res call({
 List<IngredientMasterEntity> seasonings, List<IngredientMasterEntity> allSeasonings, List<String> categories, String searchQuery, String? selectedCategory, bool isLoading, bool isCreating, String? error
});




}
/// @nodoc
class __$SeasoningManagementStateCopyWithImpl<$Res>
    implements _$SeasoningManagementStateCopyWith<$Res> {
  __$SeasoningManagementStateCopyWithImpl(this._self, this._then);

  final _SeasoningManagementState _self;
  final $Res Function(_SeasoningManagementState) _then;

/// Create a copy of SeasoningManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? seasonings = null,Object? allSeasonings = null,Object? categories = null,Object? searchQuery = null,Object? selectedCategory = freezed,Object? isLoading = null,Object? isCreating = null,Object? error = freezed,}) {
  return _then(_SeasoningManagementState(
seasonings: null == seasonings ? _self._seasonings : seasonings // ignore: cast_nullable_to_non_nullable
as List<IngredientMasterEntity>,allSeasonings: null == allSeasonings ? _self._allSeasonings : allSeasonings // ignore: cast_nullable_to_non_nullable
as List<IngredientMasterEntity>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<String>,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,selectedCategory: freezed == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isCreating: null == isCreating ? _self.isCreating : isCreating // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
