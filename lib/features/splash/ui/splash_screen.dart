import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/constants/strings.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/splash/ui/widgets/logo_icon.dart';
import 'package:pharmalink/features/splash/ui/widgets/subtitle_animation.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? _firstTime;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() async {
    super.initState();

    // Load stored variables
    await _loadPreferences();

    // Redirect to right page
    redirect();
  }

  Future<void> _loadPreferences() async {
    // Retrieve shared Preferences instance
    final SharedPreferences prefs = await _prefs;

    // Set first time key
    _firstTime = prefs.getBool(firstTimeKey) ?? true;
    prefs.setBool(firstTimeKey, false);
  }

  void redirect() {
    _firstTime!
        ? context.pushNamed(Routes.onBoardingScreen)
        : context.pushNamed(Routes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.alternate,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                LogoIcon(),
                SubtitleAnimation(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
