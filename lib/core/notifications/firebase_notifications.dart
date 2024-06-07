import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api/api_service.dart';
import '../di/dependency_injection.dart';
import '../models/device_token_request_body.dart';

class FirebaseNotifications {
  final ApiService _apiService;

  FirebaseNotifications(this._apiService);

  //* Create a new instance of FBMessaging
  final _firebaseMessaging = FirebaseMessaging.instance;

  //* Request permission for notifications
  Future<void> requestPermission() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    getIt<Logger>()
        .i('User granted permission: ${settings.authorizationStatus}');
  }

  //* Get the device token
  Future<String> getDeviceToken() async {
    return await _firebaseMessaging.getToken() ?? '';
  }

  //* Get the FCM token
  Future<void> handleTokens() async {
    // For apple platforms, ensure the APNS token is available before making any FCM plugin API calls
    final apnsToken = await _firebaseMessaging.getAPNSToken();
    if (apnsToken != null) {
      // APNS token is available
      getIt<Logger>().i('APNS Token: $apnsToken');
    }

    // Get the token each time the application loads
    final deviceToken = await getDeviceToken();

    // FCM token is available
    getIt<Logger>().i('FCM Token: $deviceToken');

    // Set the device token in the backend
    _firebaseMessaging.onTokenRefresh.listen((deviceToken) {
      _apiService.setDeviceToken(
        DeviceTokenRequestBody(deviceToken: deviceToken),
      );
    }).onError((err) {
      // Error getting token.
      Logger().e('Error getting FCM token: $err');
    });
  }

  //* Initialize notifications for this app or device
  Future<void> init() async {
    await requestPermission();
    await handleTokens();
    await handleNotification();
  }

  //* Handle notifications
  Future<void> handleNotification() async {
    FirebaseMessaging.onMessage.listen(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessageOpen);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
}

//* Handle notifications when the app is in the background
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  getIt<Logger>().i("Handling a background message: ${message.messageId}");
}

@pragma('vm:entry-point')
//* Handle notifications when opened
void handleMessageOpen(RemoteMessage? message) {
  if (message == null) return;

  getIt<Logger>().i('A new onMessageOpenedApp event was published!');
  getIt<Logger>().i('Message data: ${message.data}');
}

@pragma('vm:entry-point')
//* Handle notifications when received
void handleMessage(RemoteMessage message) {
  getIt<Logger>().i('Got a message whilst in the foreground!');
  getIt<Logger>().i('Message data: ${message.data}');

  if (message.notification != null) {
    Logger()
        .i('Message also contained a notification: ${message.notification}');
  }
}
