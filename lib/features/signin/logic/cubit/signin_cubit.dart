import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/signin/data/models/signin_request_body.dart';
import 'package:pharmalink/features/signin/data/repo/signin_repo.dart';
import 'package:pharmalink/features/signin/logic/cubit/signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final SigninRepo _signinRepo;
  SigninCubit(this._signinRepo) : super(const SigninState.initial());

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSigninStates(SigninRequestBody signinRequestBody) async {
    emit(const SigninState.loading());
    final response = await _signinRepo.signin(signinRequestBody);
    response.when(success: (signinResponse) {
      emit(SigninState.success(signinResponse));
    }, failure: (error) {
      emit(SigninState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
