import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_state.freezed.dart';

@freezed
class PrescriptionState<T> with _$PrescriptionState<T> {
  const factory PrescriptionState.initial() = _Initial;

  const factory PrescriptionState.loading() = Loading;
  const factory PrescriptionState.prescriptionLoaded(T data) = PrescriptionLoaded<T>;
  const factory PrescriptionState.prescriptionsLoaded(T data) = PrescriptionsLoaded<T>;
  const factory PrescriptionState.error(String message) = Error;
}
