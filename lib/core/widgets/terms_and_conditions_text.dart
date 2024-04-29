import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../theme/colors.dart';
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
              text: S.of(context).termsAndConditionsP1,
              style: AppTextStyle.labelSmall,
            ),
            TextSpan(
              text: S.of(context).termsAndConditionsP2,
              style: AppTextStyle.labelSmall.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: S.of(context).termsAndConditionsP3,
              style: AppTextStyle.labelSmall.copyWith(height: 1.5),
            ),
            TextSpan(
              text: S.of(context).termsAndConditionsP4,
              style: AppTextStyle.labelSmall.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
