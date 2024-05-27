// Flutter Packages
import 'package:flutter/material.dart';

// Colors
class AppColors {
  static const Color primary = Color(0xFF00F0B5);
  static const Color secondary = Color(0xFF011936);
  static const Color tertiary = Color(0xFF101010);
  static const Color alternate = Color(0xFFF9F9F9);
  static const Color transparent = Colors.transparent;

  static const Color primaryText = Color(0xFF14181B);
  static const Color secondaryText = Color(0xFF57636C);
  static const Color alternateText = Color(0xFFF9F9F9);

  static const Color primaryBackground = Color(0XFFf1f4f8);
  static const Color secondaryBackground = Color(0xFFffffff);

  // Gradients
  // static const LinearGradient primaryGradient = LinearGradient(
  //   colors: [Color(0xFF00F0B5), Color(0xFF00B5F0)],
  //   begin: Alignment.topLeft,
  //   end: Alignment.bottomRight,
  // );

  // Dark Mode Colors
  static const Color darkPrimary = Color(0xce00f0b5);
  static const Color darkSecondary = Color(0xFF39d2c0);
  static const Color darkTertiary = Color(0xFFF9F9F9);
  static const Color darkAlternate = Color(0xFF101010);

  static const Color darkPrimaryText = Color(0xFFF9F9F9);
  static const Color darkSecondaryText = Color(0xFF95a1ac);
  static const Color darkAlternateText = Color(0xFF14181B);

  static const Color darkPrimaryBackground = Color(0xFF14181b);
  static const Color darkSecondaryBackground = Color(0xFF1D2428);

  static const Color accent1 = Color(0x4c4b39ef);
  static const Color accent2 = Color(0x4d39d2c0);
  static const Color accent3 = Color(0x4dee8b60);
  static const Color accent4 = Color(0xFF006951);
  static const Color accent5 = Color(0xFFf4f5f7);

  static const Color success = Color(0xFF249689);
  static const Color warning = Color(0xFFF9CF58);
  static const Color error = Color(0xFFFF5963);
  static const Color info = Color(0xFFFFFFFF);

  static Color shadow = const Color(0xFF000000).withOpacity(0.08);
}

class AppColorScheme {
  static ColorScheme light = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
    // Colors
    primary: AppColors.primary,
    inversePrimary: AppColors.secondary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    scrim: AppColors.alternate,
    surface: AppColors.secondaryBackground,
    primaryContainer: AppColors.secondaryBackground,
    secondaryContainer: AppColors.primaryBackground,
    tertiaryContainer: AppColors.primaryBackground,
    errorContainer: AppColors.error,
    background: AppColors.primaryBackground,
    onBackground: AppColors.primaryText,
    error: AppColors.error,
    // Text
    onPrimary: AppColors.primaryText,
    onSecondary: AppColors.secondaryText.withOpacity(0.5),
    onTertiary: AppColors.info,
    onSurface: AppColors.primaryText,
    onPrimaryContainer: AppColors.primaryText,
    onSecondaryContainer: AppColors.secondaryText,
    onTertiaryContainer: AppColors.primaryText,
    onError: AppColors.error,
    onErrorContainer: AppColors.error,
    onInverseSurface: AppColors.primaryText,
    // Shadows
    shadow: const Color(0xFF000000).withOpacity(0.17),
  );

  static ColorScheme dark = ColorScheme.fromSeed(
    seedColor: AppColors.darkPrimary,
    brightness: Brightness.dark,
    // Colors
    primary: AppColors.darkPrimary,
    inversePrimary: AppColors.darkSecondary,
    secondary: AppColors.darkSecondary,
    tertiary: AppColors.darkTertiary,
    surface: AppColors.darkSecondaryBackground,
    scrim: AppColors.darkAlternate,
    primaryContainer: AppColors.darkSecondaryBackground,
    secondaryContainer: AppColors.darkPrimaryBackground,
    tertiaryContainer: AppColors.darkPrimaryBackground,
    errorContainer: AppColors.error,
    background: AppColors.darkPrimaryBackground,
    onBackground: AppColors.darkPrimaryText,
    error: AppColors.error,
    // Text
    onPrimary: AppColors.darkPrimaryText,
    onSecondary: AppColors.darkSecondaryText,
    onTertiary: AppColors.info,
    onSurface: AppColors.darkPrimaryText,
    onPrimaryContainer: AppColors.darkPrimaryText,
    onSecondaryContainer: AppColors.darkSecondaryText,
    onTertiaryContainer: AppColors.darkPrimaryText,
    onError: AppColors.error,
    onErrorContainer: AppColors.error,
    onInverseSurface: AppColors.darkPrimaryText,
    // Shadows
    shadow: AppColors.darkAlternate.withOpacity(0.1),
  );
}
