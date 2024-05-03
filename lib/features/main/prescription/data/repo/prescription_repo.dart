import 'package:logger/logger.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/enums/drug_state.dart';
import '../../../../../core/models/prescription1.dart';
import '../../../../../core/models/prescription2.dart';
import '../../../../../core/models/prescription_info.dart';
import '../../../../../core/models/state_request_body.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/shared_preferences/auth_prefs.dart';

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

  Future<ApiResult<List<Prescription1>>> getPrescriptions1(
      DrugState drugState) async {
    try {
      final prescriptions = await _apiService.getPrescriptions1(
        StateRequestBody(state: drugState),
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescriptions);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<Prescription2>>> getPrescriptions2(
      DrugState drugState) async {
    try {
      final prescriptions = await _apiService.getPrescriptions2(
        StateRequestBody(state: drugState),
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(prescriptions);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<Prescription1>>> prescription2TransformToPrescription1(
      List<Prescription2> prescriptions) async {
    try {
      List<Prescription1> prescriptionsListEdited = [];
      for (var prescription in prescriptions) {
        final doctor = await _apiService.getDoctorProfile(
          prescription.doctorId,
          AuthSharedPrefs.getAccessToken(),
        );

        Prescription1 prescriptionEdited = Prescription1(
          id: prescription.id,
          createdAt: prescription.createdAt,
          doctorInfo: doctor,
        );
        prescriptionsListEdited.add(prescriptionEdited);
      }
      return ApiResult.success(prescriptionsListEdited);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
