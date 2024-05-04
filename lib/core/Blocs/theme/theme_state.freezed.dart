// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'theme_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThemeState<ThemeData> {
  ThemeData get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData data) dark,
    required TResult Function(ThemeData data) light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData data)? dark,
    TResult? Function(ThemeData data)? light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData data)? dark,
    TResult Function(ThemeData data)? light,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Dark<ThemeData> value) dark,
    required TResult Function(Light<ThemeData> value) light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Dark<ThemeData> value)? dark,
    TResult? Function(Light<ThemeData> value)? light,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Dark<ThemeData> value)? dark,
    TResult Function(Light<ThemeData> value)? light,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ThemeStateCopyWith<ThemeData, ThemeState<ThemeData>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThemeStateCopyWith<ThemeData, $Res> {
  factory $ThemeStateCopyWith(ThemeState<ThemeData> value,
          $Res Function(ThemeState<ThemeData>) then) =
      _$ThemeStateCopyWithImpl<ThemeData, $Res, ThemeState<ThemeData>>;
  @useResult
  $Res call({ThemeData data});
}

/// @nodoc
class _$ThemeStateCopyWithImpl<ThemeData, $Res,
        $Val extends ThemeState<ThemeData>>
    implements $ThemeStateCopyWith<ThemeData, $Res> {
  _$ThemeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DarkImplCopyWith<ThemeData, $Res>
    implements $ThemeStateCopyWith<ThemeData, $Res> {
  factory _$$DarkImplCopyWith(_$DarkImpl<ThemeData> value,
          $Res Function(_$DarkImpl<ThemeData>) then) =
      __$$DarkImplCopyWithImpl<ThemeData, $Res>;
  @override
  @useResult
  $Res call({ThemeData data});
}

/// @nodoc
class __$$DarkImplCopyWithImpl<ThemeData, $Res>
    extends _$ThemeStateCopyWithImpl<ThemeData, $Res, _$DarkImpl<ThemeData>>
    implements _$$DarkImplCopyWith<ThemeData, $Res> {
  __$$DarkImplCopyWithImpl(
      _$DarkImpl<ThemeData> _value, $Res Function(_$DarkImpl<ThemeData>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$DarkImpl<ThemeData>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$DarkImpl<ThemeData> implements Dark<ThemeData> {
  const _$DarkImpl(this.data);

  @override
  final ThemeData data;

  @override
  String toString() {
    return 'ThemeState<$ThemeData>.dark(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DarkImpl<ThemeData> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DarkImplCopyWith<ThemeData, _$DarkImpl<ThemeData>> get copyWith =>
      __$$DarkImplCopyWithImpl<ThemeData, _$DarkImpl<ThemeData>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData data) dark,
    required TResult Function(ThemeData data) light,
  }) {
    return dark(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData data)? dark,
    TResult? Function(ThemeData data)? light,
  }) {
    return dark?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData data)? dark,
    TResult Function(ThemeData data)? light,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Dark<ThemeData> value) dark,
    required TResult Function(Light<ThemeData> value) light,
  }) {
    return dark(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Dark<ThemeData> value)? dark,
    TResult? Function(Light<ThemeData> value)? light,
  }) {
    return dark?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Dark<ThemeData> value)? dark,
    TResult Function(Light<ThemeData> value)? light,
    required TResult orElse(),
  }) {
    if (dark != null) {
      return dark(this);
    }
    return orElse();
  }
}

abstract class Dark<ThemeData> implements ThemeState<ThemeData> {
  const factory Dark(final ThemeData data) = _$DarkImpl<ThemeData>;

  @override
  ThemeData get data;
  @override
  @JsonKey(ignore: true)
  _$$DarkImplCopyWith<ThemeData, _$DarkImpl<ThemeData>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LightImplCopyWith<ThemeData, $Res>
    implements $ThemeStateCopyWith<ThemeData, $Res> {
  factory _$$LightImplCopyWith(_$LightImpl<ThemeData> value,
          $Res Function(_$LightImpl<ThemeData>) then) =
      __$$LightImplCopyWithImpl<ThemeData, $Res>;
  @override
  @useResult
  $Res call({ThemeData data});
}

/// @nodoc
class __$$LightImplCopyWithImpl<ThemeData, $Res>
    extends _$ThemeStateCopyWithImpl<ThemeData, $Res, _$LightImpl<ThemeData>>
    implements _$$LightImplCopyWith<ThemeData, $Res> {
  __$$LightImplCopyWithImpl(_$LightImpl<ThemeData> _value,
      $Res Function(_$LightImpl<ThemeData>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$LightImpl<ThemeData>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ThemeData,
    ));
  }
}

/// @nodoc

class _$LightImpl<ThemeData> implements Light<ThemeData> {
  const _$LightImpl(this.data);

  @override
  final ThemeData data;

  @override
  String toString() {
    return 'ThemeState<$ThemeData>.light(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LightImpl<ThemeData> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LightImplCopyWith<ThemeData, _$LightImpl<ThemeData>> get copyWith =>
      __$$LightImplCopyWithImpl<ThemeData, _$LightImpl<ThemeData>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ThemeData data) dark,
    required TResult Function(ThemeData data) light,
  }) {
    return light(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ThemeData data)? dark,
    TResult? Function(ThemeData data)? light,
  }) {
    return light?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ThemeData data)? dark,
    TResult Function(ThemeData data)? light,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Dark<ThemeData> value) dark,
    required TResult Function(Light<ThemeData> value) light,
  }) {
    return light(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Dark<ThemeData> value)? dark,
    TResult? Function(Light<ThemeData> value)? light,
  }) {
    return light?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Dark<ThemeData> value)? dark,
    TResult Function(Light<ThemeData> value)? light,
    required TResult orElse(),
  }) {
    if (light != null) {
      return light(this);
    }
    return orElse();
  }
}

abstract class Light<ThemeData> implements ThemeState<ThemeData> {
  const factory Light(final ThemeData data) = _$LightImpl<ThemeData>;

  @override
  ThemeData get data;
  @override
  @JsonKey(ignore: true)
  _$$LightImplCopyWith<ThemeData, _$LightImpl<ThemeData>> get copyWith =>
      throw _privateConstructorUsedError;
}
