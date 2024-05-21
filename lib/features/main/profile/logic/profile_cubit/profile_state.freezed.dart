// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileInformationLoading,
    required TResult Function(T data) profileInformationSuccess,
    required TResult Function(String error) profileInformationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileInformationLoading,
    TResult? Function(T data)? profileInformationSuccess,
    TResult? Function(String error)? profileInformationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileInformationLoading,
    TResult Function(T data)? profileInformationSuccess,
    TResult Function(String error)? profileInformationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileInformationLoading<T> value)
        profileInformationLoading,
    required TResult Function(ProfileInformationSuccess<T> value)
        profileInformationSuccess,
    required TResult Function(ProfileInformationError<T> value)
        profileInformationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult? Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult? Function(ProfileInformationError<T> value)?
        profileInformationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult Function(ProfileInformationError<T> value)? profileInformationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<T, $Res> {
  factory $ProfileStateCopyWith(
          ProfileState<T> value, $Res Function(ProfileState<T>) then) =
      _$ProfileStateCopyWithImpl<T, $Res, ProfileState<T>>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<T, $Res, $Val extends ProfileState<T>>
    implements $ProfileStateCopyWith<T, $Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
    implements _$$InitialImplCopyWith<T, $Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl<T> _value, $Res Function(_$InitialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl<T> implements _Initial<T> {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileInformationLoading,
    required TResult Function(T data) profileInformationSuccess,
    required TResult Function(String error) profileInformationError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileInformationLoading,
    TResult? Function(T data)? profileInformationSuccess,
    TResult? Function(String error)? profileInformationError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileInformationLoading,
    TResult Function(T data)? profileInformationSuccess,
    TResult Function(String error)? profileInformationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileInformationLoading<T> value)
        profileInformationLoading,
    required TResult Function(ProfileInformationSuccess<T> value)
        profileInformationSuccess,
    required TResult Function(ProfileInformationError<T> value)
        profileInformationError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult? Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult? Function(ProfileInformationError<T> value)?
        profileInformationError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult Function(ProfileInformationError<T> value)? profileInformationError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements ProfileState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$ProfileInformationLoadingImplCopyWith<T, $Res> {
  factory _$$ProfileInformationLoadingImplCopyWith(
          _$ProfileInformationLoadingImpl<T> value,
          $Res Function(_$ProfileInformationLoadingImpl<T>) then) =
      __$$ProfileInformationLoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$ProfileInformationLoadingImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res,
        _$ProfileInformationLoadingImpl<T>>
    implements _$$ProfileInformationLoadingImplCopyWith<T, $Res> {
  __$$ProfileInformationLoadingImplCopyWithImpl(
      _$ProfileInformationLoadingImpl<T> _value,
      $Res Function(_$ProfileInformationLoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileInformationLoadingImpl<T>
    implements ProfileInformationLoading<T> {
  const _$ProfileInformationLoadingImpl();

  @override
  String toString() {
    return 'ProfileState<$T>.profileInformationLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileInformationLoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileInformationLoading,
    required TResult Function(T data) profileInformationSuccess,
    required TResult Function(String error) profileInformationError,
  }) {
    return profileInformationLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileInformationLoading,
    TResult? Function(T data)? profileInformationSuccess,
    TResult? Function(String error)? profileInformationError,
  }) {
    return profileInformationLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileInformationLoading,
    TResult Function(T data)? profileInformationSuccess,
    TResult Function(String error)? profileInformationError,
    required TResult orElse(),
  }) {
    if (profileInformationLoading != null) {
      return profileInformationLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileInformationLoading<T> value)
        profileInformationLoading,
    required TResult Function(ProfileInformationSuccess<T> value)
        profileInformationSuccess,
    required TResult Function(ProfileInformationError<T> value)
        profileInformationError,
  }) {
    return profileInformationLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult? Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult? Function(ProfileInformationError<T> value)?
        profileInformationError,
  }) {
    return profileInformationLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult Function(ProfileInformationError<T> value)? profileInformationError,
    required TResult orElse(),
  }) {
    if (profileInformationLoading != null) {
      return profileInformationLoading(this);
    }
    return orElse();
  }
}

abstract class ProfileInformationLoading<T> implements ProfileState<T> {
  const factory ProfileInformationLoading() =
      _$ProfileInformationLoadingImpl<T>;
}

