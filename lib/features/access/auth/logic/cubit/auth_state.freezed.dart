// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SigninResponse? response) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SigninResponse? response)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SigninResponse? response)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial<T> value) initial,
    required TResult Function(authorized<T> value) authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial<T> value)? initial,
    TResult? Function(authorized<T> value)? authorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial<T> value)? initial,
    TResult Function(authorized<T> value)? authorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<T, $Res> {
  factory $AuthStateCopyWith(
          AuthState<T> value, $Res Function(AuthState<T>) then) =
      _$AuthStateCopyWithImpl<T, $Res, AuthState<T>>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<T, $Res, $Val extends AuthState<T>>
    implements $AuthStateCopyWith<T, $Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$initialImplCopyWith<T, $Res> {
  factory _$$initialImplCopyWith(
          _$initialImpl<T> value, $Res Function(_$initialImpl<T>) then) =
      __$$initialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$initialImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$initialImpl<T>>
    implements _$$initialImplCopyWith<T, $Res> {
  __$$initialImplCopyWithImpl(
      _$initialImpl<T> _value, $Res Function(_$initialImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$initialImpl<T> implements initial<T> {
  const _$initialImpl();

  @override
  String toString() {
    return 'AuthState<$T>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$initialImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SigninResponse? response) authorized,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SigninResponse? response)? authorized,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SigninResponse? response)? authorized,
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
    required TResult Function(initial<T> value) initial,
    required TResult Function(authorized<T> value) authorized,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial<T> value)? initial,
    TResult? Function(authorized<T> value)? authorized,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial<T> value)? initial,
    TResult Function(authorized<T> value)? authorized,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class initial<T> implements AuthState<T> {
  const factory initial() = _$initialImpl<T>;
}

/// @nodoc
abstract class _$$authorizedImplCopyWith<T, $Res> {
  factory _$$authorizedImplCopyWith(
          _$authorizedImpl<T> value, $Res Function(_$authorizedImpl<T>) then) =
      __$$authorizedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({SigninResponse? response});
}

/// @nodoc
class __$$authorizedImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$authorizedImpl<T>>
    implements _$$authorizedImplCopyWith<T, $Res> {
  __$$authorizedImplCopyWithImpl(
      _$authorizedImpl<T> _value, $Res Function(_$authorizedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$authorizedImpl<T>(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as SigninResponse?,
    ));
  }
}

/// @nodoc

class _$authorizedImpl<T> implements authorized<T> {
  const _$authorizedImpl(this.response);

  @override
  final SigninResponse? response;

  @override
  String toString() {
    return 'AuthState<$T>.authorized(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authorizedImpl<T> &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$authorizedImplCopyWith<T, _$authorizedImpl<T>> get copyWith =>
      __$$authorizedImplCopyWithImpl<T, _$authorizedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(SigninResponse? response) authorized,
  }) {
    return authorized(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(SigninResponse? response)? authorized,
  }) {
    return authorized?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(SigninResponse? response)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(initial<T> value) initial,
    required TResult Function(authorized<T> value) authorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(initial<T> value)? initial,
    TResult? Function(authorized<T> value)? authorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(initial<T> value)? initial,
    TResult Function(authorized<T> value)? authorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class authorized<T> implements AuthState<T> {
  const factory authorized(final SigninResponse? response) =
      _$authorizedImpl<T>;

  SigninResponse? get response;
  @JsonKey(ignore: true)
  _$$authorizedImplCopyWith<T, _$authorizedImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
