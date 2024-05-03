import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/helpers/errors.dart';
import '../../data/models/change_password_request_body.dart';
import '../../data/repo/change_password_repo.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ChangePasswordRepo _changePasswordRepo;
  ChangePasswordCubit(this._changePasswordRepo)
      : super(const ChangePasswordState.initial());

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitChangePassword() async {
    emit(const ChangePasswordState.loading());

    final response = await _changePasswordRepo.changePassword(
      ChangePasswordRequestBody(
        oldPassword: oldPasswordController.text,
        newPassword: newPasswordController.text,
      ),
    );
    
    response.when(success: (changePasswordResponse) {
      emit(ChangePasswordState.success(changePasswordResponse));
    }, failure: (error) {
      emit(ChangePasswordState.error(
          error: error.apiErrorModel.message ?? ERR.UNEXPECTED));
    });
  }
}
