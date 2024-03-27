import 'dart:async' show Future;
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  // Integer getters & setters
  static int? getInt(String key, [int? value]) {
    return _prefsInstance!.getInt(key) ?? value;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;
    return prefs.setInt(key, value);
  }

  // String getters & setters
  static String? getString(String key, [String? value]) {
    return _prefsInstance!.getString(key) ?? value;
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs.setString(key, value);
  }

  // Boolean getters & setters
  static bool? getBool(String key, [bool? value]) {
    return _prefsInstance!.getBool(key) ?? value;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  // Remove
  static Future<bool> remove(String key) async {
    var prefs = await _instance;
    return prefs.remove(key);
  }
}
