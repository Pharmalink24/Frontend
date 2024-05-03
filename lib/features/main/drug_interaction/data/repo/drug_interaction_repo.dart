import 'package:logger/logger.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../../../../../core/shared_preferences/auth_prefs.dart';
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
