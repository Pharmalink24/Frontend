import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

String username = "Mohammed";

class WelcomeNameText extends StatelessWidget {
  const WelcomeNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Hello, ",
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.secondary,
                  fontSize: 30,
                  fontFamily: AppFonts.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: username,
                style: AppTextStyle.bodyMedium.copyWith(
                  color: AppColors.primary,
                  fontSize: 30,
                  fontFamily: AppFonts.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: AppColors.primaryText,
            )),
      ],
    );
  }
}
