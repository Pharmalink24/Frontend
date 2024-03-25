import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/features/auth/signin/data/models/signin_request_body.dart';
import 'package:pharmalink/features/auth/signin/data/repo/signin_repo.dart';
import 'package:pharmalink/features/auth/signin/logic/cubit/signin_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninRepo _signinRepo;
  SigninCubit(this._signinRepo) : super(const SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  void emitSigninStates() async {
    emit(const SigninState.loading());
    final response = await _signinRepo.signin(SigninRequestBody(
      email: emailController.text,
      password: passwordController.text,
    ));

    response.when(
      success: (signinResponse) {
        emit(SigninState.success(signinResponse));
      },
      failure: (error) {
        emit(
          SigninState.error(
              error: error.apiErrorModel.message ?? ERR.UNEXPECTED),
        );
      },
    );
  }
}
