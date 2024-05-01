
// Text Button
import 'package:flutter/material.dart';

import 'colors.dart';

TextButtonThemeData textButtonThemeData({bool isDarkTheme = false}) {
  return TextButtonThemeData(
    style: ButtonStyle(
      alignment: Alignment.center,
      backgroundColor: MaterialStatePropertyAll(
        isDarkTheme ? AppColors.darkSecondary : AppColors.secondary,
      ),
      elevation: const MaterialStatePropertyAll(5.0),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      foregroundColor: const MaterialStatePropertyAll(
        AppColors.alternateText,
      ),
      textStyle: const MaterialStatePropertyAll(
        TextStyle(
          color: AppColors.alternateText,
        ),
      ),
    ),
  );
}
