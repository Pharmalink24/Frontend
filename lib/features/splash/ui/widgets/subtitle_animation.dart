import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubtitleAnimation extends StatelessWidget {
  bool _isFirstOpen = true;
  bool _isLogged = false;
  SubtitleAnimation({super.key});

  void validationThenSignin(BuildContext context) {}

  // Load stored variables
  void _loadPreferences(context) {
    context.read<AuthCubit>().emitSigninStates();
    // context.read<EntryCubit>().emitEntry();
  }

  void directToRightScreen(BuildContext context) {
    _isFirstOpen
        ? context.pushNamed(Routes.onBoardingScreen)
        : _isLogged
            ? context.pushNamed(Routes.mainScreen)
            : context.pushNamed(Routes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: false,
      animatedTexts: [
        TypewriterAnimatedText(
          speed: const Duration(milliseconds: 75),
          appSubtitle,
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.titleMedium.copyWith(
            fontFamily: AppFonts.secondary,
            color: AppColors.secondary,
          ),
        ),
      ],
      onNext: (index, isLast) {
        _loadPreferences(context);
        directToRightScreen(context);
      },
    );
  }
}
