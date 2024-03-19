// Dart Packages
import 'dart:async';
// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/screens/landing/landing_screen.dart';
// Screens Packages
import 'package:pharmalink/screens/landing/on_boarding_screen.dart';
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const kLogoSize = 150.0;
const kTitleSize = 48.0;
const kSubtitleSize = 18.0;

class WelcomeScreen extends StatefulWidget {
  static String url = "/";
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool? firstTime;

  @override
  void initState() {
    super.initState();
    _loadPreferences();

    Timer(
        Duration(seconds: 10),
        () => firstTime == true
            ? Navigator.pushNamed(context, OnBoardingScreen.url)
            : Navigator.pushNamed(context, LandingScreen.url));
  }

  void _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      firstTime = prefs.getBool('first-time') ?? true;
      prefs.setBool('first-time', false);
    });
  }

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
                const Text(
                  "PharmaLink",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: kTitleSize,
                    fontWeight: FontWeight.w600,
                    fontFamily: AppFonts.primary,
                    color: AppColors.alternateText,
                  ),
                ),
                AnimatedTextKit(
                  repeatForever: false,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      speed: const Duration(milliseconds: 100),
                      'Digital Drug Prescription Solution',
                      textAlign: TextAlign.center,
                      textStyle: const TextStyle(
                        fontSize: kSubtitleSize,
                        fontFamily: AppFonts.secondary,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
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
