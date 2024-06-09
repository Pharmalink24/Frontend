import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmalink/core/notifications/firebase_notifications.dart';
import 'core/di/dependency_injection.dart';
import 'dart:async';
import 'core/helpers/shared_preferences/shared_preferences_service.dart';
import 'firebase_options.dart';

Future<void> init() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize get it
  await setupGetIt();

  // Initialize PreferenceUtils instance.
  await SharedPrefsService.init();
  SharedPrefsService.clearAllData();

  // Initialize firebase messaging
  await getIt<FirebaseNotifications>().init();

  // Initialize deep linking
  await deepLinking();
}

/// Deep linking
Future<void> deepLinking() async {}
