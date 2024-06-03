import 'package:logger/logger.dart';
import 'package:pharmalink/features/access/auth/data/models/forget_password_request_body.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../../../../../core/networking/api/api_service.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);

  Future<ApiResult> resetPassword(String email) async {
    try {
      final response =
          await _apiService.forgetPassword(ForgetPasswordRequestBody(
        email: email,
      ));
      return ApiResult.success(response);
    } on Exception catch (error) {
      Logger().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
