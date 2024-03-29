import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_request_body.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_response.dart';

class DrugInteractionRepo {
  final ApiService _apiService;

  DrugInteractionRepo(this._apiService);

  Future<ApiResult<List<Drug>>> searchDrugFromDrugEye(
      DrugEyeSearchRequestParams drugEyeSearchRequestParams) async {
    try {
      final drugs = await _apiService.searchDrugFromDrugEye(
          drugEyeSearchRequestParams, AuthSharedPrefs.getAccessToken());
      return ApiResult.success(drugs);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<DrugInteractionResponse>> drugInteractionCheck(
      DrugInteractionRequestBody drugInteractionRequestBody) async {
    try {
      final result = await _apiService.drugInteractionCheck(
          drugInteractionRequestBody, AuthSharedPrefs.getAccessToken());
      return ApiResult.success(result);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

}
