import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart'; // Todo: Remove this line
import '../../../../../core/theme/styles.dart';
import '../../../../../core/localization/app_localizations.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context).translate('hello'),
              style: AppTextStyle.bodyMedium(context).copyWith(
                fontSize: kFontSize,
              ),
            ),
            AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(
                  fname,
                  textStyle: AppTextStyle.bodyMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: kFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    AppColors.accent4,
                  ],
                  textAlign: TextAlign.start,
                  textDirection: TextDirection.ltr,
                  speed: const Duration(milliseconds: 1000),
                ),
                ColorizeAnimatedText(
                  lname,
                  textStyle: AppTextStyle.bodyMedium(context).copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: kFontSize,
                    fontWeight: FontWeight.w600,
                  ),
                  colors: [
                    Theme.of(context).colorScheme.primary,
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
