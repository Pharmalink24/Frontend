// Flutter Packages
import 'package:flutter/material.dart';
// Components

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

  static const Color primaryBackground = Color(0xFFFFFFFF);
  static const Color secondaryBackground = Color(0xFFF1F4F8);

  static const Color accent1 = Color(0x4C4B39EF);
  static const Color accent2 = Color(0x4D39D2C0);
  static const Color accent3 = Color(0x4DEE8B60);
  static const Color accent4 = Color(0xCCFFFFFF);
  static const Color accent5 = Color(0xFFE0E3E7);

  static const Color success = Color(0xFF249689);
  static const Color warning = Color(0xFFF9CF58);
  static const Color error = Color(0xFFFF5963);
  static const Color info = Color(0xFFFFFFFF);
}

// Typography
class AppFonts {
  static const String primary = 'Outfit';
  static const String secondary = 'Readex Pro';
  static const String tertiary = 'Plus Jakarta Sans';
}

class AppPaths {
  static const String images = './assets/images';
  static const String icons = '$images/icons';
  static const String fonts = './assets/fonts';
}

class App {
  static const kAppBarLogoSize = 45.0;

  static AppBar bar = AppBar(
    automaticallyImplyLeading: false,
    title: const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage("${AppPaths.images}/logo.png"),
            size: kAppBarLogoSize,
            color: AppColors.alternateText,
          ),
          Text(
            "PharmaLink",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.primary,
              color: AppColors.alternateText,
            ),
          ),
        ],
      ),
    ),
  );

  static AppBar barWithoutLogo = AppBar(
    automaticallyImplyLeading: false,
    title: const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PharmaLink",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: AppFonts.primary,
              color: AppColors.alternateText,
            ),
          ),
        ],
      ),
    ),
  );

  static AppBar barWithoutLabel = AppBar(
    automaticallyImplyLeading: false,
    title: const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            AssetImage(
              "${AppPaths.images}/logo.png",
            ),
            size: kAppBarLogoSize,
            color: AppColors.alternateText,
          ),
        ],
      ),
    ),
  );
}

class AppTheme {
  static ThemeData generalAppTheme = ThemeData().copyWith(
    appBarTheme: AppTheme.appBarTheme,
    textButtonTheme: AppTheme.textButtonThemeData,
  );

  static const kAppBarBorderRadius = 16.0;
  static const AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    backgroundColor: AppColors.secondary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(kAppBarBorderRadius),
      ),
    ),
    elevation: 2,
    foregroundColor: AppColors.alternate,
  );

  static const TextButtonThemeData textButtonThemeData = TextButtonThemeData(
    style: ButtonStyle(
        alignment: Alignment.center,
        backgroundColor: MaterialStatePropertyAll(AppColors.secondary),
        elevation: MaterialStatePropertyAll(3.0)),
  );
}

class AppTextStyle {
  static const TextStyle title = TextStyle(
    fontFamily: AppFonts.tertiary,
    color: AppColors.primaryText,
    fontWeight: FontWeight.w600,
    fontSize: 36.0,
  );

  static const TextStyle subtitle = TextStyle(
    fontFamily: AppFonts.tertiary,
    color: AppColors.secondaryText,
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
  );
}
