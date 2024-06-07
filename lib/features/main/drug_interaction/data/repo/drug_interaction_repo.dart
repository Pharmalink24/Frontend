import 'package:logger/logger.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/interaction.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../../../../../core/networking/api/api_service.dart';
import '../models/drug_eye_search_request_params.dart';
import '../../../../../core/models/drug_search.dart';
import '../models/drug_interaction_request_body.dart';
import '../models/drug_interaction_response.dart';

class DrugInteractionRepo {
  final ApiService _apiService;

  DrugInteractionRepo(this._apiService);

  Future<ApiResult<List<DrugSearch>>> searchDrugFromDrugEye(
      DrugEyeSearchRequestParams drugEyeSearchRequestParams) async {
    try {
      final drugs =
          await _apiService.searchDrugFromDrugEye(drugEyeSearchRequestParams);
      return ApiResult.success(drugs);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<TwoDrugsInteractionResponse>> checkInteractionBetween2Drugs(
      DrugInteractionRequestBody drugInteractionRequestBody) async {
    try {
      final result = await _apiService
          .checkInteractionBetweenTwoDrugs(drugInteractionRequestBody);
      return ApiResult.success(result);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<List<Interaction>>>
      checkInteractionBetweenDrugAndMedications(
          DrugInteractionRequestBody drugInteractionRequestBody) async {
    try {
      final result =
          await _apiService.checkInteractionBetweenDrugAndMedications(
        drugInteractionRequestBody,
      );
      return ApiResult.success(result);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
