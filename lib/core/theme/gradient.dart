import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AppGradients {
  static primaryColors(BuildContext context) => [
        Theme.of(context).colorScheme.primary,
        AppColors.accent4,
      ];

  static secondaryColors(BuildContext context) => [
        Theme.of(context).colorScheme.primary,
        Theme.of(context).colorScheme.background,
      ];

  // Gradient Colors
  static LinearGradient main(BuildContext context) {
    return LinearGradient(
      colors: primaryColors(context),
      stops: const [0, 1],
      begin: const AlignmentDirectional(1, 1),
      end: const AlignmentDirectional(-1, -1),
    );
  }

  static LinearGradient secondary(BuildContext context) {
    return LinearGradient(
      colors: secondaryColors(context),
      stops: const [0, 1],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
