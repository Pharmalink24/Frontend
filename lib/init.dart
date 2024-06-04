import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'core/di/dependency_injection.dart';
import 'core/notifications/messaging.dart';
import 'core/shared_preferences/shared_preferences_service.dart';
import 'dart:async';
import 'firebase_options.dart';

Future<void> init() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize get it
  setupGetIt();

  // Initialize PreferenceUtils instance.
  await sharedPreferencesInit();

  // Initialize firebase messaging
  await firebaseMessagingInit();

  // Initialize deep linking
  await deepLinking();

}

Future<void> sharedPreferencesInit() async {
  await SharedPrefsService.init();
}

Future<void> firebaseMessagingInit() async {
  initializeMessaging(); 
}


/// Deep linking
Future<void> deepLinking() async {}