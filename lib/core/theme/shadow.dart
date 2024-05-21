import 'package:flutter/material.dart';

class AppShadows {
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
