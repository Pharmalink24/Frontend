import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/models/message_response.dart';
import 'package:pharmalink/core/networking/api/api_constants.dart';
import 'package:pharmalink/core/networking/api/api_error_handler.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../../../features/access/auth/data/models/refresh_token_response.dart';
import '../../../pharmalink_app.dart';
import 'api_result.dart';

class RefreshTokenInterceptor extends Interceptor {
  RefreshTokenInterceptor();

  // Instance of Dio
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.httpsDomain));

  // Refresh token API
  Future<ApiResult<RefreshTokenResponse>> refreshToken() async {
    try {
      final data = {
        'refresh_token': AuthSharedPrefs.getRefreshToken(),
      };

      final result = await _dio.post(
        ApiConstants.refreshToken,
        data: data,
      );

      final response = RefreshTokenResponse.fromJson(result.data!);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  // ------------------ Interceptor ------------------ //
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Attempt to refresh the token
      final response = await refreshToken();

      response.when(
        success: (newToken) async {
          Logger().i('Token refreshed successfully');
          // Save the new token
          await AuthSharedPrefs.setAccessToken(newToken.accessToken);
          // Retry the request with the new token
          await retry(handler, err);
        },
        failure: (error) async {
          // Refresh token failed
          appRouter.push(const SignRoute());
          Logger().i(appRouter.currentPath);

          // Clear the auth data
          await AuthSharedPrefs.clearAuthData();

          // So reject the request
          handler.reject(err);
        },
      );
    } else {
      handler.next(err);
    }
  }

  Future<void> retry(ErrorInterceptorHandler handler, DioException err) async {
    // Update the token in headers
    final requestOptions = err.requestOptions;
    requestOptions.headers['Authorization'] = AuthSharedPrefs.getAccessToken();

    try {
      final response = await _dio.request(
        requestOptions.path,
        options: Options(
          method: requestOptions.method,
          headers: requestOptions.headers,
        ),
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
      );
      handler.resolve(response);
    } catch (e) {
      handler.reject(
        DioException(
          requestOptions: requestOptions,
          error: e,
        ),
      );
    }
  }
}
