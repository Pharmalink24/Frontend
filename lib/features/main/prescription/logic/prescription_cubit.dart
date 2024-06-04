import 'package:bloc/bloc.dart';
import '../../../../core/enums/drug_state.dart';
import '../../../../core/helpers/errors.dart';
import '../data/repo/prescription_repo.dart';
import 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  final PrescriptionRepo _prescriptionRepo;

  PrescriptionCubit(this._prescriptionRepo)
      : super(const PrescriptionState.initial());

  void loadPrescriptionById(int prescriptionId) async {
    emit(const PrescriptionState.prescriptionLoading());
    // Load the prescription data
    final response = await _prescriptionRepo.getPrescription(prescriptionId);

    response.when(
      success: (prescription) {
        emit(PrescriptionState.prescriptionSuccess(prescription));
      },
      failure: (error) {
        emit(
          PrescriptionState.prescriptionsError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void loadPrescriptions(DrugState drugState) async {
    emit(const PrescriptionState.prescriptionsLoading());

    // Load the prescriptions data
    final prescriptionsInfo =
        await _prescriptionRepo.getPrescriptionsDrugs(drugState);

    final prescriptionsDoctors =
        await _prescriptionRepo.getPrescriptionsDoctors(drugState);

    prescriptionsDoctors.when(
      success: (prescriptionsDoctors) async {
        prescriptionsInfo.when(
          success: (prescriptionsInfo) async {
            emit(PrescriptionState.prescriptionsSuccess(
                prescriptionsDoctors, prescriptionsInfo));
          },
          failure: (error) {
            emit(
              PrescriptionState.prescriptionsError(
                  error.apiErrorModel.error ?? ERR.UNEXPECTED),
            );
          },
        );
      },
      failure: (error) {
        emit(
          PrescriptionState.prescriptionsError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  // Activate, Deactivate, Reactivate Drug
  void activateDrug(int prescriptionId, String drugName) async {
    emit(const PrescriptionState.stateLoading());

    final response =
        await _prescriptionRepo.activateDrug(prescriptionId, drugName);

    response.when(
      success: (message) {
        emit(PrescriptionState.stateSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.stateError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void deactivateDrug(int prescriptionId, String drugName) async {
    emit(const PrescriptionState.stateLoading());

    final response =
        await _prescriptionRepo.deactivateDrug(prescriptionId, drugName);

    response.when(
      success: (message) {
        emit(PrescriptionState.stateSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.stateError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void reactivateDrug(int prescriptionId, String drugName) async {
    emit(const PrescriptionState.stateLoading());

    final response =
        await _prescriptionRepo.activateDrug(prescriptionId, drugName);

    response.when(
      success: (message) {
        emit(PrescriptionState.stateSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.stateError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  // Activate, Deactivate, Reactivate Prescription
  void activatePrescription(int prescriptionId) async {
    emit(const PrescriptionState.stateLoading());

    final response =
        await _prescriptionRepo.activatePrescription(prescriptionId);

    response.when(
      success: (message) {
        emit(PrescriptionState.stateSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.stateError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void deactivatePrescription(int prescriptionId) async {
    emit(const PrescriptionState.stateLoading());

    final response =
        await _prescriptionRepo.deactivatePrescription(prescriptionId);

    response.when(
      success: (message) {
        emit(PrescriptionState.stateSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.stateError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void reactivatePrescription(int prescriptionId) async {
    emit(const PrescriptionState.stateLoading());

    final response =
        await _prescriptionRepo.activatePrescription(prescriptionId);

    response.when(
      success: (message) {
        emit(PrescriptionState.stateSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.stateError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }
}
