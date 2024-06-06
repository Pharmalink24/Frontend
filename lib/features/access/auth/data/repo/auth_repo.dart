// ignore_for_file: avoid_print

import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/networking/api/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../../../sign/data/models/signin/signin_response.dart';


class AuthRepo {
  final ApiService _apiService;
  AuthRepo(this._apiService);

  bool isLoggedIn() {
    try {
      return AuthSharedPrefs.isUserLoggedIn();
    } catch (error) {
      getIt<Logger>().e(error);
      return false;
    }
  }

  Future<void> logout() async {
    try {
      await _apiService.logout(AuthSharedPrefs.getAccessToken());
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }

  Future<void> clearAuthData() async {
    try {
      await AuthSharedPrefs.clearAuthData();
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }

  Future<void> setAuth(SigninResponse auth) async {
    try {
      await AuthSharedPrefs.storeAuthData(auth);
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }
}
