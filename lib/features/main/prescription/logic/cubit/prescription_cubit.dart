import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import '../../data/repo/prescription_repo.dart';
import 'prescription_state.dart';

class PrescriptionCubit extends Cubit<PrescriptionState> {
  final PrescriptionRepo _prescriptionRepo;

  PrescriptionCubit(this._prescriptionRepo)
      : super(const PrescriptionState.initial());

  void loadPrescription(int prescriptionId) async {
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
    final response = await _prescriptionRepo.getPrescriptions2(drugState);

    response.when(
      success: (prescriptions) async {
        final responseEdited = await _prescriptionRepo
            .prescription2TransformToPrescription1(prescriptions);
        responseEdited.when(
          success: (prescriptionsEdited) async {
            emit(PrescriptionState.prescriptionsLoaded(prescriptionsEdited));
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
