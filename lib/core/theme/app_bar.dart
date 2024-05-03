import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';

import 'colors.dart';
import '../helpers/constants/paths.dart';

// App Config
class MyAppBar {
  static const kAppBarLogoSize = 45.0;

  static AppBar withLogoAndLabel(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            const AssetImage("${AppPaths.images}/logo.png"),
            size: kAppBarLogoSize,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Text(
            "PharmaLink",
            style: AppTextStyle.bodyLarge(context),
          ),
        ],
      ),
    );
  }

  static AppBar withoutLogo(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PharmaLink",
            style: AppTextStyle.bodyLarge(context),
          ),
        ],
      ),
    );
  }

  static AppBar withoutLabel(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageIcon(
            const AssetImage(
              "${AppPaths.images}/logo.png",
            ),
            size: kAppBarLogoSize,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}

const kAppBarBorderRadius = 16.0;

// App bar
AppBarTheme appBarTheme({bool isDarkTheme = false}) {
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: isDarkTheme ? AppColors.primary : AppColors.darkPrimary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(kAppBarBorderRadius),
      ),
    ),
    elevation: 2,
    foregroundColor: AppColors.alternate,
  );
}
