// Flutter Packages
import 'package:flutter/material.dart';
// Components
import 'package:pharmalink/components/icon_content.dart';
import 'package:pharmalink/components/reusable_card.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
// Packages
import 'package:animated_text_kit/animated_text_kit.dart';

const kBottomMargin = 80.0;
const kLogoSize = 175.0;
const kTitleSize = 37.0;
const kSubtitleSize = 14.0;
const kAppBarLogoSize = 55.0;

class WelcomeScreen extends StatelessWidget {
  static String url = "/";
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Expanded(
          child: ImageIcon(
            AssetImage("${AppPath.images}/white_logo.png"),
            size: kAppBarLogoSize,
          ),
        ),
        backgroundColor: AppColors.secondary,
        shape: const Border(
          bottom: BorderSide(
            color: AppColors.tertiary,
            width: 3,
          ),
        ),
        elevation: 1,
      ),
      backgroundColor: AppColors.primaryBackground,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "${AppPath.images}/logo.png",
                    height: kLogoSize,
                  ),
                  const Text(
                    "PharmaLink",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: kTitleSize,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Readex Pro',
                      color: AppColors.primaryText,
                    ),
                  ),
                  AnimatedTextKit(
                    repeatForever: true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        speed: const Duration(milliseconds: 75),
                        'Digital Prescription System',
                        textAlign: TextAlign.center,
                        textStyle: const TextStyle(
                          fontSize: kSubtitleSize,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Readex Pro',
                          color: AppColors.secondaryText,
                        ),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Who Are You ?",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Readex Pro',
                      color: AppColors.primaryText,
                    ),
                  ),
                  ReusableCard(
                    onPressed: () {},
                    backgroundColor: AppColors.secondary,
                    child: IconContent(
                      icon: Icons.medical_services_outlined,
                      label: "Doctor",
                    ),
                  ),
                  ReusableCard(
                    onPressed: () {},
                    backgroundColor: AppColors.primary,
                    child: IconContent(
                      icon: Icons.personal_injury_outlined,
                      label: "Patient",
                    ),
                  ),
                  const SizedBox(
                    height: kBottomMargin,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
