import 'package:bloc/bloc.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/models/verification_request_params.dart';
import '../../data/repo/verification_repo.dart';
import 'verification_state.dart';

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
