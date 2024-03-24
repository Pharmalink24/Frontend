import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/splash/widgets/logo_icon.dart';
import 'package:pharmalink/features/splash/widgets/subtitle_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
