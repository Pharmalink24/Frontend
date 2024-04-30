import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

class AccountSettingsHeader extends StatelessWidget {
  const AccountSettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            AppLocalizations.of(context).translate('accountSettings'),
            style: AppTextStyle.labelMedium(context),
          ),
        ),
      ],
    );
  }
}
