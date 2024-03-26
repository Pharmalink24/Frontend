// ignore_for_file: avoid_print

import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/access/signin/data/models/refresh_taken_request_body.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

class AuthRepo {
  final ApiService _apiService;
  AuthRepo(this._apiService);

  bool isLoggedIn() {
    try {
      return AuthSharedPrefs.isUserLoggedIn();
    } catch (error) {
      print(error);
      return false;
    }
  }

  Future<void> clearToken() async {
    try {
      await AuthSharedPrefs.clearUserToken();
    } catch (error) {
      print(error);
    }
  }

  Future<void> setToken(SigninResponse? auth) async {
    try {
      await AuthSharedPrefs.storeUserAuthData(
          auth ?? AuthSharedPrefs.getUserAuthData());
    } catch (error) {
      print(error);
    }
  }

  Future<ApiResult<SigninResponse>> refreshToken(String refreshTaken) async {
    try {
      final response = await _apiService.refreshToken(RefreshTakenRequestBody(
        refreshTaken: refreshTaken,
      ));
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
