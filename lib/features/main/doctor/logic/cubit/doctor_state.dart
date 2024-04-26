import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_state.freezed.dart';

@freezed
class DoctorState<T> with _$DoctorState<T> {
  const factory DoctorState.initial() = _Initial;

  const factory DoctorState.loading() = Loading;
  const factory DoctorState.success(T data) = Success<T>;
  const factory DoctorState.error({required String error}) = Error;
}
