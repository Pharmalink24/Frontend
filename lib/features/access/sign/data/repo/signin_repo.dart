import 'package:logger/logger.dart';
import 'package:pharmalink/shared/domain/entities/models/message_response.dart';
import 'package:pharmalink/core/notifications/firebase_notifications.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../shared/domain/entities/models/device_token_request_body.dart';
import '../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../../../../../shared/data/data_sources/remote/api/api_service.dart';
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
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
