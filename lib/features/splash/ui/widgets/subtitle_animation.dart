import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubtitleAnimation extends StatelessWidget {
  bool _isFirstOpen = true;
  bool _isLogged = false;
  SubtitleAnimation({super.key});

  // Load stored variables
  Future<void> _loadPreferences() async {
    // Retrieve shared Preferences instance
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Set first time key
    _isFirstOpen = prefs.getBool(AppKeys.isFirstOpen) ?? true;
    prefs.setBool(AppKeys.isFirstOpen, false);

    // Set first time key
    _isLogged = prefs.getString(AppKeys.token) != null;
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
      onNext: (index, isLast) async {
        await _loadPreferences();
        directToRightScreen(context);
      },
    );
  }
}
