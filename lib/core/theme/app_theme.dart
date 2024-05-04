import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'colors.dart';

import 'buttons.dart';
import 'texts.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarWidgetTheme.appBarTheme(),
      textButtonTheme: textButtonThemeData(),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primaryBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.secondaryBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondaryText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      primaryColor: AppColors.primary,
      textTheme: appTextTheme,
      colorScheme: AppColorScheme.light,
    );
  }

  // Dark theme
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: AppBarWidgetTheme.appBarTheme(isDark: true),
      textButtonTheme: textButtonThemeData(isDarkTheme: true),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkPrimaryBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSecondaryBackground,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: AppColors.darkSecondary,
        unselectedItemColor: AppColors.darkPrimaryText,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0.0,
      ),
      textTheme: darkAppTextTheme,
      colorScheme: AppColorScheme.dark,
    );
  }
}
