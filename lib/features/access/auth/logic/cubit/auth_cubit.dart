import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repo/auth_repo.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo _authRepo;
  AuthCubit(this._authRepo) : super(const AuthState.initial());

  bool isLoggedIn() {
    return _authRepo.isLoggedIn();
  }

  void logout() async {
    // Clear Authorization data
    await _authRepo.logout();
    await _authRepo.clearAuthData();
  }
}
