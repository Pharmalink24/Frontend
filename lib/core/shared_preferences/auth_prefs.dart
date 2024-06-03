// ignore_for_file: constant_identifier_names

import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/networking/api/api_constants.dart';
import 'package:pharmalink/core/shared_preferences/shared_preferences_service.dart';
import 'package:pharmalink/features/access/sign/data/models/signin/signin_response.dart';

abstract class AuthSharedPrefs {
  static const String _ID = "id_";
  static const String _USERNAME = "username_";
  static const String _EMAIL = "email_";
  static const String _ACCESS_TOKEN = "access_token_";
  static const String _REFRESH_TOKEN = "refresh_token_";
  static const String _IS_LOGGED_IN = "isLoggedIn_";

  /// check if user is logged in or not
  static bool isUserLoggedIn() {
    return SharedPrefsService.getBool(_IS_LOGGED_IN, false) ?? false;
  }

  static int? getUserId() {
    return SharedPrefsService.getInt(_ID);
  }

  static String? getUsername() {
    return SharedPrefsService.getString(_USERNAME);
  }

  static String? getEmail() {
    return SharedPrefsService.getString(_EMAIL);
  }

  static String? getAccessToken() {
    return "${ApiConstants.tokenKey} ${SharedPrefsService.getString(_ACCESS_TOKEN)}";
  }

  static String? getRefreshToken() {
    return SharedPrefsService.getString(_REFRESH_TOKEN);
  }

  /// save [UserAuth] in shared pref
  static Future<bool> storeAuthData(SigninResponse userAuthData) async {
    // save user id
    await SharedPrefsService.setInt(_ID, userAuthData.id);
    // save username
    await SharedPrefsService.setString(_USERNAME, userAuthData.username);
    // save email
    await SharedPrefsService.setString(_EMAIL, userAuthData.email);
    // save access token and refresh token
    await SharedPrefsService.setString(_ACCESS_TOKEN, userAuthData.accessToken);
    await SharedPrefsService.setString(
        _REFRESH_TOKEN, userAuthData.refreshToken);
    // set user logged in
    await SharedPrefsService.setBool(_IS_LOGGED_IN, true);

    return true;
  }

  static Future<bool> clearAuthData() async {
    await SharedPrefsService.remove(_ID);
    await SharedPrefsService.remove(_USERNAME);
    await SharedPrefsService.remove(_EMAIL);
    await SharedPrefsService.remove(_REFRESH_TOKEN);
    await SharedPrefsService.remove(_ACCESS_TOKEN);

    await SharedPrefsService.setBool(_IS_LOGGED_IN, false);

    return true;
  }

  static void logger() {
    getIt<Logger>().d("User ID: ${getUserId()}");
    getIt<Logger>().d("Username: ${getUsername()}");
    getIt<Logger>().d("Email: ${getEmail()}");
    getIt<Logger>().d("Access Token: ${getAccessToken()}");
    getIt<Logger>().d("Refresh Token: ${getRefreshToken()}");
    getIt<Logger>().d("Is Logged In: ${isUserLoggedIn()}");
  }
}
