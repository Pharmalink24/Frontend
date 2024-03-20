// Dart Packages
// Flutter Packages
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/landing/landing_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';
// Model Packages
import 'package:pharmalink/presentation/screens/landing/on_boarding_model.dart';
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants/constants.dart';
// External Packages

class OnBoardingScreen extends StatefulWidget {
  static String url = "introduction/";

  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  List<PageViewModel> listPagesViewModel = [];

  PageDecoration pageDecoration = PageDecoration(
    titleTextStyle:
        AppTextStyle.headlineLarge.copyWith(fontWeight: FontWeight.w700),
    bodyTextStyle: AppTextStyle.labelSmall
        .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
    pageColor: AppColors.primaryBackground,
    imagePadding: EdgeInsets.all(0.0),
    imageFlex: 7,
    bodyFlex: 5,
    footerFlex: 1,
  );

  @override
  void initState() {
    for (PageModel pageModel in onBoardingPagesModel) {
      listPagesViewModel.add(PageViewModel(
        title: pageModel.title,
        body: pageModel.body,
        image: _buildImage("${AppPaths.introductions}/${pageModel.image}"),
        decoration: pageDecoration,
      ));
    }
    super.initState();
  }

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
    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.primaryBackground,
      allowImplicitScrolling: true,
      autoScrollDuration: 5000,
      infiniteAutoScroll: true,
      pages: listPagesViewModel,
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
        style: AppTextStyle.labelMedium.copyWith(
          color: AppColors.alternate,
          // fontSize: 15.0,
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
