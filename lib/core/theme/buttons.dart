// Text Button
import 'package:flutter/material.dart';

import 'colors.dart';

TextButtonThemeData textButtonThemeData({bool isDarkTheme = false}) {
  return TextButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: WidgetStatePropertyAll(
        isDarkTheme ? AppColors.darkPrimary : AppColors.primary,
      ),
      elevation: const WidgetStatePropertyAll(5.0),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      foregroundColor: WidgetStatePropertyAll(
        isDarkTheme
            ? AppColors.darkPrimaryBackground
            : AppColors.primaryBackground,
      ),
    ),
  );
}
