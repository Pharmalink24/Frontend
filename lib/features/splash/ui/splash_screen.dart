import 'package:flutter/material.dart';

import 'widgets/direct_to.dart';
import 'widgets/logo_icon.dart';
import 'widgets/subtitle_animation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                LogoIcon(),
                SubtitleAnimation(),
                DirectTo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
