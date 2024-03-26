import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/features/access/signup/logic/cubit/signup_state.dart';
import 'package:pharmalink/features/access/signup/data/models/signup_request_body.dart';
import 'package:pharmalink/features/access/signup/data/repo/signup_repo.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.loading());
    final response = await _signupRepo.signup(SignupRequestBody(
      fname: fnameController.text,
      lname: lnameController.text,
      username: usernameController.text,
      password: passwordController.text,
      birthdate: birthdateController.text,
      email: emailController.text,
      phone: phoneController.text,
      gender: genderController.text,
      image: null,
    ));
    response.when(success: (signupResponse) {
      emit(SignupState.success(signupResponse));
    }, failure: (error) {
      emit(SignupState.error(
          error: error.apiErrorModel.message ?? ERR.UNEXPECTED));
    });
  }
}