import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

const kFontSize = 30.0;

class WelcomeNameText extends StatelessWidget {
  final String fname;
  final String lname;

  const WelcomeNameText({
    super.key,
    this.fname = "",
    this.lname = "",
  });

  @override
  Widget build(BuildContext context) {
    const colorizeTextStyle = TextStyle(
      fontSize: 50.0,
      fontFamily: 'Horizon',
    );

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
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(
                  fname,
                  textStyle: AppTextStyle.bodyMedium.copyWith(
                    fontFamily: AppFonts.secondary,
                    color: AppColors.primary,
                    fontSize: kFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [
                    AppColors.primary,
                    AppColors.accent4,
                  ],
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  speed: const Duration(milliseconds: 1000),
                ),
                ColorizeAnimatedText(
                  lname,
                  textStyle: AppTextStyle.bodyMedium.copyWith(
                    fontFamily: AppFonts.secondary,
                    color: AppColors.primary,
                    fontSize: kFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [
                    AppColors.primary,
                    AppColors.accent4,
                  ],
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  speed: const Duration(milliseconds: 1000),
                ),
              ],
              isRepeatingAnimation: true,
            ),
          ],
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.notifications,
        //     color: AppColors.primaryText,
        //   ),
        // ),
      ],
    );
  }
}
