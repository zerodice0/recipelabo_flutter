// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cooking_log_create_viewmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CookingLogCreateState {
  String get title => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  DateTime? get cookedAt => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  bool get isSaved => throw _privateConstructorUsedError;

  /// Create a copy of CookingLogCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CookingLogCreateStateCopyWith<CookingLogCreateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CookingLogCreateStateCopyWith<$Res> {
  factory $CookingLogCreateStateCopyWith(
    CookingLogCreateState value,
    $Res Function(CookingLogCreateState) then,
  ) = _$CookingLogCreateStateCopyWithImpl<$Res, CookingLogCreateState>;
  @useResult
  $Res call({
    String title,
    String memo,
    String? imageUrl,
    DateTime? cookedAt,
    bool isLoading,
    String? error,
    bool isSaved,
  });
}

/// @nodoc
class _$CookingLogCreateStateCopyWithImpl<
  $Res,
  $Val extends CookingLogCreateState
>
    implements $CookingLogCreateStateCopyWith<$Res> {
  _$CookingLogCreateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CookingLogCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? memo = null,
    Object? imageUrl = freezed,
    Object? cookedAt = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? isSaved = null,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            memo: null == memo
                ? _value.memo
                : memo // ignore: cast_nullable_to_non_nullable
                      as String,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            cookedAt: freezed == cookedAt
                ? _value.cookedAt
                : cookedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            error: freezed == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSaved: null == isSaved
                ? _value.isSaved
                : isSaved // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CookingLogCreateStateImplCopyWith<$Res>
    implements $CookingLogCreateStateCopyWith<$Res> {
  factory _$$CookingLogCreateStateImplCopyWith(
    _$CookingLogCreateStateImpl value,
    $Res Function(_$CookingLogCreateStateImpl) then,
  ) = __$$CookingLogCreateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    String memo,
    String? imageUrl,
    DateTime? cookedAt,
    bool isLoading,
    String? error,
    bool isSaved,
  });
}

/// @nodoc
class __$$CookingLogCreateStateImplCopyWithImpl<$Res>
    extends
        _$CookingLogCreateStateCopyWithImpl<$Res, _$CookingLogCreateStateImpl>
    implements _$$CookingLogCreateStateImplCopyWith<$Res> {
  __$$CookingLogCreateStateImplCopyWithImpl(
    _$CookingLogCreateStateImpl _value,
    $Res Function(_$CookingLogCreateStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CookingLogCreateState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? memo = null,
    Object? imageUrl = freezed,
    Object? cookedAt = freezed,
    Object? isLoading = null,
    Object? error = freezed,
    Object? isSaved = null,
  }) {
    return _then(
      _$CookingLogCreateStateImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        memo: null == memo
            ? _value.memo
            : memo // ignore: cast_nullable_to_non_nullable
                  as String,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        cookedAt: freezed == cookedAt
            ? _value.cookedAt
            : cookedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSaved: null == isSaved
            ? _value.isSaved
            : isSaved // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CookingLogCreateStateImpl implements _CookingLogCreateState {
  const _$CookingLogCreateStateImpl({
    this.title = '',
    this.memo = '',
    this.imageUrl,
    this.cookedAt,
    this.isLoading = false,
    this.error,
    this.isSaved = false,
  });

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String memo;
  @override
  final String? imageUrl;
  @override
  final DateTime? cookedAt;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;
  @override
  @JsonKey()
  final bool isSaved;

  @override
  String toString() {
    return 'CookingLogCreateState(title: $title, memo: $memo, imageUrl: $imageUrl, cookedAt: $cookedAt, isLoading: $isLoading, error: $error, isSaved: $isSaved)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookingLogCreateStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.cookedAt, cookedAt) ||
                other.cookedAt == cookedAt) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    memo,
    imageUrl,
    cookedAt,
    isLoading,
    error,
    isSaved,
  );

  /// Create a copy of CookingLogCreateState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CookingLogCreateStateImplCopyWith<_$CookingLogCreateStateImpl>
  get copyWith =>
      __$$CookingLogCreateStateImplCopyWithImpl<_$CookingLogCreateStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CookingLogCreateState implements CookingLogCreateState {
  const factory _CookingLogCreateState({
    final String title,
    final String memo,
    final String? imageUrl,
    final DateTime? cookedAt,
    final bool isLoading,
    final String? error,
    final bool isSaved,
  }) = _$CookingLogCreateStateImpl;

  @override
  String get title;
  @override
  String get memo;
  @override
  String? get imageUrl;
  @override
  DateTime? get cookedAt;
  @override
  bool get isLoading;
  @override
  String? get error;
  @override
  bool get isSaved;

  /// Create a copy of CookingLogCreateState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CookingLogCreateStateImplCopyWith<_$CookingLogCreateStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
