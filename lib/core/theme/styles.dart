// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/localization.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';

// Text Styles
class AppTextStyle {
  static TextStyle displayLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 64.0,
  );

  static TextStyle displayMedium = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 44.0,
  );

  static TextStyle displaySmall = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: isArabic() ? 28.0 : 36.0,
  );

  static TextStyle headlineLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
  );

  static TextStyle headlineMedium = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 24.0,
  );

  static TextStyle headlineSmall = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
  );

  static TextStyle titleLarge = TextStyle(
    fontFamily: AppFonts.primary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w500,
    fontSize: 22.0,
  );

  static TextStyle titleMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.info,
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
  );

  static TextStyle titleSmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.info,
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
  );

  static TextStyle labelLarge = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  static TextStyle labelMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static TextStyle labelSmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.secondaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );

  static TextStyle bodyLarge = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
  );

  static TextStyle bodyMedium = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
  );

  static TextStyle bodySmall = TextStyle(
    fontFamily: AppFonts.secondary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.normal,
    fontSize: 12.0,
  );
}

// Text Field Decoration
class AppTextFieldDecoration {
  // Constants
  static const _kBorderWidth = 2.0;
  static const _kPadding = 20.0;
  static const _kPrimaryBorderRadius = 40.0;
  static const _kSecondaryBorderRadius = 12.0;
  static const _kSearchBorderRadius = 8.0;

  // Input Decoration for text field
  static final InputDecoration _generalInputDecoration = InputDecoration(
    isDense: true,
    labelStyle: AppTextStyle.labelMedium,
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: _kBorderWidth,
      ),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.secondary,
        width: _kBorderWidth,
      ),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: _kBorderWidth,
      ),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.error,
        width: _kBorderWidth,
      ),
    ),
    filled: true,
    contentPadding: const EdgeInsets.all(_kPadding),
  );

  static InputDecoration primaryInputDecoration =
      _generalInputDecoration.copyWith(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.accent5,
      ),
      borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
    ),
    fillColor: AppColors.primaryBackground,
  );

  static InputDecoration secondaryInputDecoration =
      _generalInputDecoration.copyWith(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.secondaryBackground,
      ),
      borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
    ),
    fillColor: AppColors.secondaryBackground,
  );

  static InputDecoration searchInputDecoration =
      _generalInputDecoration.copyWith(
    fillColor: AppColors.primaryBackground,
    contentPadding: const EdgeInsets.all(14.0),
    suffixIcon: const Icon(
      Icons.keyboard_arrow_down_rounded,
      color: AppColors.secondary,
    ),
    hintStyle: AppTextStyle.labelMedium,
    labelStyle: AppTextStyle.bodyMedium,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kSearchBorderRadius),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        width: _kBorderWidth,
        color: AppColors.accent5,
      ),
      borderRadius: BorderRadius.circular(_kSearchBorderRadius),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: _kBorderWidth,
        color: AppColors.secondary,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_kSearchBorderRadius),
    ),
  );

  // Box Decoration for drop menu button
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
    borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
  );

  static BoxDecoration secondaryBoxDecoration = _generalBoxDecoration.copyWith(
    color: AppColors.secondaryBackground,
    border: Border.all(
      color: AppColors.secondaryBackground,
    ),
    borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
  );
}
