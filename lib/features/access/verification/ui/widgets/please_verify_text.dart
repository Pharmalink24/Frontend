import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/styles.dart';

class PleaseVerifyText extends StatelessWidget {
  const PleaseVerifyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Text(
        AppLocalizations.of(context).translate('pleaseVerifyEmail'),
        style: AppTextStyle.displayMedium(context).copyWith(fontSize: 28.0),
      ),
    );
  }
}
