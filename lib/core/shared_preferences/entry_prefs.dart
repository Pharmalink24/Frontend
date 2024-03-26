// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

enum EntryStore {
  isFirstEntry,
}

abstract class EntrySharedPrefs {
  static const String IS_FIRST_ENTRY = "entry_";

  /// Instantiation of the SharedPreferences library
  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();

  static final Map<EntryStore, dynamic> entryStore = <EntryStore, dynamic>{
    EntryStore.isFirstEntry: true,
  };

  /// check if user is first open the application
  static bool isFirstEntry() {
    return entryStore[EntryStore.isFirstEntry];
  }

  /// load [IsFirstEntry] if saved in shared pref
  static Future<void> loadEntryData() async {
    final isFirstEntry = (await prefs).getBool(IS_FIRST_ENTRY);
    if (isFirstEntry != null) {
      updateEntrySetting(
        isFirstEntry: isFirstEntry,
      );
    }
  }

  /// save [IsFirstEntry] in shared pref
  static Future<bool> storeEntryData(bool isFirstEntry) async {
    updateEntrySetting(
      isFirstEntry: isFirstEntry,
    );
    return (await prefs).setBool(IS_FIRST_ENTRY, isFirstEntry);
  }

  static Future<bool> clearEntry() async {
    updateEntrySetting(clear: true);
    return (await prefs).remove(IS_FIRST_ENTRY);
  }

  static void updateEntrySetting(
      {bool? isFirstEntry, bool clear = false}) async {
    if (isFirstEntry != null || clear) {
      entryStore[EntryStore.isFirstEntry] = isFirstEntry ?? false;
    }
  }
}
