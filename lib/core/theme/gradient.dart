import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AppGradients {
  static colors(BuildContext context) => [
        Theme.of(context).colorScheme.primary,
        AppColors.accent4,
      ];

  // Gradient Colors
  static LinearGradient main(BuildContext context) {
    return LinearGradient(
      colors: colors(context),
      stops: const [0, 1],
      begin: const AlignmentDirectional(1, 1),
      end: const AlignmentDirectional(-1, -1),
    );
  }
}
