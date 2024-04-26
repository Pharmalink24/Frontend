// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AppTheme {
  static ThemeData generalTheme = ThemeData().copyWith(
      appBarTheme: appBarTheme,
      textButtonTheme: textButtonThemeData,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.primaryBackground);
}

const kAppBarBorderRadius = 16.0;
const AppBarTheme appBarTheme = AppBarTheme(
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

const TextButtonThemeData textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStatePropertyAll(AppColors.secondary),
      elevation: MaterialStatePropertyAll(3.0)),
);
