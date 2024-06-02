import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../core/localization/app_localizations.dart';
import '../models/on_boarding_pages.dart';
import '../../../core/theme/styles.dart';
import 'widgets/intro_image.dart';
import "../models/on_boarding_page.dart";
import 'package:auto_route/auto_route.dart';

@RoutePage()
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
          image: IntroImage(path: pageModel.image),
          decoration: PageDecoration(
            titleTextStyle: AppTextStyle.headlineLarge(context).copyWith(
              fontWeight: FontWeight.w700,
            ),
            bodyTextStyle: AppTextStyle.labelSmall(context)
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
            pageColor: context.colorScheme.surface,
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
    // Push to sign screen
    context.pushRoute(const SignRoute());
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: listPagesViewModel,
      globalBackgroundColor: context.colorScheme.surface,
      allowImplicitScrolling: true,
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showBackButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      back: Icon(
        Icons.arrow_back,
        color: context.colorScheme.tertiary,
      ),
      next: Icon(
        Icons.arrow_forward,
        color: context.colorScheme.tertiary,
      ),
      done: Text(
        AppLocalizations.of(context).translate('signIn'),
        style: AppTextStyle.labelMedium(context).copyWith(
          color: context.colorScheme.tertiary,
          // fontSize: 15.0,
        ),
      ),
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        size: const Size(12.0, 12.0),
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        activeColor: context.colorScheme.primary,
      ),
      dotsContainerDecorator: ShapeDecoration(
        color: context.colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
      ),
    );
  }
}
