import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/features/access/verification/data/models/verification_request_params.dart';
import 'package:pharmalink/features/access/verification/data/repo/verification_repo.dart';
import 'package:pharmalink/features/access/verification/logic/cubit/verification_state.dart';

class VerificationCubit extends Cubit<VerificationState> {
  final VerificationRepo _verificationRepo;

  VerificationCubit(this._verificationRepo)
      : super(const VerificationState.initial());

  void emitVerificationStates(
      VerificationRequestParams verificationRequestParams) async {
    emit(const VerificationState.loading());
    final response =
        await _verificationRepo.resendVerification(verificationRequestParams);
    response.when(success: (verificationResponse) {
      emit(VerificationState.success(verificationResponse));
    }, failure: (error) {
      emit(
        VerificationState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED),
      );
    });
  }
}
