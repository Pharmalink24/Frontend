import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/helpers/constants/paths.dart';
import '../../../../core/theme/styles.dart';

const kLogoSize = 150.0;

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ImageIcon(
          const AssetImage("${AppPaths.images}/logo.png"),
          size: kLogoSize,
          color: Theme.of(context).colorScheme.primary,
        ),
        Text(
          AppLocalizations.of(context).translate('appName'),
          textAlign: TextAlign.center,
          style: AppTextStyle.displayMedium(context),
        ),
      ],
    );
  }
}
