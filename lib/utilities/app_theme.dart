import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primary = Color(0xFF00F0B5);
  static const Color secondary = Color(0xFF011936);
  static const Color tertiary = Color(0xFFEE8B60);
  static const Color alternate = Color(0xFFE0E3E7);
  static const Color primaryText = Color(0xFF14181B);
  static const Color secondaryText = Color(0xFF57636C);
  static const Color primaryBackground = Color(0xFFF1F4F8);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color accent1 = Color(0x4C4B39EF);
  static const Color accent2 = Color(0x4D39D2C0);
  static const Color accent3 = Color(0x4DEE8B60);
  static const Color accent4 = Color(0xCCFFFFFF);
  static const Color success = Color(0xFF249689);
  static const Color warning = Color(0xFFF9CF58);
  static const Color error = Color(0xFFFF5963);
  static const Color info = Color(0xFFFFFFFF);

  // Typography
  static const String fontFamily = 'Readex Pro';

  static TextStyle displayLarge({
    String fontFamily = AppTheme.fontFamily,
    Color color = AppTheme.primaryText,
    double fontSize = 64.0,
    FontWeight fontWeight = FontWeight.normal,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      _buildTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        color: color,
        useGoogleFonts: useGoogleFonts,
        decoration: decoration,
        lineHeight: lineHeight,
      );

  static TextStyle displayMedium({
    String fontFamily = AppTheme.fontFamily,
    Color color = AppTheme.primaryText,
    double fontSize = 44.0,
    FontWeight fontWeight = FontWeight.normal,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      _buildTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        color: color,
        useGoogleFonts: useGoogleFonts,
        decoration: decoration,
        lineHeight: lineHeight,
      );

  static TextStyle displaySmall({
    String fontFamily = AppTheme.fontFamily,
    Color color = AppTheme.primaryText,
    double fontSize = 36.0,
    FontWeight fontWeight = FontWeight.w600,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      _buildTextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontStyle: fontStyle,
        fontFamily: fontFamily,
        color: color,
        useGoogleFonts: useGoogleFonts,
        decoration: decoration,
        lineHeight: lineHeight,
      );


  static TextStyle _buildTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    required String fontFamily,
    required Color color,
    required bool useGoogleFonts,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
        fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      )
          : TextStyle(
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        height: lineHeight,
      );
}
