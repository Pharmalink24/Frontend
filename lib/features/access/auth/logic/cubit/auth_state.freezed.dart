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
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
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
abstract class _$$InitialImplCopyWith<T, $Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl<T> value, $Res Function(_$InitialImpl<T>) then) =
      __$$InitialImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'AuthState<$T>.initial()';
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
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
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
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements AuthState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$accessTokenAuthImplCopyWith<T, $Res> {
  factory _$$accessTokenAuthImplCopyWith(_$accessTokenAuthImpl<T> value,
          $Res Function(_$accessTokenAuthImpl<T>) then) =
      __$$accessTokenAuthImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String? token});
}

/// @nodoc
class __$$accessTokenAuthImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$accessTokenAuthImpl<T>>
    implements _$$accessTokenAuthImplCopyWith<T, $Res> {
  __$$accessTokenAuthImplCopyWithImpl(_$accessTokenAuthImpl<T> _value,
      $Res Function(_$accessTokenAuthImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
  }) {
    return _then(_$accessTokenAuthImpl<T>(
      freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$accessTokenAuthImpl<T> implements accessTokenAuth<T> {
  const _$accessTokenAuthImpl(this.token);

  @override
  final String? token;

  @override
  String toString() {
    return 'AuthState<$T>.accessTokenAuth(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$accessTokenAuthImpl<T> &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$accessTokenAuthImplCopyWith<T, _$accessTokenAuthImpl<T>> get copyWith =>
      __$$accessTokenAuthImplCopyWithImpl<T, _$accessTokenAuthImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) {
    return accessTokenAuth(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) {
    return accessTokenAuth?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (accessTokenAuth != null) {
      return accessTokenAuth(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) {
    return accessTokenAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) {
    return accessTokenAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (accessTokenAuth != null) {
      return accessTokenAuth(this);
    }
    return orElse();
  }
}

abstract class accessTokenAuth<T> implements AuthState<T> {
  const factory accessTokenAuth(final String? token) = _$accessTokenAuthImpl<T>;

  String? get token;
  @JsonKey(ignore: true)
  _$$accessTokenAuthImplCopyWith<T, _$accessTokenAuthImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$authorizationImplCopyWith<T, $Res> {
  factory _$$authorizationImplCopyWith(_$authorizationImpl<T> value,
          $Res Function(_$authorizationImpl<T>) then) =
      __$$authorizationImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({SigninResponse? userAuth});
}

/// @nodoc
class __$$authorizationImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$authorizationImpl<T>>
    implements _$$authorizationImplCopyWith<T, $Res> {
  __$$authorizationImplCopyWithImpl(_$authorizationImpl<T> _value,
      $Res Function(_$authorizationImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAuth = freezed,
  }) {
    return _then(_$authorizationImpl<T>(
      freezed == userAuth
          ? _value.userAuth
          : userAuth // ignore: cast_nullable_to_non_nullable
              as SigninResponse?,
    ));
  }
}

/// @nodoc

class _$authorizationImpl<T> implements authorization<T> {
  const _$authorizationImpl(this.userAuth);

  @override
  final SigninResponse? userAuth;

  @override
  String toString() {
    return 'AuthState<$T>.authorization(userAuth: $userAuth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$authorizationImpl<T> &&
            (identical(other.userAuth, userAuth) ||
                other.userAuth == userAuth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userAuth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$authorizationImplCopyWith<T, _$authorizationImpl<T>> get copyWith =>
      __$$authorizationImplCopyWithImpl<T, _$authorizationImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) {
    return authorization(userAuth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) {
    return authorization?.call(userAuth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(userAuth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) {
    return authorization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) {
    return authorization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(this);
    }
    return orElse();
  }
}

abstract class authorization<T> implements AuthState<T> {
  const factory authorization(final SigninResponse? userAuth) =
      _$authorizationImpl<T>;

  SigninResponse? get userAuth;
  @JsonKey(ignore: true)
  _$$authorizationImplCopyWith<T, _$authorizationImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loggedInImplCopyWith<T, $Res> {
  factory _$$loggedInImplCopyWith(
          _$loggedInImpl<T> value, $Res Function(_$loggedInImpl<T>) then) =
      __$$loggedInImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isLogged});
}

/// @nodoc
class __$$loggedInImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$loggedInImpl<T>>
    implements _$$loggedInImplCopyWith<T, $Res> {
  __$$loggedInImplCopyWithImpl(
      _$loggedInImpl<T> _value, $Res Function(_$loggedInImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogged = null,
  }) {
    return _then(_$loggedInImpl<T>(
      null == isLogged
          ? _value.isLogged
          : isLogged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$loggedInImpl<T> implements loggedIn<T> {
  const _$loggedInImpl(this.isLogged);

  @override
  final bool isLogged;

  @override
  String toString() {
    return 'AuthState<$T>.loggedIn(isLogged: $isLogged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loggedInImpl<T> &&
            (identical(other.isLogged, isLogged) ||
                other.isLogged == isLogged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLogged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loggedInImplCopyWith<T, _$loggedInImpl<T>> get copyWith =>
      __$$loggedInImplCopyWithImpl<T, _$loggedInImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) {
    return loggedIn(isLogged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) {
    return loggedIn?.call(isLogged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(isLogged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class loggedIn<T> implements AuthState<T> {
  const factory loggedIn(final bool isLogged) = _$loggedInImpl<T>;

  bool get isLogged;
  @JsonKey(ignore: true)
  _$$loggedInImplCopyWith<T, _$loggedInImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$loggedOutImplCopyWith<T, $Res> {
  factory _$$loggedOutImplCopyWith(
          _$loggedOutImpl<T> value, $Res Function(_$loggedOutImpl<T>) then) =
      __$$loggedOutImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({bool isLogged});
}

/// @nodoc
class __$$loggedOutImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$loggedOutImpl<T>>
    implements _$$loggedOutImplCopyWith<T, $Res> {
  __$$loggedOutImplCopyWithImpl(
      _$loggedOutImpl<T> _value, $Res Function(_$loggedOutImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLogged = null,
  }) {
    return _then(_$loggedOutImpl<T>(
      null == isLogged
          ? _value.isLogged
          : isLogged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$loggedOutImpl<T> implements loggedOut<T> {
  const _$loggedOutImpl(this.isLogged);

  @override
  final bool isLogged;

  @override
  String toString() {
    return 'AuthState<$T>.loggedOut(isLogged: $isLogged)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$loggedOutImpl<T> &&
            (identical(other.isLogged, isLogged) ||
                other.isLogged == isLogged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLogged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$loggedOutImplCopyWith<T, _$loggedOutImpl<T>> get copyWith =>
      __$$loggedOutImplCopyWithImpl<T, _$loggedOutImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) {
    return loggedOut(isLogged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) {
    return loggedOut?.call(isLogged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(isLogged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class loggedOut<T> implements AuthState<T> {
  const factory loggedOut(final bool isLogged) = _$loggedOutImpl<T>;

  bool get isLogged;
  @JsonKey(ignore: true)
  _$$loggedOutImplCopyWith<T, _$loggedOutImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<T, $Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl<T> value, $Res Function(_$ErrorImpl<T>) then) =
      __$$ErrorImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<T, $Res>
    extends _$AuthStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
    implements _$$ErrorImplCopyWith<T, $Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl<T> _value, $Res Function(_$ErrorImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl<T>(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl<T> implements Error<T> {
  const _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'AuthState<$T>.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl<T> &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      __$$ErrorImplCopyWithImpl<T, _$ErrorImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String? token) accessTokenAuth,
    required TResult Function(SigninResponse? userAuth) authorization,
    required TResult Function(bool isLogged) loggedIn,
    required TResult Function(bool isLogged) loggedOut,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String? token)? accessTokenAuth,
    TResult? Function(SigninResponse? userAuth)? authorization,
    TResult? Function(bool isLogged)? loggedIn,
    TResult? Function(bool isLogged)? loggedOut,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String? token)? accessTokenAuth,
    TResult Function(SigninResponse? userAuth)? authorization,
    TResult Function(bool isLogged)? loggedIn,
    TResult Function(bool isLogged)? loggedOut,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(accessTokenAuth<T> value) accessTokenAuth,
    required TResult Function(authorization<T> value) authorization,
    required TResult Function(loggedIn<T> value) loggedIn,
    required TResult Function(loggedOut<T> value) loggedOut,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult? Function(authorization<T> value)? authorization,
    TResult? Function(loggedIn<T> value)? loggedIn,
    TResult? Function(loggedOut<T> value)? loggedOut,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(accessTokenAuth<T> value)? accessTokenAuth,
    TResult Function(authorization<T> value)? authorization,
    TResult Function(loggedIn<T> value)? loggedIn,
    TResult Function(loggedOut<T> value)? loggedOut,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements AuthState<T> {
  const factory Error({required final String error}) = _$ErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
