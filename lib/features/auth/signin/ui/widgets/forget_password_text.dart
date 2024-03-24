import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 12.0),
      child: Align(
        alignment: AlignmentDirectional.bottomEnd,
        child: GestureDetector(
          onTap: () {},
          child: Text(
            "Forget Password?",
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
