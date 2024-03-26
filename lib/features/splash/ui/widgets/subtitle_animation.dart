import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/shared_preferences/entry_prefs.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

class SubtitleAnimation extends StatefulWidget {
  SubtitleAnimation({super.key});

  @override
  State<SubtitleAnimation> createState() => _SubtitleAnimationState();
}

class _SubtitleAnimationState extends State<SubtitleAnimation> {
  bool _isFirstEntry = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
  }

  // Load stored variables
  void _loadPreferences(BuildContext context) async {
    await AuthSharedPrefs.loadUserAuthData();
    await EntrySharedPrefs.loadEntryData();

    _isLoggedIn = AuthSharedPrefs.isUserLoggedIn();

    _isFirstEntry = EntrySharedPrefs.isFirstEntry();
    EntrySharedPrefs.storeEntryData(false);
  }

  void directToRightScreen(BuildContext context) {
    _isFirstEntry
        ? _isLoggedIn
            ? context.pushNamed(Routes.mainScreen)
            : context.pushNamed(Routes.onBoardingScreen)
        : _isLoggedIn
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
