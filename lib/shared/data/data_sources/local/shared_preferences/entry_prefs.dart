// ignore_for_file: constant_identifier_names

import 'shared_preferences_service.dart';

abstract class EntrySharedPrefs {
  static const String IS_FIRST_ENTRY = "entry_";

  /// check if user is first open the application
  static bool isFirstEntry() {
    return SharedPrefsService.getBool(IS_FIRST_ENTRY);
  }

  /// save [IsFirstEntry] in shared pref
  static Future<bool?> storeEntryData(bool isFirstEntry) async {
    return await SharedPrefsService.setData(IS_FIRST_ENTRY, isFirstEntry);
  }

  static Future<bool> clearEntry() async {
    return await SharedPrefsService.removeData(IS_FIRST_ENTRY);
  }
}