/// @nodoc
abstract class _$$ProfileInformationSuccessImplCopyWith<T, $Res> {
  factory _$$ProfileInformationSuccessImplCopyWith(
          _$ProfileInformationSuccessImpl<T> value,
          $Res Function(_$ProfileInformationSuccessImpl<T>) then) =
      __$$ProfileInformationSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ProfileInformationSuccessImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res,
        _$ProfileInformationSuccessImpl<T>>
    implements _$$ProfileInformationSuccessImplCopyWith<T, $Res> {
  __$$ProfileInformationSuccessImplCopyWithImpl(
      _$ProfileInformationSuccessImpl<T> _value,
      $Res Function(_$ProfileInformationSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ProfileInformationSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ProfileInformationSuccessImpl<T>
    implements ProfileInformationSuccess<T> {
  const _$ProfileInformationSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'ProfileState<$T>.profileInformationSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileInformationSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileInformationSuccessImplCopyWith<T,
          _$ProfileInformationSuccessImpl<T>>
      get copyWith => __$$ProfileInformationSuccessImplCopyWithImpl<T,
          _$ProfileInformationSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileInformationLoading,
    required TResult Function(T data) profileInformationSuccess,
    required TResult Function(String error) profileInformationError,
  }) {
    return profileInformationSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileInformationLoading,
    TResult? Function(T data)? profileInformationSuccess,
    TResult? Function(String error)? profileInformationError,
  }) {
    return profileInformationSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileInformationLoading,
    TResult Function(T data)? profileInformationSuccess,
    TResult Function(String error)? profileInformationError,
    required TResult orElse(),
  }) {
    if (profileInformationSuccess != null) {
      return profileInformationSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileInformationLoading<T> value)
        profileInformationLoading,
    required TResult Function(ProfileInformationSuccess<T> value)
        profileInformationSuccess,
    required TResult Function(ProfileInformationError<T> value)
        profileInformationError,
  }) {
    return profileInformationSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult? Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult? Function(ProfileInformationError<T> value)?
        profileInformationError,
  }) {
    return profileInformationSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult Function(ProfileInformationError<T> value)? profileInformationError,
    required TResult orElse(),
  }) {
    if (profileInformationSuccess != null) {
      return profileInformationSuccess(this);
    }
    return orElse();
  }
}

abstract class ProfileInformationSuccess<T> implements ProfileState<T> {
  const factory ProfileInformationSuccess(final T data) =
      _$ProfileInformationSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ProfileInformationSuccessImplCopyWith<T,
          _$ProfileInformationSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileInformationErrorImplCopyWith<T, $Res> {
  factory _$$ProfileInformationErrorImplCopyWith(
          _$ProfileInformationErrorImpl<T> value,
          $Res Function(_$ProfileInformationErrorImpl<T>) then) =
      __$$ProfileInformationErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ProfileInformationErrorImplCopyWithImpl<T, $Res>
    extends _$ProfileStateCopyWithImpl<T, $Res,
        _$ProfileInformationErrorImpl<T>>
    implements _$$ProfileInformationErrorImplCopyWith<T, $Res> {
  __$$ProfileInformationErrorImplCopyWithImpl(
      _$ProfileInformationErrorImpl<T> _value,
      $Res Function(_$ProfileInformationErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ProfileInformationErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ProfileInformationErrorImpl<T> implements ProfileInformationError<T> {
  const _$ProfileInformationErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'ProfileState<$T>.profileInformationError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileInformationErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileInformationErrorImplCopyWith<T, _$ProfileInformationErrorImpl<T>>
      get copyWith => __$$ProfileInformationErrorImplCopyWithImpl<T,
          _$ProfileInformationErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() profileInformationLoading,
    required TResult Function(T data) profileInformationSuccess,
    required TResult Function(String error) profileInformationError,
  }) {
    return profileInformationError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? profileInformationLoading,
    TResult? Function(T data)? profileInformationSuccess,
    TResult? Function(String error)? profileInformationError,
  }) {
    return profileInformationError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? profileInformationLoading,
    TResult Function(T data)? profileInformationSuccess,
    TResult Function(String error)? profileInformationError,
    required TResult orElse(),
  }) {
    if (profileInformationError != null) {
      return profileInformationError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(ProfileInformationLoading<T> value)
        profileInformationLoading,
    required TResult Function(ProfileInformationSuccess<T> value)
        profileInformationSuccess,
    required TResult Function(ProfileInformationError<T> value)
        profileInformationError,
  }) {
    return profileInformationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult? Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult? Function(ProfileInformationError<T> value)?
        profileInformationError,
  }) {
    return profileInformationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(ProfileInformationLoading<T> value)?
        profileInformationLoading,
    TResult Function(ProfileInformationSuccess<T> value)?
        profileInformationSuccess,
    TResult Function(ProfileInformationError<T> value)? profileInformationError,
    required TResult orElse(),
  }) {
    if (profileInformationError != null) {
      return profileInformationError(this);
    }
    return orElse();
  }
}

abstract class ProfileInformationError<T> implements ProfileState<T> {
  const factory ProfileInformationError({required final String error}) =
      _$ProfileInformationErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$ProfileInformationErrorImplCopyWith<T, _$ProfileInformationErrorImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
