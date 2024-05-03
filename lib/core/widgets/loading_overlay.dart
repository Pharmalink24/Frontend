import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LoadingOverlay {
  OverlayEntry? _overlay;
  final Duration hideTime;

  LoadingOverlay({
    this.hideTime = const Duration(seconds: 2),
  });

  void show(BuildContext context) {
    if (_overlay == null) {
      _overlay = OverlayEntry(
        // replace with your own layout
        builder: (context) => ColoredBox(
          color: AppColors.secondary.withOpacity(0.5),
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
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
