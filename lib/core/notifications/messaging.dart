import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';

initializeMessaging() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  Logger().i('User granted permission: ${settings.authorizationStatus}');

  await messaging.setAutoInitEnabled(true);

  // You may set the permission requests to "provisional" which allows the user to choose what type
  // of notifications they would like to receive once the user receives a notification.
  final notificationSettings =
      await messaging.requestPermission(provisional: true);

  // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
  final apnsToken = await messaging.getAPNSToken();
  if (apnsToken != null) {
    // APNS token is available, make FCM plugin API requests...
    Logger().i('APNS Token: $apnsToken');
  }

  messaging.onTokenRefresh.listen((fcmToken) {
    // TODO: If necessary send token to application server.
    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.

    Logger().i('FCM Token: $fcmToken');
  }).onError((err) {
    // Error getting token.
    Logger().e('Error getting FCM token: $err');
  });

  final fcmToken = await messaging.getToken();
  Logger().i('FCM Token: $fcmToken');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}