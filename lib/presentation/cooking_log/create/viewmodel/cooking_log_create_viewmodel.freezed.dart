// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_log_create_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CookingLogCreateState {

 String get title; String get memo; String? get base64EncodedImageData; int get overallRating; int get saltinessRating; int get sweetnessRating; int get spicinessRating; int get umamiRating; String get failureReason; String get nextAdjustment; DateTime? get cookedAt; bool get isLoading; String? get error; bool get isSaved;
/// Create a copy of CookingLogCreateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CookingLogCreateStateCopyWith<CookingLogCreateState> get copyWith => _$CookingLogCreateStateCopyWithImpl<CookingLogCreateState>(this as CookingLogCreateState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CookingLogCreateState&&(identical(other.title, title) || other.title == title)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.base64EncodedImageData, base64EncodedImageData) || other.base64EncodedImageData == base64EncodedImageData)&&(identical(other.overallRating, overallRating) || other.overallRating == overallRating)&&(identical(other.saltinessRating, saltinessRating) || other.saltinessRating == saltinessRating)&&(identical(other.sweetnessRating, sweetnessRating) || other.sweetnessRating == sweetnessRating)&&(identical(other.spicinessRating, spicinessRating) || other.spicinessRating == spicinessRating)&&(identical(other.umamiRating, umamiRating) || other.umamiRating == umamiRating)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.nextAdjustment, nextAdjustment) || other.nextAdjustment == nextAdjustment)&&(identical(other.cookedAt, cookedAt) || other.cookedAt == cookedAt)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,title,memo,base64EncodedImageData,overallRating,saltinessRating,sweetnessRating,spicinessRating,umamiRating,failureReason,nextAdjustment,cookedAt,isLoading,error,isSaved);

