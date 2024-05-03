import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import '../theme/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: AppLocalizations.of(context)
                  .translate('termsAndConditionsP1'),
              style: AppTextStyle.labelSmall(context),
            ),
            TextSpan(
              text: AppLocalizations.of(context)
                  .translate('termsAndConditionsP2'),
              style: AppTextStyle.labelSmall(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: AppLocalizations.of(context)
                  .translate('termsAndConditionsP3'),
              style: AppTextStyle.labelSmall(context).copyWith(height: 1.5),
            ),
            TextSpan(
              text: AppLocalizations.of(context)
                  .translate('termsAndConditionsP4'),
              style: AppTextStyle.labelSmall(context).copyWith(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
