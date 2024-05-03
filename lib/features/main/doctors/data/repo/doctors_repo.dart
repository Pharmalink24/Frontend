import 'package:logger/logger.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/models/doctor.dart';
import '../../../../../core/models/doctor_info.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/shared_preferences/auth_prefs.dart';

class DoctorsRepo {
  final ApiService _apiService;
  DoctorsRepo(this._apiService);

  // Retrieve the list of doctors
  Future<ApiResult<List<Doctor>>> getDoctorList() async {
    try {
      final response =
          await _apiService.getDoctorList(AuthSharedPrefs.getAccessToken());
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DoctorInfo>> getDoctorProfile(int doctorId) async {
    try {
      final response = await _apiService.getDoctorProfile(
        doctorId,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // // Retrieve the list of doctors based on their state
  // Future<ApiResult<List<Doctor>>> getDoctorListWithState(
  //     StateRequestBody stateRequestBody) async {
  //   try {
  //     final response = await _apiService.getDoctorListWithState(
  //         stateRequestBody, AuthSharedPrefs.getAccessToken());
  //     return ApiResult.success(response);
  //   } catch (error) {
  //     getIt<Logger>().e(error);
  //     return ApiResult.failure(ErrorHandler.handle(error));
  //   }
  // }
}
