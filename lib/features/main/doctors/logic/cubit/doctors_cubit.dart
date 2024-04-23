import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_state.dart';
import 'package:pharmalink/core/models/state_request_body.dart';

import '../../data/repo/doctors_repo.dart';

class DoctorsCubit extends Cubit<DoctorsState> {
  final DoctorsRepo _doctorsRepo;
  DoctorsCubit(this._doctorsRepo) : super(const DoctorsState.initial());

  void getDoctorsList() async {
    // Loading until get data
    emit(const DoctorsState.loading());

    // Get data
    final response = await _doctorsRepo.getDoctorList(
      StateRequestBody(state: State.NEW),
    );
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
}