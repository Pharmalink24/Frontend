import 'package:flutter/material.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';

class AccountSettingsHeader extends StatelessWidget {
  const AccountSettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Text(
            AppLocalizations.of(context).translate('accountSettings'),
            style: AppTextStyle.bodyMedium(context).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
