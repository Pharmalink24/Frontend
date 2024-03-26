import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _prefs;

  SharedPreferencesService._internal();

  factory SharedPreferencesService() {
    return SharedPreferencesService._internal();
  }

  Future<SharedPreferences?> get _initializePrefs async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  Future<String> getString(String key) async {
    var pref = await _initializePrefs;
    return pref?.getString(key) ?? "";
  }

  Future<void> setString(String key, String? value) async {
    var pref = await _initializePrefs;
    pref?.setString(key, value ?? '');
  }

  Future<bool> getBool(String key) async {
    var pref = await _initializePrefs;
    return pref?.getBool(key) ?? false;
  }

  Future<void> setBool(String key, bool? value) async {
    var pref = await _initializePrefs;
    pref?.setBool(key, value ?? false);
  }

  Future<void> remove(String key) async {
    var pref = await _initializePrefs;
    pref?.remove(key);
  }
  
}
