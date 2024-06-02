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

  void activateDrug(int prescriptionId, String drugName) async {
    emit(const PrescriptionState.activateDrugLoading());

    final response =
        await _prescriptionRepo.activateDrug(prescriptionId, drugName);

    response.when(
      success: (message) {
        emit(PrescriptionState.activateDrugSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.activateDrugError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void deactivateDrug(int prescriptionId, String drugName) async {
    emit(const PrescriptionState.deactivateDrugLoading());

    final response =
        await _prescriptionRepo.deactivateDrug(prescriptionId, drugName);

    response.when(
      success: (message) {
        emit(PrescriptionState.deactivateDrugSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.deactivateDrugError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void reactivateDrug(int prescriptionId, String drugName) async {
    emit(const PrescriptionState.reactivateDrugLoading());

    final response =
        await _prescriptionRepo.activateDrug(prescriptionId, drugName);

    response.when(
      success: (message) {
        emit(PrescriptionState.reactivateDrugSuccess(message));
      },
      failure: (error) {
        emit(
          PrescriptionState.reactivateDrugError(
              error.apiErrorModel.error ?? ERR.UNEXPECTED),
        );
      },
    );
  }
}
