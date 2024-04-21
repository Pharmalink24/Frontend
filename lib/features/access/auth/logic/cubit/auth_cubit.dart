import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../signin/data/repo/auth_repo.dart';
import '../../../signin/data/models/signin_response.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(const AuthState.initial());

  // bool isLoggedIn() {
  //   return _authRepo.isLoggedIn();
  // }

  void logout() async {
    await _authRepo.clearAuthData();
    emit(const AuthState.initial());
  }

  void setAuth(SigninResponse signinResponse) async {
    await _authRepo.setAuth(signinResponse);
    emit(AuthState.authorized(signinResponse));
  }

  // Future<SigninResponse?> refreshToken(SigninResponse token) async {
  //   // TODO: must change it to refresh token.
  //   final response = await _authRepo.refreshToken(token.accessToken);

  //   response.when(success: (takenResponse) {
  //     emit(AuthState.authorized(takenResponse));
  //     return response;
  //   }, failure: (error) {
  //     emit(const AuthState.initial());
  //   });
  //   return null;
  // }
}
