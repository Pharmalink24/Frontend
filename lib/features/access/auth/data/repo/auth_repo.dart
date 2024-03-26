// ignore_for_file: avoid_print

import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

class AuthRepo {
  AuthRepo();

  Future<bool> signin(SigninResponse? auth) async {
    try {
      return await AuthSharedPrefs.storeUserAuthData(
          auth ?? AuthSharedPrefs.getUserAuthData());
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      return await AuthSharedPrefs.clearUserToken();
    } catch (error) {
      print(error);
      return false;
    }
  }

  bool isLoggedIn() {
    try {
      return AuthSharedPrefs.isUserLoggedIn();
    } catch (error) {
      print(error);
      return false;
    }
  }

  String? getAccessToken() {
    try {
      return AuthSharedPrefs.getAccessToken();
    } catch (error) {
      print(error);
      return null;
    }
  }

  SigninResponse? getUserAuthorization() {
    try {
      return AuthSharedPrefs.getUserAuthData();
    } catch (error) {
      print(error);
      return null;
    }
  }

}
