import 'package:flutter/material.dart';
import 'core/di/dependency_injection.dart';
import 'core/shared_preferences/shared_preferences_service.dart';

Future<void> init() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize get it
  setupGetIt();
  // Initialize PreferenceUtils instance.
  await SharedPrefsService.init();
}
