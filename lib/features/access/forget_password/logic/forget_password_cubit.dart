import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../data/repo/forget_password_repo.dart';
import 'forget_password_state.dart';
import '../../../../../core/helpers/errors.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _forgetPasswordRepo;

  ForgetPasswordCubit(this._forgetPasswordRepo)
      : super(const ForgetPasswordState.initial());

  // Form key
  final formKey = GlobalKey<FormState>();

  // Controllers
  TextEditingController emailController = TextEditingController();

  Future<void> forgetPassword() async {
    emit(const ForgetPasswordState.loading());
    final result =
        await _forgetPasswordRepo.resetPassword(emailController.text);
    result.when(
      success: (response) {
        emit(ForgetPasswordState.success(response));
      },
      failure: (error) {
        emit(ForgetPasswordState.error(
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED));
      },
    );
  }
}
