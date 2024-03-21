import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const TextSpan(
            text: 'By logging, you agree to our',
            style: AppTextStyle.labelMedium,
          ),
          TextSpan(
            text: ' Terms & Conditions',
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: ' and ',
            style: AppTextStyle.labelMedium.copyWith(height: 1.5),
          ),
          TextSpan(
            text: 'Privacy Policy',
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