@override
String toString() {
  return 'CookingLogCreateState(title: $title, memo: $memo, base64EncodedImageData: $base64EncodedImageData, overallRating: $overallRating, saltinessRating: $saltinessRating, sweetnessRating: $sweetnessRating, spicinessRating: $spicinessRating, umamiRating: $umamiRating, failureReason: $failureReason, nextAdjustment: $nextAdjustment, cookedAt: $cookedAt, isLoading: $isLoading, error: $error, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $CookingLogCreateStateCopyWith<$Res>  {
  factory $CookingLogCreateStateCopyWith(CookingLogCreateState value, $Res Function(CookingLogCreateState) _then) = _$CookingLogCreateStateCopyWithImpl;
@useResult
$Res call({
 String title, String memo, String? base64EncodedImageData, int overallRating, int saltinessRating, int sweetnessRating, int spicinessRating, int umamiRating, String failureReason, String nextAdjustment, DateTime? cookedAt, bool isLoading, String? error, bool isSaved
});




}
/// @nodoc
class _$CookingLogCreateStateCopyWithImpl<$Res>
    implements $CookingLogCreateStateCopyWith<$Res> {
  _$CookingLogCreateStateCopyWithImpl(this._self, this._then);

  final CookingLogCreateState _self;
  final $Res Function(CookingLogCreateState) _then;

/// Create a copy of CookingLogCreateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? memo = null,Object? base64EncodedImageData = freezed,Object? overallRating = null,Object? saltinessRating = null,Object? sweetnessRating = null,Object? spicinessRating = null,Object? umamiRating = null,Object? failureReason = null,Object? nextAdjustment = null,Object? cookedAt = freezed,Object? isLoading = null,Object? error = freezed,Object? isSaved = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,base64EncodedImageData: freezed == base64EncodedImageData ? _self.base64EncodedImageData : base64EncodedImageData // ignore: cast_nullable_to_non_nullable
as String?,overallRating: null == overallRating ? _self.overallRating : overallRating // ignore: cast_nullable_to_non_nullable
as int,saltinessRating: null == saltinessRating ? _self.saltinessRating : saltinessRating // ignore: cast_nullable_to_non_nullable
as int,sweetnessRating: null == sweetnessRating ? _self.sweetnessRating : sweetnessRating // ignore: cast_nullable_to_non_nullable
as int,spicinessRating: null == spicinessRating ? _self.spicinessRating : spicinessRating // ignore: cast_nullable_to_non_nullable
as int,umamiRating: null == umamiRating ? _self.umamiRating : umamiRating // ignore: cast_nullable_to_non_nullable
as int,failureReason: null == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String,nextAdjustment: null == nextAdjustment ? _self.nextAdjustment : nextAdjustment // ignore: cast_nullable_to_non_nullable
as String,cookedAt: freezed == cookedAt ? _self.cookedAt : cookedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CookingLogCreateState].
extension CookingLogCreateStatePatterns on CookingLogCreateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CookingLogCreateState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CookingLogCreateState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CookingLogCreateState value)  $default,){
final _that = this;
switch (_that) {
case _CookingLogCreateState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CookingLogCreateState value)?  $default,){
final _that = this;
switch (_that) {
case _CookingLogCreateState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String memo,  String? base64EncodedImageData,  int overallRating,  int saltinessRating,  int sweetnessRating,  int spicinessRating,  int umamiRating,  String failureReason,  String nextAdjustment,  DateTime? cookedAt,  bool isLoading,  String? error,  bool isSaved)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CookingLogCreateState() when $default != null:
return $default(_that.title,_that.memo,_that.base64EncodedImageData,_that.overallRating,_that.saltinessRating,_that.sweetnessRating,_that.spicinessRating,_that.umamiRating,_that.failureReason,_that.nextAdjustment,_that.cookedAt,_that.isLoading,_that.error,_that.isSaved);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String memo,  String? base64EncodedImageData,  int overallRating,  int saltinessRating,  int sweetnessRating,  int spicinessRating,  int umamiRating,  String failureReason,  String nextAdjustment,  DateTime? cookedAt,  bool isLoading,  String? error,  bool isSaved)  $default,) {final _that = this;
switch (_that) {
case _CookingLogCreateState():
return $default(_that.title,_that.memo,_that.base64EncodedImageData,_that.overallRating,_that.saltinessRating,_that.sweetnessRating,_that.spicinessRating,_that.umamiRating,_that.failureReason,_that.nextAdjustment,_that.cookedAt,_that.isLoading,_that.error,_that.isSaved);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String memo,  String? base64EncodedImageData,  int overallRating,  int saltinessRating,  int sweetnessRating,  int spicinessRating,  int umamiRating,  String failureReason,  String nextAdjustment,  DateTime? cookedAt,  bool isLoading,  String? error,  bool isSaved)?  $default,) {final _that = this;
switch (_that) {
case _CookingLogCreateState() when $default != null:
return $default(_that.title,_that.memo,_that.base64EncodedImageData,_that.overallRating,_that.saltinessRating,_that.sweetnessRating,_that.spicinessRating,_that.umamiRating,_that.failureReason,_that.nextAdjustment,_that.cookedAt,_that.isLoading,_that.error,_that.isSaved);case _:
  return null;

}
}

}

/// @nodoc


