import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

const kFontSize = 30.0;

class WelcomeNameText extends StatelessWidget {
  final String name;

  const WelcomeNameText({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ",
              style: AppTextStyle.bodyMedium.copyWith(
                color: AppColors.secondary,
                fontSize: kFontSize,
                fontFamily: AppFonts.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
            GradientText(
              name,
              textAlign: TextAlign.start,
              style: AppTextStyle.bodyMedium.copyWith(
                fontFamily: AppFonts.secondary,
                color: AppColors.primary,
                fontSize: kFontSize,
                fontWeight: FontWeight.w600,
              ),
              colors: const [
                AppColors.primary,
                AppColors.accent4,
              ],
              gradientDirection: GradientDirection.ttb,
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications,
            color: AppColors.primaryText,
          ),
        ),
      ],
    );
  }
}
