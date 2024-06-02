import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared_preferences/auth_prefs.dart';
import '../../../../../core/shared_preferences/entry_prefs.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void checkAuthentication() async {
    emit(const Loading());
    bool isLoggedIn = AuthSharedPrefs.isUserLoggedIn();
    bool isFirstEntry = EntrySharedPrefs.isFirstEntry();

    if (isLoggedIn) {
      emit(const Authenticated());
    } else if (isFirstEntry) {
      EntrySharedPrefs.storeEntryData(false);
      emit(const FirstEntry());
    } else {
      emit(const Unauthenticated());
    }
  }

  void logout() {
    AuthSharedPrefs.clearAuthData(); // Clear stored tokens
    emit(const Unauthenticated());
  }
}
