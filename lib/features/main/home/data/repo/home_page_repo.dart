import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/main/home/data/models/home_page_request_body.dart';
import 'package:pharmalink/features/main/home/data/models/home_page_response.dart';

class HomePageRepo {
  final ApiService _apiService;
  
  HomePageRepo(this._apiService);

  Future<ApiResult<HomePageResponse>> getHomePageData(
      HomePageRequestBody homePageRequestBody) async {
    try {
      final response = await _apiService.homePage(
          homePageRequestBody, AuthSharedPrefs.getAccessToken());
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
