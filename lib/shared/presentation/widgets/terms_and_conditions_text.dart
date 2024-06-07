import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 16.0,
        left: 16.0,
        bottom: 0.0,
        top: 24.0,
      ),
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
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: AppLocalizations.of(context)
                  .translate('termsAndConditionsP3'),
              style: AppTextStyle.labelSmall(context).copyWith(
                height: 2,
              ),
            ),
            TextSpan(
              text: AppLocalizations.of(context)
                  .translate('termsAndConditionsP4'),
              style: AppTextStyle.labelSmall(context).copyWith(
                color: context.colorScheme.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
