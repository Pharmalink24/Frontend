import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/access/auth/data/repo/auth_repo.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  String? accessToken;
  SigninResponse? userAuth;

  AuthCubit(this._authRepo) : super(const AuthState.initial());

  void emitSigninStates({SigninResponse? auth}) {
    try {
      _authRepo.signin(auth).then((isLogged) {
        emit(AuthState.loggedIn(isLogged));
      });
    } catch (e) {
      final errorMsg = e.toString();
      emit(AuthState.error(error: errorMsg));
    }
  }

  void emitSignOutStates() {
    try {
      _authRepo.signOut().then((isLogged) {
        emit(AuthState.loggedOut(isLogged));
      });
    } catch (e) {
      final errorMsg = e.toString();
      emit(AuthState.error(error: errorMsg));
    }
  }

  String? authenticate() {
    try {
      accessToken = _authRepo.getAccessToken();
      emit(AuthState.accessTokenAuth(accessToken));
      return accessToken;
    } catch (e) {
      final errorMsg = e.toString();
      emit(AuthState.error(error: errorMsg));
      return null;
    }
  }

  SigninResponse? authorization() {
    try {
      userAuth = _authRepo.getUserAuthorization();
      emit(AuthState.authorization(userAuth));
      return userAuth;
    } catch (e) {
      final errorMsg = e.toString();
      emit(AuthState.error(error: errorMsg));
      return null;
    }
  }
}
