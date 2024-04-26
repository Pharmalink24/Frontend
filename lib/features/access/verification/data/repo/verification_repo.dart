import 'package:logger/logger.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../../../core/networking/api_result.dart';
import '../../../../../core/networking/api_service.dart';
import '../models/verification_request_params.dart';
import '../models/verification_response.dart';

class VerificationRepo {
  final ApiService _apiService;

  VerificationRepo(this._apiService);

  Future<ApiResult<VerificationResponse>> resendVerification(
      VerificationRequestParams verificationRequestParams) async {
    try {
      final response =
          await _apiService.resendVerification(verificationRequestParams);
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
