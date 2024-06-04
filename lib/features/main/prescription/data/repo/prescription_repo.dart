import 'package:logger/logger.dart';
import 'package:pharmalink/core/models/message_response.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/enums/drug_state.dart';
import '../models/prescription_doctor.dart';
import '../models/prescription_info.dart';
import '../../../../../core/models/state_request_body.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../../../../../core/networking/api/api_service.dart';
import '../../../../../core/shared_preferences/auth_prefs.dart';

class PrescriptionRepo {
  final ApiService _apiService;

  PrescriptionRepo(this._apiService);

  Future<ApiResult<PrescriptionInfo>> getPrescription(
      int prescriptionId) async {
    try {
      final prescription = await _apiService.getSpecificPrescriptionInfo(
        prescriptionId,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescription);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<PrescriptionDoctor>>> getPrescriptionsDoctors(
      DrugState drugState) async {
    try {
      final prescriptions = await _apiService.getPrescriptionsDoctors(
        StateRequestBody(state: drugState),
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescriptions);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<PrescriptionInfo>>> getPrescriptionsDrugs(
      DrugState drugState) async {
    try {
      final prescriptions = await _apiService.getPrescriptionsDrugs(
        StateRequestBody(state: drugState),
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescriptions);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Activate Prescription
  Future<ApiResult<MessageResponse>> activatePrescription(
    int prescriptionId,
  ) async {
    try {
      final message = await _apiService.activatePrescription(
        prescriptionId,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(message);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Deactivate Prescription
  Future<ApiResult<MessageResponse>> deactivatePrescription(
    int prescriptionId,
  ) async {
    try {
      final message = await _apiService.deactivatePrescription(
        prescriptionId,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(message);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Activate Drug
  Future<ApiResult<MessageResponse>> activateDrug(
    int prescriptionId,
    String drugName,
  ) async {
    try {
      final message = await _apiService.activateDrug(
        prescriptionId,
        drugName,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(message);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // Deactivate Drug
  Future<ApiResult<MessageResponse>> deactivateDrug(
    int prescriptionId,
    String drugName,
  ) async {
    try {
      final message = await _apiService.deactivateDrug(
        prescriptionId,
        drugName,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(message);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
