// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
// External Packages
import 'package:loading_animation_widget/loading_animation_widget.dart';
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
