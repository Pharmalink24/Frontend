// ignore_for_file: avoid_print

import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/access/auth/data/models/refresh_token_request_body.dart';
import 'package:pharmalink/features/access/auth/data/models/refresh_token_response.dart';

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

  Future<void> setAccessToken(String accessToken) async {
    try {
      await AuthSharedPrefs.storeAuthData(
        SigninResponse(
          id: AuthSharedPrefs.getUserId() ?? 0,
          username: AuthSharedPrefs.getUsername() ?? '',
          email: AuthSharedPrefs.getEmail() ?? '',
          accessToken: accessToken,
          refreshToken: AuthSharedPrefs.getRefreshToken() ?? '',
        ),
      );
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }

  Future<ApiResult<RefreshTokenResponse>> refreshToken() async {
    try {
      final response = await _apiService.refreshToken(
        RefreshTokenRequestBody(
          refreshToken: AuthSharedPrefs.getRefreshToken() ?? '',
        ),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
