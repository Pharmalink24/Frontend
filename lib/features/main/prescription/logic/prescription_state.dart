import 'package:freezed_annotation/freezed_annotation.dart';

part 'prescription_state.freezed.dart';

@freezed
class PrescriptionState<T> with _$PrescriptionState<T> {
  const factory PrescriptionState.initial() = _Initial;

  // Prescription
  const factory PrescriptionState.prescriptionLoading() = PrescriptionLoading;
  const factory PrescriptionState.prescriptionSuccess(T data) =
      PrescriptionSuccess<T>;
  const factory PrescriptionState.prescriptionError(String message) =
      PrescriptionError;

  // Prescriptions
  const factory PrescriptionState.prescriptionsLoading() = PrescriptionsLoading;
  const factory PrescriptionState.prescriptionsSuccess(T doctors, T drugs) =
      PrescriptionsSuccess<T>;
  const factory PrescriptionState.prescriptionsError(String message) =
      PrescriptionsError;

  // Activate Drug
  const factory PrescriptionState.activateDrugLoading() = ActivateDrugLoading;
  const factory PrescriptionState.activateDrugSuccess(T message) =
      ActivateDrugSuccess<T>;
  const factory PrescriptionState.activateDrugError(String message) =
      ActivateDrugError;

  // Deactivate Drug
  const factory PrescriptionState.deactivateDrugLoading() =
      DeactivateDrugLoading;
  const factory PrescriptionState.deactivateDrugSuccess(T message) =
      DeactivateDrugSuccess<T>;
  const factory PrescriptionState.deactivateDrugError(String message) =
      DeactivateDrugError;
}
