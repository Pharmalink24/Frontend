// ignore_for_file: constant_identifier_names

import 'shared_preferences_service.dart';

abstract class EntrySharedPrefs {
  static const String IS_FIRST_ENTRY = "entry_";

  /// check if user is first open the application
  static bool isFirstEntry() {
    return SharedPrefsService.getBool(IS_FIRST_ENTRY) ?? true;
  }

  /// save [IsFirstEntry] in shared pref
  static Future<bool> storeEntryData(bool isFirstEntry) async {
    return await SharedPrefsService.setBool(IS_FIRST_ENTRY, isFirstEntry);
  }

  static Future<bool> clearEntry() async {
    return await SharedPrefsService.remove(IS_FIRST_ENTRY);
  }
}
