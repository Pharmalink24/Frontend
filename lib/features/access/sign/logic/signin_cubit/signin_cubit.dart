import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/errors.dart';
import '../../../auth/data/repo/auth_repo.dart';
import '../../data/models/signin/signin_request_body.dart';
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
  void signin() async {
    // Loading until sign in
    emit(const SigninState.loading());

    // Sign in
    final signInResponse = await _signinRepo.signin(
      SigninRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    // Authorized or not?
    signInResponse.when(
      success: (signinResponse) async {        
        // Set Authorization data
        await _authRepo.setAuth(signinResponse);

        // Update device token
        await _signinRepo.updateDeviceToken();

        // Emit success
        emit(SigninState.success(signinResponse));
      },
      failure: (error) async {
        // Clear Authorization data
        await _authRepo.clearAuthData();

        // Emit error
        emit(SigninState.error(
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED));
      },
    );
  }

  // Logout
  void logout() async {
    // Clear Authorization data
    await _authRepo.logout();
    await _authRepo.clearAuthData();
  }

  // Dispose
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
