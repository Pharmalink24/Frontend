
// ignore_for_file: constant_identifier_names

import 'package:pharmalink/core/shared_preferences/shared_preferences_service.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

abstract class AuthSharedPrefs {
  static const String _ACCESS_TOKEN = "access_token_";
  static const String _IS_LOGGED_IN = "isLoggedIn_";
  static const String _ID = "id_";

  /// check if user is logged in or not
  static bool isUserLoggedIn() {
    return SharedPrefsService.getBool(_IS_LOGGED_IN, false) ?? false;
  }

  static int? getUserId() {
    return SharedPrefsService.getInt(_ID);
  }

  static String? getAccessToken() {
    return SharedPrefsService.getString(_ACCESS_TOKEN);
  }

  /// save [UserAuth] in shared pref
  static Future<bool> storeAuthData(SigninResponse userAuthData) async {
    await SharedPrefsService.setString(_ACCESS_TOKEN, userAuthData.accessToken);
    await SharedPrefsService.setInt(_ID, userAuthData.id);
    await SharedPrefsService.setBool(_IS_LOGGED_IN, true);

    return true;
  }

  static Future<bool> clearAuthData() async {
    await SharedPrefsService.remove(_ACCESS_TOKEN);
    await SharedPrefsService.remove(_ID);
    await SharedPrefsService.setBool(_IS_LOGGED_IN, false);

    return true;
  }
}
