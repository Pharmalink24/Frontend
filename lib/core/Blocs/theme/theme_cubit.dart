import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared_preferences/settings_prefs.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit()
      : super(SettingsSharedPrefs.getTheme() == 1
            ? ThemeMode.dark
            : ThemeMode.light);

  // Switch to the dark theme
  void toggleDarkTheme() {
    // Initialize the theme data with the dark theme
    emit(ThemeMode.dark);

    // Store the theme in the shared preferences
    SettingsSharedPrefs.storeTheme(1);
  }

  // Switch to the light theme
  void toggleLightTheme() {
    // Initialize the theme data with the light theme
    emit(ThemeMode.light);

    // Store the theme in the shared preferences
    SettingsSharedPrefs.storeTheme(0);
  }
}
