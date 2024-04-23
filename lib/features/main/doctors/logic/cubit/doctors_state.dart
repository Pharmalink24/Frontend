import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctors_state.freezed.dart';

@freezed
class DoctorsState<T> with _$DoctorsState<T> {
  const factory DoctorsState.initial() = _Initial;

  const factory DoctorsState.loading() = Loading;
  const factory DoctorsState.success(T data) = Success<T>;
  const factory DoctorsState.error({required String error}) = Error;
}
