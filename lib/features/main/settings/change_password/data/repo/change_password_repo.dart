import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/main/settings/change_password/data/models/change_password_response.dart';

import '../models/change_password_request_body.dart';

class ChangePasswordRepo {
  final ApiService _apiService;
  ChangePasswordRepo(this._apiService);

  Future<ApiResult<ChangePasswordResponse>> changePassword(
      ChangePasswordRequestBody changePasswordRequestBody) async {
    try {
      final response = await _apiService.changePassword(
        changePasswordRequestBody,
        AuthSharedPrefs.getAccessToken(),
      );

      return ApiResult.success(response);
    } catch (error) {
      // getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
