import 'package:flutter/material.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/shared_preferences/shared_preferences_service.dart';
import 'package:intl/intl_standalone.dart'
    if (dart.library.html) 'package:intl/intl_browser.dart';

Future<void> init() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize get it
  setupGetIt();
  // Initialize PreferenceUtils instance.
  await SharedPrefsService.init();

  // Initialize intl package
  await findSystemLocale();
}
