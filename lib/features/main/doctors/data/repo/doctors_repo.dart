import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/core/models/state_request_body.dart';

class DoctorsRepo {
  final ApiService _apiService;
  DoctorsRepo(this._apiService);

  Future<ApiResult<List<Doctor>>> getDoctorList(StateRequestBody stateRequestBody) async {
    try {
      final response = await _apiService.getDoctorList(
          stateRequestBody, AuthSharedPrefs.getAccessToken());
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
