// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drug_interaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DrugInteractionState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) searchedDrugsRetrieved,
    required TResult Function(T data) drugInteractionRetrieved,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? searchedDrugsRetrieved,
    TResult? Function(T data)? drugInteractionRetrieved,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? searchedDrugsRetrieved,
    TResult Function(T data)? drugInteractionRetrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(SearchedDrugsRetrieved<T> value)
        searchedDrugsRetrieved,
    required TResult Function(DrugInteractionSuccess<T> value)
        drugInteractionRetrieved,
    required TResult Function(Error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult? Function(DrugInteractionSuccess<T> value)?
        drugInteractionRetrieved,
    TResult? Function(Error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult Function(DrugInteractionSuccess<T> value)? drugInteractionRetrieved,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrugInteractionStateCopyWith<T, $Res> {
  factory $DrugInteractionStateCopyWith(DrugInteractionState<T> value,
          $Res Function(DrugInteractionState<T>) then) =
      _$DrugInteractionStateCopyWithImpl<T, $Res, DrugInteractionState<T>>;
}

/// @nodoc
class _$DrugInteractionStateCopyWithImpl<T, $Res,
        $Val extends DrugInteractionState<T>>
    implements $DrugInteractionStateCopyWith<T, $Res> {
  _$DrugInteractionStateCopyWithImpl(this._value, this._then);

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
    extends _$DrugInteractionStateCopyWithImpl<T, $Res, _$InitialImpl<T>>
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
    return 'DrugInteractionState<$T>.initial()';
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
    required TResult Function() loading,
    required TResult Function(T data) searchedDrugsRetrieved,
    required TResult Function(T data) drugInteractionRetrieved,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? searchedDrugsRetrieved,
    TResult? Function(T data)? drugInteractionRetrieved,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? searchedDrugsRetrieved,
    TResult Function(T data)? drugInteractionRetrieved,
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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(SearchedDrugsRetrieved<T> value)
        searchedDrugsRetrieved,
    required TResult Function(DrugInteractionSuccess<T> value)
        drugInteractionRetrieved,
    required TResult Function(Error<T> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult? Function(DrugInteractionSuccess<T> value)?
        drugInteractionRetrieved,
    TResult? Function(Error<T> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult Function(DrugInteractionSuccess<T> value)? drugInteractionRetrieved,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements DrugInteractionState<T> {
  const factory _Initial() = _$InitialImpl<T>;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<T, $Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl<T> value, $Res Function(_$LoadingImpl<T>) then) =
      __$$LoadingImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<T, $Res>
    extends _$DrugInteractionStateCopyWithImpl<T, $Res, _$LoadingImpl<T>>
    implements _$$LoadingImplCopyWith<T, $Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl<T> _value, $Res Function(_$LoadingImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl<T> implements Loading<T> {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'DrugInteractionState<$T>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) searchedDrugsRetrieved,
    required TResult Function(T data) drugInteractionRetrieved,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? searchedDrugsRetrieved,
    TResult? Function(T data)? drugInteractionRetrieved,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? searchedDrugsRetrieved,
    TResult Function(T data)? drugInteractionRetrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(SearchedDrugsRetrieved<T> value)
        searchedDrugsRetrieved,
    required TResult Function(DrugInteractionSuccess<T> value)
        drugInteractionRetrieved,
    required TResult Function(Error<T> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult? Function(DrugInteractionSuccess<T> value)?
        drugInteractionRetrieved,
    TResult? Function(Error<T> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult Function(DrugInteractionSuccess<T> value)? drugInteractionRetrieved,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements DrugInteractionState<T> {
  const factory Loading() = _$LoadingImpl<T>;
}

/// @nodoc
abstract class _$$SearchedDrugsRetrievedImplCopyWith<T, $Res> {
  factory _$$SearchedDrugsRetrievedImplCopyWith(
          _$SearchedDrugsRetrievedImpl<T> value,
          $Res Function(_$SearchedDrugsRetrievedImpl<T>) then) =
      __$$SearchedDrugsRetrievedImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$SearchedDrugsRetrievedImplCopyWithImpl<T, $Res>
    extends _$DrugInteractionStateCopyWithImpl<T, $Res,
        _$SearchedDrugsRetrievedImpl<T>>
    implements _$$SearchedDrugsRetrievedImplCopyWith<T, $Res> {
  __$$SearchedDrugsRetrievedImplCopyWithImpl(
      _$SearchedDrugsRetrievedImpl<T> _value,
      $Res Function(_$SearchedDrugsRetrievedImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SearchedDrugsRetrievedImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$SearchedDrugsRetrievedImpl<T> implements SearchedDrugsRetrieved<T> {
  const _$SearchedDrugsRetrievedImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DrugInteractionState<$T>.searchedDrugsRetrieved(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchedDrugsRetrievedImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchedDrugsRetrievedImplCopyWith<T, _$SearchedDrugsRetrievedImpl<T>>
      get copyWith => __$$SearchedDrugsRetrievedImplCopyWithImpl<T,
          _$SearchedDrugsRetrievedImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) searchedDrugsRetrieved,
    required TResult Function(T data) drugInteractionRetrieved,
    required TResult Function(String error) error,
  }) {
    return searchedDrugsRetrieved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? searchedDrugsRetrieved,
    TResult? Function(T data)? drugInteractionRetrieved,
    TResult? Function(String error)? error,
  }) {
    return searchedDrugsRetrieved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? searchedDrugsRetrieved,
    TResult Function(T data)? drugInteractionRetrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (searchedDrugsRetrieved != null) {
      return searchedDrugsRetrieved(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(SearchedDrugsRetrieved<T> value)
        searchedDrugsRetrieved,
    required TResult Function(DrugInteractionSuccess<T> value)
        drugInteractionRetrieved,
    required TResult Function(Error<T> value) error,
  }) {
    return searchedDrugsRetrieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult? Function(DrugInteractionSuccess<T> value)?
        drugInteractionRetrieved,
    TResult? Function(Error<T> value)? error,
  }) {
    return searchedDrugsRetrieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult Function(DrugInteractionSuccess<T> value)? drugInteractionRetrieved,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (searchedDrugsRetrieved != null) {
      return searchedDrugsRetrieved(this);
    }
    return orElse();
  }
}

abstract class SearchedDrugsRetrieved<T> implements DrugInteractionState<T> {
  const factory SearchedDrugsRetrieved(final T data) =
      _$SearchedDrugsRetrievedImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$SearchedDrugsRetrievedImplCopyWith<T, _$SearchedDrugsRetrievedImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DrugInteractionSuccessImplCopyWith<T, $Res> {
  factory _$$DrugInteractionSuccessImplCopyWith(
          _$DrugInteractionSuccessImpl<T> value,
          $Res Function(_$DrugInteractionSuccessImpl<T>) then) =
      __$$DrugInteractionSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$DrugInteractionSuccessImplCopyWithImpl<T, $Res>
    extends _$DrugInteractionStateCopyWithImpl<T, $Res,
        _$DrugInteractionSuccessImpl<T>>
    implements _$$DrugInteractionSuccessImplCopyWith<T, $Res> {
  __$$DrugInteractionSuccessImplCopyWithImpl(
      _$DrugInteractionSuccessImpl<T> _value,
      $Res Function(_$DrugInteractionSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DrugInteractionSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$DrugInteractionSuccessImpl<T> implements DrugInteractionSuccess<T> {
  const _$DrugInteractionSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DrugInteractionState<$T>.drugInteractionRetrieved(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DrugInteractionSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DrugInteractionSuccessImplCopyWith<T, _$DrugInteractionSuccessImpl<T>>
      get copyWith => __$$DrugInteractionSuccessImplCopyWithImpl<T,
          _$DrugInteractionSuccessImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(T data) searchedDrugsRetrieved,
    required TResult Function(T data) drugInteractionRetrieved,
    required TResult Function(String error) error,
  }) {
    return drugInteractionRetrieved(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? searchedDrugsRetrieved,
    TResult? Function(T data)? drugInteractionRetrieved,
    TResult? Function(String error)? error,
  }) {
    return drugInteractionRetrieved?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? searchedDrugsRetrieved,
    TResult Function(T data)? drugInteractionRetrieved,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (drugInteractionRetrieved != null) {
      return drugInteractionRetrieved(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(Loading<T> value) loading,
    required TResult Function(SearchedDrugsRetrieved<T> value)
        searchedDrugsRetrieved,
    required TResult Function(DrugInteractionSuccess<T> value)
        drugInteractionRetrieved,
    required TResult Function(Error<T> value) error,
  }) {
    return drugInteractionRetrieved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult? Function(DrugInteractionSuccess<T> value)?
        drugInteractionRetrieved,
    TResult? Function(Error<T> value)? error,
  }) {
    return drugInteractionRetrieved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult Function(DrugInteractionSuccess<T> value)? drugInteractionRetrieved,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (drugInteractionRetrieved != null) {
      return drugInteractionRetrieved(this);
    }
    return orElse();
  }
}

abstract class DrugInteractionSuccess<T> implements DrugInteractionState<T> {
  const factory DrugInteractionSuccess(final T data) =
      _$DrugInteractionSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$DrugInteractionSuccessImplCopyWith<T, _$DrugInteractionSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
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
    extends _$DrugInteractionStateCopyWithImpl<T, $Res, _$ErrorImpl<T>>
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
    return 'DrugInteractionState<$T>.error(error: $error)';
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
    required TResult Function() loading,
    required TResult Function(T data) searchedDrugsRetrieved,
    required TResult Function(T data) drugInteractionRetrieved,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(T data)? searchedDrugsRetrieved,
    TResult? Function(T data)? drugInteractionRetrieved,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(T data)? searchedDrugsRetrieved,
    TResult Function(T data)? drugInteractionRetrieved,
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
    required TResult Function(Loading<T> value) loading,
    required TResult Function(SearchedDrugsRetrieved<T> value)
        searchedDrugsRetrieved,
    required TResult Function(DrugInteractionSuccess<T> value)
        drugInteractionRetrieved,
    required TResult Function(Error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult? Function(DrugInteractionSuccess<T> value)?
        drugInteractionRetrieved,
    TResult? Function(Error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(Loading<T> value)? loading,
    TResult Function(SearchedDrugsRetrieved<T> value)? searchedDrugsRetrieved,
    TResult Function(DrugInteractionSuccess<T> value)? drugInteractionRetrieved,
    TResult Function(Error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements DrugInteractionState<T> {
  const factory Error({required final String error}) = _$ErrorImpl<T>;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<T, _$ErrorImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
