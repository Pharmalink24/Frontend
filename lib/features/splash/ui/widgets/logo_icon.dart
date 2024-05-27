import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/icons.dart';
import '../../../../core/theme/styles.dart';

const kLogoSize = 150.0;

class LogoIcon extends StatelessWidget {
  const LogoIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          FFIcons.kLogoPharmaLink,
          size: kLogoSize,
          color: context.colorScheme.primary,
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
