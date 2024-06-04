import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../core/localization/app_localizations.dart';
import '../../../core/theme/styles.dart';
import 'package:auto_route/auto_route.dart';
import 'widgets/on_boarding_screens.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  void _onIntroEnd(BuildContext context) {
    // Push to sign screen
    context.pushRoute(const SignRoute());
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: createListPagesViewModel(context),
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
