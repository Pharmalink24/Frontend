import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/on_boarding/models/on_boarding_pages.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/on_boarding/widgets/intro_image.dart';
import "./models/on_boarding_page.dart";
import 'package:pharmalink/core/helpers/extensions.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  List<PageViewModel> listPagesViewModel = [];

  @override
  void initState() {
    for (OnBoardingPageModel pageModel in onBoardingPages) {
      listPagesViewModel.add(PageViewModel(
        title: pageModel.title,
        body: pageModel.body,
        image: IntroImage(path: '${AppPaths.introductions}/${pageModel.image}'),
        decoration: PageDecoration(
          titleTextStyle:
              AppTextStyle.headlineLarge.copyWith(fontWeight: FontWeight.w700),
          bodyTextStyle: AppTextStyle.labelSmall
              .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
          pageColor: AppColors.primaryBackground,
          imagePadding: const EdgeInsets.all(0.0),
          imageFlex: 7,
          bodyFlex: 5,
          footerFlex: 1,
        ),
      ));
    }
    super.initState();
  }

  void _onIntroEnd(BuildContext context) {
    context.pushNamed(Routes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: AppColors.primaryBackground,
      allowImplicitScrolling: true,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showBackButton: true,
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
        'Sign in',
        style: AppTextStyle.labelMedium.copyWith(
          color: AppColors.alternate,
          // fontSize: 15.0,
        ),
      ),
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(12.0, 12.0),
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
