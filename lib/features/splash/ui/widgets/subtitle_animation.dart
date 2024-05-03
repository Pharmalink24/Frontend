import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../../core/helpers/constants/strings.dart';
import '../../../../core/theme/styles.dart';

class SubtitleAnimation extends StatefulWidget {
  const SubtitleAnimation({super.key});

  @override
  State<SubtitleAnimation> createState() => _SubtitleAnimationState();
}

class _SubtitleAnimationState extends State<SubtitleAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        TypewriterAnimatedText(
          speed: const Duration(milliseconds: 75),
          appSubtitle,
          textAlign: TextAlign.center,
          textStyle: AppTextStyle.titleMedium(context).copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
