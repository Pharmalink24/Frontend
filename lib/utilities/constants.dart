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
}

// Typography
class AppFonts {
  static const String primary = 'Outfit';
  static const String secondary = 'Readex Pro';
}

class AppPaths {
  static const String images = './assets/images';
  static const String icons = '$images/icons';
  static const String fonts = './assets/fonts';
}

const kAppBarLogoSize = 45.0;

class App {
  static AppBar barWithoutLabel = AppBar(
    centerTitle: true,
    title: const Expanded(
      child: ImageIcon(
        AssetImage("${AppPaths.images}/logo.png"),
        size: kAppBarLogoSize,
        color: AppColors.alternate,
      ),
    ),
    backgroundColor: AppColors.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    ),
    elevation: 1,
  );

  static AppBar barWithLabel = AppBar(
    centerTitle: true,
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
    backgroundColor: AppColors.secondary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(8),
      ),
    ),
    elevation: 1,
  );
}
