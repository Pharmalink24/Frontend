import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'styles.dart';
import '../helpers/constants/paths.dart';

// App bar logo size
const kAppBarLogoSize = 45.0;

// Title size
const kAppBarTitleSize = 28.0;

// App bar border radius
const kAppBarBorderRadius = 16.0;

// App bar elevation
const kAppBarElevation = 0.0;

enum AppBarType {
  withLogoAndTitle,
  withoutLogo,
  withoutTitle,
}

class AppBarWidget extends StatelessWidget {
  final AppBarType type;
  final String? title;
  final bool automaticallyImplyLeading;
  final double titleSize;

  const AppBarWidget({
    super.key,
    required this.type,
    this.title,
    this.automaticallyImplyLeading = false,
    this.titleSize = kAppBarTitleSize,
  });

  ImageIcon _buildIcon(BuildContext context) {
    return ImageIcon(
      const AssetImage(
        "${AppPaths.images}/logo.png",
      ),
      size: kAppBarLogoSize,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  Text _buildTitle(BuildContext context) {
    return Text(
      title ?? AppLocalizations.of(context).translate("pharmalink"),
      style: AppTextStyle.displayMedium(context).copyWith(
        fontSize: titleSize,
      ),
    );
  }

  // Build app bar with logo and title
  AppBar _buildAppBarWithLogoAndTitle(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(context),
          _buildTitle(context),
        ],
      ),
    );
  }

  // Build app bar without logo
  AppBar _buildAppBarWithoutLogo(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTitle(context),
        ],
      ),
    );
  }

  // Build app bar without title
  AppBar _buildAppBarWithoutTitle(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildIcon(context),
        ],
      ),
    );
  }

  @override
  AppBar build(BuildContext context) {
    switch (type) {
      case AppBarType.withLogoAndTitle:
        return _buildAppBarWithLogoAndTitle(context);
      case AppBarType.withoutLogo:
        return _buildAppBarWithoutLogo(context);
      case AppBarType.withoutTitle:
        return _buildAppBarWithoutTitle(context);
    }
  }
}

class AppBarWidgetTheme {
  static AppBarTheme appBarTheme({bool isDark = false}) {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: isDark
          ? AppColors.darkPrimaryBackground
          : AppColors.primaryBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(kAppBarBorderRadius),
        ),
      ),
      elevation: kAppBarElevation,
    );
  }
}
