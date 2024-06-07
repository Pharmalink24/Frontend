import 'package:flutter/material.dart';
import 'pharmalink_app.dart';
import 'init.dart';
import 'package:device_preview_screenshot/device_preview_screenshot.dart';

const kReleaseMode = false;

void main() async {
  // initialize the app
  await init();

  // run the app
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      tools: const [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(),
    ],
      builder: (context) => const PharmalinkApp(isReleaseMode:kReleaseMode), // Wrap your app
    ),
  );
}
