import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

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
            const TextSpan(
              text: 'By logging, you agree to our',
              style: AppTextStyle.labelSmall,
            ),
            TextSpan(
              text: ' Terms & Conditions',
              style: AppTextStyle.labelSmall.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: ' and ',
              style: AppTextStyle.labelSmall.copyWith(height: 1.5),
            ),
            TextSpan(
              text: 'Privacy Policy',
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
