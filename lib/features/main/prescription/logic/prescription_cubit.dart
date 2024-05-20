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
    emit(const PrescriptionState.loading());
    // Load the prescription data
    final response = await _prescriptionRepo.getPrescription(prescriptionId);

    response.when(
      success: (prescription) {
        emit(PrescriptionState.prescriptionLoaded(prescription));
      },
      failure: (error) {
        emit(
          PrescriptionState.error(
              error.apiErrorModel.message ?? ERR.UNEXPECTED),
        );
      },
    );
  }

  void loadPrescriptions(DrugState drugState) async {
    emit(const PrescriptionState.loading());

    // Load the prescriptions data
    final prescriptionsDrugs =
        await _prescriptionRepo.getPrescriptionsDrugs(drugState);
    final prescriptionsDoctors =
        await _prescriptionRepo.getPrescriptionsDoctors(drugState);

    prescriptionsDoctors.when(
      success: (prescriptionsDoctors) async {
        prescriptionsDrugs.when(
          success: (prescriptionsDrugs) async {
            emit(PrescriptionState.prescriptionsLoaded(prescriptionsDoctors, prescriptionsDrugs));
          },
          failure: (error) {
            emit(
              PrescriptionState.error(
                  error.apiErrorModel.message ?? ERR.UNEXPECTED),
            );
          },
        );
      },
      failure: (error) {
        emit(
          PrescriptionState.error(
              error.apiErrorModel.message ?? ERR.UNEXPECTED),
        );
      },
    );
  }
}
