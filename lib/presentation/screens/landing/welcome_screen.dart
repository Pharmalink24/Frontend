// Dart Packages
import 'dart:async';
// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/landing/on_boarding_screen.dart';
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants/colors.dart';
import 'package:pharmalink/utilities/constants/fonts.dart';
import 'package:pharmalink/utilities/constants/paths.dart';
// External Packages
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pharmalink/utilities/constants/styles.dart';

const kLogoSize = 150.0;
const kTitleSize = 48.0;
const kSubtitleSize = 18.0;

class WelcomeScreen extends StatelessWidget {
  static const String url = "/";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const ImageIcon(
                  AssetImage("${AppPaths.images}/logo.png"),
                  size: kLogoSize,
                  color: AppColors.alternate,
                ),
                Text(
                  "PharmaLink",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.displayMedium.copyWith(
                      color: AppColors.alternate,
                      fontFamily: AppFonts.primary,
                      fontWeight: FontWeight.w600),
                ),
                AnimatedTextKit(
                  repeatForever: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 100),
                      'Digital Drug Prescription Solution',
                      textAlign: TextAlign.center,
                      textStyle: AppTextStyle.titleMedium.copyWith(
                        fontFamily: AppFonts.secondary,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                  onNext: (_, __) {
                    Navigator.pushNamed(context, OnBoardingScreen.url);
                  },
                ),
                LoadingAnimationWidget.twistingDots(
                  leftDotColor: AppColors.primary,
                  rightDotColor: AppColors.alternate,
                  size: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
