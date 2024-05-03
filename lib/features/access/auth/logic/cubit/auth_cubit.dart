import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/errors.dart';
import '../../data/repo/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(const AuthState.initial());

  // Refresh token
  void refreshToken() async {
    // Loading until sign in
    emit(const AuthState.loading());

    // Sign in
    final response = await _authRepo.refreshToken();

    // Authorized or not?
    response.when(
      success: (refreshTokenResponse) async {
        await _authRepo.setAccessToken(refreshTokenResponse.accessToken);
        emit(AuthState.success(refreshTokenResponse));
      },
      failure: (error) async {
        emit(
          AuthState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  bool isLoggedIn() {
    return _authRepo.isLoggedIn();
  }

  void logout() async {
    // Loading until sign out
    emit(const AuthState.loading());

    // Clear Authorization data
    await _authRepo.clearAuthData();

    // Emit success
    emit(const AuthState.success(null));
  }

}
