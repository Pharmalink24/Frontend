import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // private constructor as I don't want to allow creating an instance of this class itself.
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  static SharedPreferences? _prefsInstance;
  static FlutterSecureStorage flutterSecureStorage = const FlutterSecureStorage();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  /// Removes a value from SharedPreferences with given [key].
  static Future<bool> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    return await _prefsInstance!.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static  Future<bool> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    return await _prefsInstance!.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<bool?> setData(String key, value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case const (String):
        return await _prefsInstance!.setString(key, value);
      case const (int):
        return await _prefsInstance!.setInt(key, value);
      case const (bool):
        return await _prefsInstance!.setBool(key, value);
      case const (double):
        return await _prefsInstance!.setDouble(key, value);
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static bool getBool(String key) {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _prefsInstance!.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static double getDouble(String key) {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _prefsInstance!.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static int getInt(String key) {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _prefsInstance!.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static String getString(String key) {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return _prefsInstance!.getString(key) ?? '';
  }

  //--------------------------------- Secure Storage ---------------------------------

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    debugPrint(
        "FlutterSecureStorage : setSecuredString with key : $key and value : $value");
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static Future<String> getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    await flutterSecureStorage.deleteAll();
  }
}