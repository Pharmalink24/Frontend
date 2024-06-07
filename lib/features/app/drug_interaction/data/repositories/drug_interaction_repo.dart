import 'package:logger/logger.dart';
import 'package:pharmalink/features/app/drug_interaction/data/models/interaction.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../data_sources/remote/drug_interaction_api_service.dart';
import '../models/drug_eye_search_request_params.dart';
import '../models/drug_search.dart';
import '../models/drug_interaction_request_body.dart';
import '../models/drug_interaction_response.dart';

class DrugInteractionRepo {
  final DrugInteractionApiService _drugInteractionApiService;

  DrugInteractionRepo(this._drugInteractionApiService);

  Future<ApiResult<List<DrugSearch>>> searchDrugFromDrugEye(
      DrugEyeSearchRequestParams drugEyeSearchRequestParams) async {
    try {
      final drugs =
          await _drugInteractionApiService.searchDrugFromDrugEye(drugEyeSearchRequestParams);
      return ApiResult.success(drugs);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<TwoDrugsInteractionResponse>> checkInteractionBetween2Drugs(
      DrugInteractionRequestBody drugInteractionRequestBody) async {
    try {
      final result = await _drugInteractionApiService
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
          await _drugInteractionApiService.checkInteractionBetweenDrugAndMedications(
        drugInteractionRequestBody,
      );
      return ApiResult.success(result);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
