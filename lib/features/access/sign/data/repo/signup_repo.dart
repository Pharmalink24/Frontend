import '../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../../../../../shared/data/data_sources/remote/api/api_service.dart';
import '../models/signup/signup_request_body.dart';
import '../models/signup/signup_response.dart';

class SignupRepo {
  final ApiService _apiService;

  SignupRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signup(
      SignupRequestBody signupRequestBody) async {
    try {
      final response = await _apiService.signup(signupRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      // getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
