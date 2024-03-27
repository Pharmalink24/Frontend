import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_response.dart';

class DrugInteractionRepo {
  final ApiService _apiService;

  DrugInteractionRepo(this._apiService);

  Future<ApiResult<DrugEyeSearchResponse>> searchDrugFromDrugEye(
      DrugEyeSearchRequestParams drugEyeSearchRequestParams) async {
    try {
      final response =
          await _apiService.searchDrugFromDrugEye(drugEyeSearchRequestParams);
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
