import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import 'colors.dart';
import 'fonts.dart';

class AppTextStyle {
  static TextStyle displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle displayMedium(BuildContext context) {
    return Theme.of(context).textTheme.displayMedium!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle displaySmall(BuildContext context) {
    return Theme.of(context).textTheme.displaySmall!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          fontWeight: AppLocalizations.of(context).isEnLocale
              ? FontWeight.w600
              : FontWeight.bold,
          fontSize: AppLocalizations.of(context).isEnLocale ? 36.0 : 24.0,
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle headlineLarge(BuildContext context) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle headlineMedium(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle headlineSmall(BuildContext context) {
    return Theme.of(context).textTheme.headlineSmall!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.primary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle titleMedium(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onTertiary,
        );
  }

  static TextStyle titleSmall(BuildContext context) {
    return Theme.of(context).textTheme.titleSmall!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onTertiary,
        );
  }

  static TextStyle labelLarge(BuildContext context) {
    return Theme.of(context).textTheme.labelLarge!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onSecondary,
        );
  }

  static TextStyle labelMedium(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onSecondary,
        );
  }

  static TextStyle labelSmall(BuildContext context) {
    return Theme.of(context).textTheme.labelSmall!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onSecondary,
        );
  }

  static TextStyle bodyLarge(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }

  static TextStyle bodySmall(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          fontFamily: AppFonts.getFont(context, Font.secondary),
          color: Theme.of(context).colorScheme.onPrimary,
        );
  }
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
  static InputDecoration _generalInputDecoration(BuildContext context) {
    return InputDecoration(
      isDense: true,
      labelStyle: AppTextStyle.labelMedium(context),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          width: _kBorderWidth,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: _kBorderWidth,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: _kBorderWidth,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
          width: _kBorderWidth,
        ),
      ),
      filled: true,
      contentPadding: const EdgeInsets.all(_kPadding),
    );
  }

  static InputDecoration primaryInputDecoration(BuildContext context) {
    return _generalInputDecoration(context).copyWith(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
      ),
      fillColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  static InputDecoration secondaryInputDecoration(BuildContext context) {
    return _generalInputDecoration(context).copyWith(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.tertiary,
        ),
        borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
      ),
      fillColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  static InputDecoration searchInputDecoration(BuildContext context) {
    return _generalInputDecoration(context).copyWith(
      contentPadding: const EdgeInsets.all(14.0),
      suffixIcon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Theme.of(context).colorScheme.secondary,
      ),
      hintStyle: AppTextStyle.labelMedium(context),
      labelStyle: AppTextStyle.bodyMedium(context),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kSearchBorderRadius),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: _kBorderWidth,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        borderRadius: BorderRadius.circular(_kSearchBorderRadius),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          width: _kBorderWidth,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(_kSearchBorderRadius),
      ),
      fillColor: Theme.of(context).colorScheme.primaryContainer,
    );
  }

  // Box Decoration for drop menu button
  static BoxDecoration _generalBoxDecoration(BuildContext context) {
    return BoxDecoration(
      border: Border.all(
        width: _kBorderWidth,
      ),
    );
  }

  static BoxDecoration primaryBoxDecoration(BuildContext context) {
    return _generalBoxDecoration(context).copyWith(
      color: Theme.of(context).colorScheme.primaryContainer,
      border: Border.all(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      borderRadius: BorderRadius.circular(_kPrimaryBorderRadius),
    );
  }

  static BoxDecoration secondaryBoxDecoration(BuildContext context) {
    return _generalBoxDecoration(context).copyWith(
      color: Theme.of(context).colorScheme.primaryContainer,
      border: Border.all(
        color: Theme.of(context).colorScheme.tertiary,
      ),
      borderRadius: BorderRadius.circular(_kSecondaryBorderRadius),
    );
  }
}
