import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/api/api_constants.dart';
import 'package:pharmalink/core/networking/api/api_error_handler.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../../../../features/access/auth/data/models/refresh_token_response.dart';
import '../../../../pharmalink_app.dart';
import '../api_result.dart';

class AuthInterceptor extends Interceptor {
  AuthInterceptor();

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
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (options.headers['requires-token'] == 'false') {
      // if the request doesn't need token, then just continue to the next
      // interceptor
      options.headers.remove('requires-token'); //remove the auxiliary header
      return handler.next(options);
    }

    final accessToken = AuthSharedPrefs.getAccessToken();

    options.headers
        .addAll({'authorization': '${ApiConstants.tokenKey} $accessToken'});
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.type == DioExceptionType.badResponse &&
        err.response?.statusCode == 401) {
      // Attempt to refresh the token
      final response = await refreshToken();

      response.when(
        success: (newToken) async {
          // Save the new token
          await AuthSharedPrefs.setAccessToken(newToken.accessToken);
          // Retry the request with the new token
          handler.resolve(await _retryRequest(err.requestOptions));
        },
        failure: (error) async {
          // Refresh token failed
          appRouter.push(const SignRoute());

          // Clear the auth data
          await AuthSharedPrefs.clearAuthData();

          Logger().i(appRouter.currentPath);

          // So reject the request
          handler.reject(err);
        },
      );
    } else {
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    // Update the token in headers
    requestOptions.headers['Authorization'] = AuthSharedPrefs.getAccessToken();

    final response = await _dio.request<dynamic>(
      requestOptions.path,
      options: Options(
        method: requestOptions.method,
        headers: requestOptions.headers,
      ),
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
    );

    return response;
  }
}
