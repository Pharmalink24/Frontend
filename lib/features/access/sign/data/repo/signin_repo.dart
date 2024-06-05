import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/models/message_response.dart';
import 'package:pharmalink/core/notifications/firebase_notifications.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../../../../../core/di/dependency_injection.dart';

import '../../../../../core/models/device_token_request_body.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../../../../../core/networking/api/api_service.dart';
import '../models/signin/signin_request_body.dart';
import '../models/signin/signin_response.dart';

class SigninRepo {
  final ApiService _apiService;

  SigninRepo(this._apiService);

  Future<ApiResult<SigninResponse>> signin(
      SigninRequestBody signinRequestBody) async {
    try {
      final response = await _apiService.signin(signinRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<MessageResponse>> updateDeviceToken() async {
    try {
      // Update device token
      final deviceToken = await getIt<FirebaseNotifications>().getDeviceToken();
      final response = await _apiService.setDeviceToken(
        DeviceTokenRequestBody(deviceToken: deviceToken),
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
