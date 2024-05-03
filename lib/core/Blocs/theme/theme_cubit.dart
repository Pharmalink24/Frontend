import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/shared_preferences/settings_prefs.dart';
import 'package:pharmalink/core/theme/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData?> {
  ThemeCubit()
      : super(SettingsSharedPrefs.getTheme() == 1
            ? AppTheme.darkTheme()
            : AppTheme.lightTheme());

  // Switch to the dark theme
  void toggleDarkTheme() {
    // Initialize the theme data with the dark theme
    emit(AppTheme.darkTheme());

    // Store the theme in the shared preferences
    SettingsSharedPrefs.storeTheme(1);
  }

  // Switch to the light theme
  void toggleLightTheme() {
    // Initialize the theme data with the light theme
    emit(AppTheme.lightTheme());

    // Store the theme in the shared preferences
    SettingsSharedPrefs.storeTheme(0);
  }
}
