// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/shared_preferences/shared_preferences_service.dart';
import 'pharmalink_app.dart';
import 'package:pharmalink/core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Required for async calls in `main`

  setupGetIt(); // Initialize get it
  await SharedPrefsService.init(); // Initialize PreferenceUtils instance.

  runApp(
    PharmalinkApp(
      appRouter: AppRouter(),
    ),
  );
}
