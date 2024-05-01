import 'package:flutter/material.dart';

import 'colors.dart';

TextTheme appTextTheme = const TextTheme(
  //------- Display -------//
  displayLarge: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 64.0,
    color: AppColors.primaryText,
  ),
  displayMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 44.0,
    color: AppColors.primaryText,
  ),
  displaySmall: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryText,
  ),
  //------- Headline -------//
  headlineLarge: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    color: AppColors.primaryText,
  ),
  headlineMedium: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    color: AppColors.primaryText,
  ),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 24.0,
    color: AppColors.primaryText,
  ),

  //------- Title -------//
  titleLarge: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
    color: AppColors.primaryText,
  ),
  titleMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
    color: AppColors.info,
  ),
  titleSmall: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: AppColors.info,
  ),
  //------- Body -------//
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.primaryText,
  ),
  bodySmall: TextStyle(
    fontSize: 12.0,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
  ),
  //------- Label -------//
  labelLarge: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.secondaryText,
  ),
  labelMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: AppColors.secondaryText,
  ),
  labelSmall: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.secondaryText,
  ),
);

TextTheme darkAppTextTheme = const TextTheme(
  //------- Display -------//
  displayLarge: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 64.0,
    color: AppColors.darkPrimaryText,
  ),
  displayMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 44.0,
    color: AppColors.darkPrimaryText,
  ),
  displaySmall: TextStyle(
    fontSize: 36.0,
    fontWeight: FontWeight.w600,
    color: AppColors.darkPrimaryText,
  ),
  //------- Headline -------//
  headlineLarge: TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    color: AppColors.darkPrimaryText,
  ),
  headlineMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 24.0,
    color: AppColors.darkPrimaryText,
  ),
  headlineSmall: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
    color: AppColors.darkPrimaryText,
  ),
  //------- Title -------//
  titleLarge: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
    color: AppColors.darkPrimaryText,
  ),
  titleMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
    color: AppColors.info,
  ),
  titleSmall: TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: AppColors.info,
  ),
  //------- Body -------//
  bodyLarge: TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.darkPrimaryText,
  ),
  bodyMedium: TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.darkPrimaryText,
  ),
  bodySmall: TextStyle(
    fontSize: 12.0,
    color: AppColors.darkPrimaryText,
    fontWeight: FontWeight.normal,
  ),
  //------- Label -------//
  labelLarge: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.darkSecondaryText,
  ),
  labelMedium: TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: AppColors.darkSecondaryText,
  ),
  labelSmall: TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.darkSecondaryText,
  ),
);
