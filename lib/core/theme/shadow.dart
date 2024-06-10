import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class AppShadows {
  // Shadow
  static Shadow shadow(BuildContext context) {
    return Shadow(
      color: context.colorScheme.shadow,
      blurRadius: 2.0,
      offset: const Offset(0, 1),
    );
  }

  // Box Shadow
  static List<BoxShadow> box(BuildContext context) {
    return [
      BoxShadow(
        color: context.colorScheme.shadow,
        blurRadius: 2.0,
        offset: const Offset(0, 1),
      ),
    ];
  }
}
