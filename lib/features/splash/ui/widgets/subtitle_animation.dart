import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

class SubtitleAnimation extends StatelessWidget {
  const SubtitleAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: false,
      animatedTexts: [
        TypewriterAnimatedText(
          speed: const Duration(milliseconds: 100),
          'Digital Drug Prescription Solution',
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.titleMedium.copyWith(
            fontFamily: AppFonts.secondary,
            color: AppColors.secondary,
          ),
        ),
      ],
      onNext: (_, __) {
        Navigator.pushNamed(context, Routes.onBoardingScreen);
      },
    );
  }
}
