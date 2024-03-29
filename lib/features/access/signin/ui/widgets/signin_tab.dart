import 'package:flutter/material.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';

class SigninTab extends StatelessWidget {
  const SigninTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0, bottom: 12.0),
          child: Text(
            "Sign In",
            style: AppTextStyle.displaySmall.copyWith(
              fontFamily: AppFonts.tertiary,
              color: AppColors.primaryText,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.signUpScreen);
            },
            child: Text(
              "Sign Up",
              style: AppTextStyle.displaySmall.copyWith(
                fontFamily: AppFonts.tertiary,
                color: AppColors.secondaryText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
