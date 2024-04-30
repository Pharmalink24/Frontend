import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

import '../../../core/routes/routes.dart';
import '../models/on_boarding_pages.dart';
import '../../../core/theme/colors.dart';
import '../../../core/helpers/constants/paths.dart';
import '../../../core/theme/styles.dart';
import 'widgets/intro_image.dart';
import "../models/on_boarding_page.dart";
import '../../../core/helpers/extensions.dart';

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
      listPagesViewModel.add(
        PageViewModel(
          title: AppLocalizations.of(context).isEnLocale
              ? pageModel.title
              : pageModel.titleInArabic,
          body: AppLocalizations.of(context).isEnLocale
              ? pageModel.body
              : pageModel.bodyInArabic,
          image:
              IntroImage(path: '${AppPaths.introductions}/${pageModel.image}'),
          decoration: PageDecoration(
            titleTextStyle: AppTextStyle.headlineLarge(context).copyWith(
              fontWeight: FontWeight.w700,
            ),
            bodyTextStyle: AppTextStyle.labelSmall(context)
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
            pageColor: AppColors.primaryBackground,
            imagePadding: const EdgeInsets.all(0.0),
            imageFlex: 7,
            bodyFlex: 5,
            footerFlex: 1,
          ),
        ),
      );
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
        AppLocalizations.of(context).translate('signIn'),
        style: AppTextStyle.labelMedium(context).copyWith(
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
