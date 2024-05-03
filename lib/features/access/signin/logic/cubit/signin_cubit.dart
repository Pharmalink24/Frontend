import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/models/signin_request_body.dart';
import '../../../auth/data/repo/auth_repo.dart';
import '../../data/repo/signin_repo.dart';
import 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninRepo _signinRepo;
  final AuthRepo _authRepo;

  SigninCubit(this._signinRepo, this._authRepo)
      : super(const SigninState.initial());

  // Controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Sign in
  void emitSigninStates() async {
    // Loading until sign in
    emit(const SigninState.loading());

    // Sign in
    final response = await _signinRepo.signin(
      SigninRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    // Authorized or not?
    response.when(
      success: (signinResponse) async {
        await _authRepo.setAuth(signinResponse);
        emit(SigninState.success(signinResponse));
      },
      failure: (error) async {
        await _authRepo.clearAuthData();
        emit(SigninState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED));
      },
    );
  }
}
