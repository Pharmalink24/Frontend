import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

class DoctorRepo {
  final ApiService _apiService;
  const DoctorRepo(this._apiService);

  // Retrieve the list of doctors
  Future<ApiResult<Doctor>> getDoctorProfile(int doctorId) async {
    try {
      final response = await _apiService.getDoctorProfile(
          doctorId, AuthSharedPrefs.getAccessToken());
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
