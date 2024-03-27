import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

class SignupTab extends StatelessWidget {
  const SignupTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Sign In",
              style: AppTextStyle.displaySmall.copyWith(
                color: AppColors.secondaryText,
                fontFamily: AppFonts.tertiary,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Sign Up",
              style: AppTextStyle.displaySmall.copyWith(
                color: AppColors.primaryText,
                fontFamily: AppFonts.tertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
