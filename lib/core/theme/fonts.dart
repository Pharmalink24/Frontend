
import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';

enum Font {
  primary,
  secondary,
  tertiary,
}

class AppFonts {
    static String getFont (BuildContext context, Font fontType) {
    switch (fontType) {
      case Font.primary:
        return AppLocalizations.of(context).isEnLocale ? 'Outfit' : 'Cairo';
      case Font.secondary:
        return AppLocalizations.of(context).isEnLocale? 'Readex Pro' : 'Cairo';
      case Font.tertiary:
        return AppLocalizations.of(context).isEnLocale ? 'Plus Jakarta Sans' : 'Cairo';
      default:
        return  AppLocalizations.of(context).isEnLocale? 'Outfit' : 'Cairo';
    }

  }
}


