import '../../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../../../../../../shared/data/data_sources/remote/api/api_service.dart';
import '../models/change_password_request_body.dart';
import '../models/change_password_response.dart';

class ChangePasswordRepo {
  final ApiService _apiService;
  ChangePasswordRepo(this._apiService);

  Future<ApiResult<ChangePasswordResponse>> changePassword(
      ChangePasswordRequestBody changePasswordRequestBody) async {
    try {
      final response = await _apiService.changePassword(
        changePasswordRequestBody,
      );

      return ApiResult.success(response);
    } catch (error) {
      // getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
