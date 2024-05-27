import 'package:flutter/material.dart';

class AppShadows {
  // Shadow
  static Shadow shadow(BuildContext context) {
    return Shadow(
      color: Theme.of(context).colorScheme.shadow,
      blurRadius: 4.0,
      offset: const Offset(0, 1),
    );
  }

  // Box Shadow
  static List<BoxShadow> box(BuildContext context) {
    return [
      BoxShadow(
        color: Theme.of(context).colorScheme.shadow,
        blurRadius: 4.0,
        offset: const Offset(0, 1),
      ),
    ];
  }
}
