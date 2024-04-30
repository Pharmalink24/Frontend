import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.lightTheme());

  bool isDarkMode = false;
  ThemeData themeData = AppTheme.lightTheme();

  // Switch to the dark theme
  void toggleDarkTheme() {
    // Initialize the theme data with the dark theme
    themeData = AppTheme.darkTheme();
    emit(themeData);
    isDarkMode = true;
  }

  // Switch to the light theme
  void toggleLightTheme() {
    // Initialize the theme data with the light theme
    themeData = AppTheme.lightTheme();
    emit(themeData);
    isDarkMode = false;
  }
}
