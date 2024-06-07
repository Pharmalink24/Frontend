import 'package:logger/logger.dart';
import 'package:pharmalink/shared/domain/entities/models/message_response.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../shared/domain/entities/enums/drug_state.dart';
import '../models/prescription_doctor.dart';
import '../models/prescription_info.dart';
import '../../../../../shared/domain/entities/models/state_request_body.dart';
import '../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../../../../../shared/data/data_sources/remote/api/api_service.dart';

class PrescriptionRepo {
  final ApiService _apiService;

  PrescriptionRepo(this._apiService);

  Future<ApiResult<PrescriptionInfo>> getPrescription(
      int prescriptionId) async {
    try {
      final prescription = await _apiService.getSpecificPrescriptionInfo(
        prescriptionId,
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
      );
      return ApiResult.success(message);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
