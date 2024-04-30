import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

import '../../../../../core/theme/styles.dart';

class JustClickText extends StatelessWidget {
  const JustClickText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        AppLocalizations.of(context).translate('justClickOnTheLink'),
        style: AppTextStyle.bodyMedium(context),
      ),
    );
  }
}
