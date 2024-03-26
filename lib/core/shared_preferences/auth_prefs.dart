import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_response.dart';

enum AuthStore {
  isLoggedIn,
  userAuth,
}

abstract class AuthSharedPrefs {
  static const String USER_IDENTIFIER = "tokens_";

  /// Instantiation of the SharedPreferences library
  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();

  static final Map<AuthStore, dynamic> authStore = <AuthStore, dynamic>{
    AuthStore.isLoggedIn: false,
  };

  static Map<AuthStore, dynamic> getAuthStore() {
    return authStore;
  }

  /// check if user is logged in or not
  static bool isUserLoggedIn() {
    return authStore[AuthStore.isLoggedIn];
  }

  /// get [UserAuth]
  static SigninResponse getUserAuthData() {
    return authStore[AuthStore.userAuth];
  }

  static int getUserId() {
    return authStore[AuthStore.userAuth].id;
  }

  static String getAccessToken() {
    return authStore[AuthStore.userAuth].accessToken;
  }


  /// load [UserAuth] if saved in shared pref
  static Future<void> loadUserAuthData() async {
    final userString = (await prefs).getString(USER_IDENTIFIER);
    if (userString != null) {
      final userJson = json.decode(userString);
      updateUserSetting(
        userAuthData: SigninResponse.fromJson(userJson),
        isLoggedIn: true,
      );
    }
  }

  /// save [UserAuth] in shared pref
  static Future<bool> storeUserAuthData(SigninResponse userAuthData) async {
    updateUserSetting(
      userAuthData: userAuthData,
      isLoggedIn: true,
    );
    // converts Map<String, dynamic> to string type using jsonEncode()
    final userAuth = userAuthData.toJson();
    return (await prefs).setString(USER_IDENTIFIER, jsonEncode(userAuth));
  }

  static Future<bool> clearUserToken() async {
    updateUserSetting(clear: true);
    return (await prefs).remove(USER_IDENTIFIER);
  }

  static void updateUserSetting({
    SigninResponse? userAuthData,
    bool? isLoggedIn,
    bool clear = false,
  }) async {
    if (userAuthData != null || clear) {
      authStore[AuthStore.userAuth] = userAuthData;
    }

    if (isLoggedIn != null || clear) {
      authStore[AuthStore.isLoggedIn] = isLoggedIn ?? false;
    }
  }
}
