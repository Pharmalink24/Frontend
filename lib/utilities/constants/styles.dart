// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/utilities/constants/colors.dart';
import 'package:pharmalink/utilities/constants/fonts.dart';

// Text Styles
class AppTextStyle {
  static const TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 64.0,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 44.0,
  );

  static const TextStyle displaySmall = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 36.0,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 24.0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.info,
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.info,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
}

// Text Field Decoration
class AppTextFieldDecoration {
  static const _kBorderWidth = 2.0;
  static const _kPadding = 24.0;
  static const _kBorderRadius1 = 40.0;
  static const _kBorderRadius2 = 12.0;

  static const InputDecoration _generalInputDecoration = InputDecoration(
    labelStyle: AppTextStyle.labelMedium,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: _kBorderWidth,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondary,
        width: _kBorderWidth,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: _kBorderWidth,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: _kBorderWidth,
      ),
    ),
    filled: true,
    contentPadding: EdgeInsets.all(_kPadding),
  );

  static InputDecoration primaryInputDecoration =
      _generalInputDecoration.copyWith(
    fillColor: AppColors.primaryBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.accent5,
      ),
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius1),
    ),
  );

  static InputDecoration secondaryInputDecoration =
      _generalInputDecoration.copyWith(
    fillColor: AppColors.primaryBackground,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.secondaryBackground,
      ),
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kBorderRadius2),
    ),
  );

  static final BoxDecoration _generalBoxDecoration = BoxDecoration(
    border: Border.all(
      width: _kBorderWidth,
    ),
  );

  static BoxDecoration primaryBoxDecoration = _generalBoxDecoration.copyWith(
    color: AppColors.primaryBackground,
    border: Border.all(
      color: AppColors.accent5,
    ),
    borderRadius: BorderRadius.circular(_kBorderRadius1),
  );

  static BoxDecoration secondaryBoxDecoration = _generalBoxDecoration.copyWith(
    color: AppColors.primaryBackground,
    border: Border.all(
      color: AppColors.secondaryBackground,
    ),
    borderRadius: BorderRadius.circular(_kBorderRadius2),
  );
}