class _CookingLogCreateState implements CookingLogCreateState {
  const _CookingLogCreateState({this.title = '', this.memo = '', this.base64EncodedImageData, this.overallRating = 0, this.saltinessRating = 0, this.sweetnessRating = 0, this.spicinessRating = 0, this.umamiRating = 0, this.failureReason = '', this.nextAdjustment = '', this.cookedAt, this.isLoading = false, this.error, this.isSaved = false});
  

@override@JsonKey() final  String title;
@override@JsonKey() final  String memo;
@override final  String? base64EncodedImageData;
@override@JsonKey() final  int overallRating;
@override@JsonKey() final  int saltinessRating;
@override@JsonKey() final  int sweetnessRating;
@override@JsonKey() final  int spicinessRating;
@override@JsonKey() final  int umamiRating;
@override@JsonKey() final  String failureReason;
@override@JsonKey() final  String nextAdjustment;
@override final  DateTime? cookedAt;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override@JsonKey() final  bool isSaved;

/// Create a copy of CookingLogCreateState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CookingLogCreateStateCopyWith<_CookingLogCreateState> get copyWith => __$CookingLogCreateStateCopyWithImpl<_CookingLogCreateState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CookingLogCreateState&&(identical(other.title, title) || other.title == title)&&(identical(other.memo, memo) || other.memo == memo)&&(identical(other.base64EncodedImageData, base64EncodedImageData) || other.base64EncodedImageData == base64EncodedImageData)&&(identical(other.overallRating, overallRating) || other.overallRating == overallRating)&&(identical(other.saltinessRating, saltinessRating) || other.saltinessRating == saltinessRating)&&(identical(other.sweetnessRating, sweetnessRating) || other.sweetnessRating == sweetnessRating)&&(identical(other.spicinessRating, spicinessRating) || other.spicinessRating == spicinessRating)&&(identical(other.umamiRating, umamiRating) || other.umamiRating == umamiRating)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.nextAdjustment, nextAdjustment) || other.nextAdjustment == nextAdjustment)&&(identical(other.cookedAt, cookedAt) || other.cookedAt == cookedAt)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode => Object.hash(runtimeType,title,memo,base64EncodedImageData,overallRating,saltinessRating,sweetnessRating,spicinessRating,umamiRating,failureReason,nextAdjustment,cookedAt,isLoading,error,isSaved);

@override
String toString() {
  return 'CookingLogCreateState(title: $title, memo: $memo, base64EncodedImageData: $base64EncodedImageData, overallRating: $overallRating, saltinessRating: $saltinessRating, sweetnessRating: $sweetnessRating, spicinessRating: $spicinessRating, umamiRating: $umamiRating, failureReason: $failureReason, nextAdjustment: $nextAdjustment, cookedAt: $cookedAt, isLoading: $isLoading, error: $error, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class _$CookingLogCreateStateCopyWith<$Res> implements $CookingLogCreateStateCopyWith<$Res> {
  factory _$CookingLogCreateStateCopyWith(_CookingLogCreateState value, $Res Function(_CookingLogCreateState) _then) = __$CookingLogCreateStateCopyWithImpl;
@override @useResult
$Res call({
 String title, String memo, String? base64EncodedImageData, int overallRating, int saltinessRating, int sweetnessRating, int spicinessRating, int umamiRating, String failureReason, String nextAdjustment, DateTime? cookedAt, bool isLoading, String? error, bool isSaved
});




}
/// @nodoc
class __$CookingLogCreateStateCopyWithImpl<$Res>
    implements _$CookingLogCreateStateCopyWith<$Res> {
  __$CookingLogCreateStateCopyWithImpl(this._self, this._then);

  final _CookingLogCreateState _self;
  final $Res Function(_CookingLogCreateState) _then;

/// Create a copy of CookingLogCreateState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? memo = null,Object? base64EncodedImageData = freezed,Object? overallRating = null,Object? saltinessRating = null,Object? sweetnessRating = null,Object? spicinessRating = null,Object? umamiRating = null,Object? failureReason = null,Object? nextAdjustment = null,Object? cookedAt = freezed,Object? isLoading = null,Object? error = freezed,Object? isSaved = null,}) {
  return _then(_CookingLogCreateState(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,memo: null == memo ? _self.memo : memo // ignore: cast_nullable_to_non_nullable
as String,base64EncodedImageData: freezed == base64EncodedImageData ? _self.base64EncodedImageData : base64EncodedImageData // ignore: cast_nullable_to_non_nullable
as String?,overallRating: null == overallRating ? _self.overallRating : overallRating // ignore: cast_nullable_to_non_nullable
as int,saltinessRating: null == saltinessRating ? _self.saltinessRating : saltinessRating // ignore: cast_nullable_to_non_nullable
as int,sweetnessRating: null == sweetnessRating ? _self.sweetnessRating : sweetnessRating // ignore: cast_nullable_to_non_nullable
as int,spicinessRating: null == spicinessRating ? _self.spicinessRating : spicinessRating // ignore: cast_nullable_to_non_nullable
as int,umamiRating: null == umamiRating ? _self.umamiRating : umamiRating // ignore: cast_nullable_to_non_nullable
as int,failureReason: null == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String,nextAdjustment: null == nextAdjustment ? _self.nextAdjustment : nextAdjustment // ignore: cast_nullable_to_non_nullable
as String,cookedAt: freezed == cookedAt ? _self.cookedAt : cookedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
