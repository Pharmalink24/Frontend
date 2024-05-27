import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;
  final Duration hideTime;

  LoadingOverlay({
    this.hideTime = const Duration(seconds: 10),
  });

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => ColoredBox(
          color: context.colorScheme.primaryContainer.withOpacity(0.5),
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                context.colorScheme.secondary,
              ),
            ),
          ),
        ),
      );
      Overlay.of(context).insert(_overlay!);
    }

    Future.delayed(hideTime, () {
      hide();
    });
  }

  void hide() {
    if (_overlay != null) {
      _overlay!.remove();
      _overlay = null;
    }
  }
}
