// ignore_for_file: constant_identifier_names

import 'package:pharmalink/core/enums/language.dart';

import 'shared_preferences_service.dart';

abstract class SettingsSharedPrefs {
  static const String LANGUAGE = "language_";
  static const String THEME = "theme_";

  /// save [LANGUAGE] in shared pref
  static Future<bool?> storeLocale(Language language) async {
    return await SharedPrefsService.setData(LANGUAGE, language.key);
  }

  /// save [THEME] in shared pref
  /// 0 for light theme
  /// 1 for dark theme
  static Future<bool?> storeTheme(int theme) async {
    return await SharedPrefsService.setData(THEME, theme);
  }

  /// get [LANGUAGE] from shared pref
  static String getLocale() {
    final String language = SharedPrefsService.getString(LANGUAGE);
    return language.isEmpty ? Language.english.key : language;
  }

  /// get [THEME] from shared pref
  static int getTheme() {
    return SharedPrefsService.getInt(THEME);
  }

  static Future<void> clearEntry() async {
    await SharedPrefsService.removeData(LANGUAGE);
    await SharedPrefsService.removeData(THEME);
  }
}
