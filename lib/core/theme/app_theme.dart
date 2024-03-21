// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AppTheme {
  static ThemeData generalTheme = ThemeData().copyWith(
    appBarTheme: AppTheme.appBarTheme,
    textButtonTheme: AppTheme.textButtonThemeData,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.primaryBackground
  );

  static const kAppBarBorderRadius = 16.0;
  static const AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(kAppBarBorderRadius),
      ),
    ),
    elevation: 2,
    foregroundColor: AppColors.alternate,
  );

  static const TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStatePropertyAll(AppColors.secondary),
        elevation: MaterialStatePropertyAll(3.0)),
  );
}
