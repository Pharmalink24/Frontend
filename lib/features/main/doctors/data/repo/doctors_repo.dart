import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/models/doctor_info.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

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
