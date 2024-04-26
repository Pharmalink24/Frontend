import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/core/models/state_request_body.dart';

import '../../data/repo/doctors_repo.dart';
import 'doctors_state.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsRepo _doctorsRepo;
  DoctorsCubit(this._doctorsRepo) : super(const DoctorsState.initial());

  void emitDoctorsList() async {
    // Loading until get data
    emit(const DoctorsState.loading());

    // Get data
    final response = await _doctorsRepo.getDoctorList();
    response.when(
      success: (data) {
        emit(DoctorsState.success(data));
      },
      failure: (error) {
        emit(
          DoctorsState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // void emitNewDoctorsList() async {
  //   // Loading until get data
  //   emit(const DoctorsState.loading());

  //   // Get data
  //   final response = await _doctorsRepo.getDoctorListWithState(
  //     StateRequestBody(state: State.NEW),
  //   );
  //   response.when(
  //     success: (data) {
  //       emit(DoctorsState.success(data));
  //     },
  //     failure: (error) {
  //       emit(
  //         DoctorsState.error(
  //           error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
  //         ),
  //       );
  //     },
  //   );
  // }

  // void emitActiveDoctorsList() async {
  //   // Loading until get data
  //   emit(const DoctorsState.loading());

  //   // Get data
  //   final response = await _doctorsRepo.getDoctorListWithState(
  //     StateRequestBody(state: State.ACTIVE),
  //   );
  //   response.when(
  //     success: (data) {
  //       emit(DoctorsState.success(data));
  //     },
  //     failure: (error) {
  //       emit(
  //         DoctorsState.error(
  //           error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
  //         ),
  //       );
  //     },
  //   );
  // }

  // void emitInactiveDoctorsList() async {
  //   // Loading until get data
  //   emit(const DoctorsState.loading());

  //   // Get data
  //   final response = await _doctorsRepo.getDoctorListWithState(
  //     StateRequestBody(state: State.INACTIVE),
  //   );
  //   response.when(
  //     success: (data) {
  //       emit(DoctorsState.success(data));
  //     },
  //     failure: (error) {
  //       emit(
  //         DoctorsState.error(
  //           error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
  //         ),
  //       );
  //     },
  //   );
  // }

}
