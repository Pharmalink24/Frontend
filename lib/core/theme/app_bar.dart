import 'package:flutter/material.dart';

import 'colors.dart';
import 'fonts.dart';
import '../helpers/constants/paths.dart';

// App Config
class MyAppBar {
  static const kAppBarLogoSize = 45.0;

  static AppBar withLogoAndLabel = AppBar(
    automaticallyImplyLeading: false,
    title: const Row(
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
  );

  static AppBar withoutLogo = AppBar(
    automaticallyImplyLeading: false,
    title: const Row(
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
  );

  static AppBar withoutLabel = AppBar(
    automaticallyImplyLeading: false,
    title: const Row(
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
  );
}
