// Text Button
import 'package:flutter/material.dart';

import 'colors.dart';

TextButtonThemeData textButtonThemeData({bool isDarkTheme = false}) {
  return TextButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStatePropertyAll(
        isDarkTheme ? AppColors.darkPrimary : AppColors.primary,
      ),
      elevation: const MaterialStatePropertyAll(5.0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      foregroundColor: MaterialStatePropertyAll(
        isDarkTheme
            ? AppColors.darkPrimaryBackground
            : AppColors.primaryBackground,
      ),
    ),
  );
}
