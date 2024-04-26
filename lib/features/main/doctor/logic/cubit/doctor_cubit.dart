import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import '../../data/repo/doctor_repo.dart';

import './doctor_state.dart';

class DoctorCubit extends Cubit<DoctorState> {
  final DoctorRepo _doctorRepo;
  DoctorCubit(this._doctorRepo) : super(const DoctorState.initial());

  void emitDoctorProfile(int doctorId) async {
    // Loading until get data
    emit(const DoctorState.loading());

    // Get data
    final response = await _doctorRepo.getDoctorProfile(doctorId);
    response.when(
      success: (data) {
        emit(DoctorState.success(data));
      },
      failure: (error) {
        emit(
          DoctorState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }
}
