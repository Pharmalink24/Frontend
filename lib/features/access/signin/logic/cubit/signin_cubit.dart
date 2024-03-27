import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/errors.dart';
// import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_request_body.dart';
import 'package:pharmalink/features/access/signin/data/repo/auth_repo.dart';
import 'package:pharmalink/features/access/signin/data/repo/signin_repo.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninRepo _signinRepo;
  final AuthRepo _authRepo;
  // final AuthCubit _authCubit;
  SigninCubit(this._signinRepo, this._authRepo)
      : super(const SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

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
      success: (signinResponse) {
        _authRepo.setAuth(signinResponse);
        emit(SigninState.success(signinResponse));
      },
      failure: (error) {
        _authRepo.clearToken();
        emit(SigninState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED));
      },
    );
  }
}
