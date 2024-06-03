import 'package:logger/logger.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../../../../../core/networking/api/api_service.dart';
import '../../../../../core/shared_preferences/auth_prefs.dart';

import '../../../../../core/models/user.dart';

class ProfileRepo {
  final ApiService _apiService;
  ProfileRepo(this._apiService);

  Future<ApiResult<User>> getUserInformation() async {
    try {
      final user = await _apiService.getUserInformation(
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(user);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
