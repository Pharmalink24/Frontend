// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AppTheme {
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
      textTheme: const TextTheme(
        bodyLarge: TextStyle()
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      appBarTheme: appBarTheme(isDarkTheme: true),
      textButtonTheme: textButtonThemeData(isDarkTheme: true),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkPrimaryBackground,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkSecondaryBackground,
        selectedItemColor: AppColors.darkPrimary,
        unselectedItemColor: AppColors.darkPrimaryText,
      ),
    );
  }
}

const kAppBarBorderRadius = 16.0;

// App bar
AppBarTheme appBarTheme({bool isDarkTheme = false}) {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: isDarkTheme ? AppColors.primary : AppColors.darkPrimary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(kAppBarBorderRadius),
      ),
    ),
    elevation: 2,
    foregroundColor: AppColors.alternate,
  );
}

// Text Button
TextButtonThemeData textButtonThemeData({bool isDarkTheme = false}) {
  return TextButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStatePropertyAll(
          isDarkTheme ? AppColors.primary : AppColors.darkPrimary),
      elevation: const MaterialStatePropertyAll(3.0),
    ),
  );
}
