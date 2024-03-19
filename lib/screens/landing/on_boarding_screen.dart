// Dart Packages
// Flutter Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/screens/landing/landing_screen.dart';
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static String url = "introduction/";

  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.pushNamed(context, LandingScreen.url);
  }

  Widget _buildImage(String assetPath) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    );
  }

  @override
  Widget build(BuildContext context) {
    PageDecoration pageDecoration = PageDecoration(
      titleTextStyle: AppTextStyle.title.copyWith(fontWeight: FontWeight.w900),
      bodyTextStyle: AppTextStyle.subtitle
          .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
      pageColor: AppColors.primaryBackground,
      imagePadding: EdgeInsets.all(0.0),
      imageFlex: 7,
      bodyFlex: 5,
      footerFlex: 1,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.primaryBackground,
      allowImplicitScrolling: true,
      autoScrollDuration: 5000,
      infiniteAutoScroll: true,
      pages: [
        PageViewModel(
          title: "Streamlined Companion App.",
          body:
              "Patients cant track prescriptions, contact their physicians, and get medication reminders.",
          image: _buildImage('${AppPaths.introductions}/image (1).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Real-Time Drug Interaction Alerts",
          body:
              "Physicians get alerted about possible risky interactions as the medications are prescribed.",
          image: _buildImage('${AppPaths.introductions}/image (2).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "100% Digital Prescription System.",
          body:
              "Paper-and-pen prescriptions are totally eliminated and replaced by a greener, more reliable, and more readable alternative.",
          image: _buildImage('${AppPaths.introductions}/image (3).png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Cloud-Based Operation",
          body:
              "PharmaLink requires no installation and a very minimal learning curve to get physicians started.",
          image: _buildImage('${AppPaths.introductions}/image (4).png'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showBackButton: true,
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      back: const Icon(
        Icons.arrow_back,
        color: AppColors.alternate,
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: AppColors.alternate,
      ),
      done: Text(
        'Done',
        style: AppTextStyle.cardLabelTextStyle.copyWith(
          color: AppColors.alternate,
          fontSize: 15.0,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(12.0, 12.0),
        color: AppColors.accent4,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        activeColor: AppColors.primary,
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}
