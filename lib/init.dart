import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'core/di/dependency_injection.dart';
import 'core/shared_preferences/shared_preferences_service.dart';
import 'dart:async';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

Future<void> init() async {
  // Required for async calls in `main`
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize get it
  setupGetIt();
  // Initialize PreferenceUtils instance.
  await SharedPrefsService.init();

  // Initialize firebase messaging
  // await firebaseMessagingInit();

  // Initialize deep linking
  await deepLinking();

  // Initialize background service
  await initializeBackgroundAndForegroundService();
}

Future<void> firebaseMessagingInit() async {
  await Firebase.initializeApp(

      // options: DefaultFirebaseOptions.currentPlatform,
      );
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  messaging.getToken().then((value) {
    Logger().i(value);
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    Logger().i("message received");
    Logger().i(event.notification!.body);
  });
  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    Logger().i('Message clicked!');
  });
}

/// Foreground and Background
Future<void> initializeBackgroundAndForegroundService() async {
  final service = FlutterBackgroundService();

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: false,
      isForegroundMode: true,
      // notificationChannelId: 'my_foreground',
      // initialNotificationContent: 'running',
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );
}

/// Deep linking
Future<void> deepLinking() async {}

///---------------------------------------- main.dart ----------------------------------------//

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();
  return true;
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });
    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // bring to foreground
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (service is AndroidServiceInstance) {
      if (await service.isForegroundService()) {
        flutterLocalNotificationsPlugin.show(
          0,
          'This is foreground',
          '${DateTime.now()}',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              "notificationChannelId",
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );
      }
    }
  });
}
