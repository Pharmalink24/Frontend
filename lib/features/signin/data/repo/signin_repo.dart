import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/features/signin/data/models/signin_request_body.dart';
import 'package:pharmalink/features/signin/data/models/signin_response.dart';

class SigninRepo {
  final ApiService _apiService;

  SigninRepo(this._apiService);

  Future<ApiResult<SigninResponse>> signin(
      SigninRequestBody signinRequestBody) async {
    try {
      final response = await _apiService.signin(signinRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
