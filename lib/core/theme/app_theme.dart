import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';

import 'buttons.dart';
import 'texts.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme() {
    return ThemeData.light().copyWith(
      appBarTheme: appBarTheme(),
      textButtonTheme: textButtonThemeData(),
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.primaryBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.secondaryBackground,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.secondaryText,
      ),
      primaryColor: AppColors.primary,
      textTheme: appTextTheme,
      colorScheme: AppColorScheme.light,
    );
  }

  // Dark theme
  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: appBarTheme(isDarkTheme: true),
      textButtonTheme: textButtonThemeData(isDarkTheme: true),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkPrimaryBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSecondaryBackground,
        selectedItemColor: AppColors.darkSecondary,
        unselectedItemColor: AppColors.darkPrimaryText,
      ),
      textTheme: darkAppTextTheme,
      colorScheme: AppColorScheme.dark,
    );
  }
}
