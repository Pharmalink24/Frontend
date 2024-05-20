import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/icons.dart';
import 'styles.dart';

// App bar logo size
const kAppBarLogoSize = 36.0;

// Title size
const kAppBarTitleSize = 24.0;

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
  final IconData? icon;
  final void Function()? onPressed;
  final bool isCentered;

  const AppBarWidget({
    super.key,
    required this.type,
    this.title,
    this.automaticallyImplyLeading = false,
    this.titleSize = kAppBarTitleSize,
    this.icon,
    this.onPressed,
    this.isCentered = false,
  });

  // Build app bar icon
  Icon _buildIcon(BuildContext context) {
    return Icon(
      FFIcons.kLogoPharmaLink,
      color: Theme.of(context).colorScheme.secondary,
      size: kAppBarLogoSize,
    );
  }

  // Build app bar title
  Text _buildTitle(BuildContext context) {
    return Text(
      title ?? AppLocalizations.of(context).translate("pharmalink"),
      style: AppTextStyle.titleMedium(context).copyWith(
        fontSize:
            AppLocalizations.of(context).isEnLocale ? titleSize : titleSize - 4,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

  // Build leading icon button
  IconButton? _buildLeading(BuildContext context) {
    return icon != null
        ? IconButton(
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            icon: Icon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
            ),
          )
        : null;
  }

  // Build app bar with logo and title
  List<Widget> _buildAppBarWithLogoAndTitle(BuildContext context) {
    return [
      _buildIcon(context),
      _buildTitle(context),
    ];
  }

  // Build app bar without logo
  List<Widget> _buildAppBarWithoutLogo(BuildContext context) {
    return [
      _buildTitle(context),
    ];
  }

  // Build app bar without title
  List<Widget> _buildAppBarWithoutTitle(BuildContext context) {
    return [
      _buildIcon(context),
    ];
  }

  // Build app bar
  List<Widget> _buildContent(BuildContext context) {
    switch (type) {
      case AppBarType.withLogoAndTitle:
        return _buildAppBarWithLogoAndTitle(context);
      case AppBarType.withoutLogo:
        return _buildAppBarWithoutLogo(context);
      case AppBarType.withoutTitle:
        return _buildAppBarWithoutTitle(context);
    }
  }

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: Row(
        mainAxisAlignment:
            isCentered ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: _buildContent(context),
      ),
      leading: _buildLeading(context),
    );
  }
}

class AppBarWidgetTheme {
  static AppBarTheme appBarTheme({bool isDark = false}) {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: isDark
          ? AppColors.darkPrimaryBackground
          : AppColors.primaryBackground,
      shape: Border(
        bottom: BorderSide(
          color: isDark ? AppColors.darkSecondary : AppColors.secondary,
          width: 1.0,
          style: BorderStyle.solid,
        ),
      ),
      elevation: kAppBarElevation,
    );
  }
}
