import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/models/prescription.dart';
import 'package:pharmalink/core/models/prescription_info.dart';
import 'package:pharmalink/core/models/state_request_body.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

class PrescriptionRepo {
  final ApiService _apiService;

  PrescriptionRepo(this._apiService);

  Future<ApiResult<PrescriptionInfo>> getPrescription(
      int prescriptionId) async {
    try {
      final prescription = await _apiService.getPrescriptionInfo(
        prescriptionId,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescription);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<Prescription>>> getPrescriptions(
      DrugState drugState) async {
    try {
      final prescriptions = await _apiService.getPrescriptions(
        StateRequestBody(state: drugState),
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescriptions);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
