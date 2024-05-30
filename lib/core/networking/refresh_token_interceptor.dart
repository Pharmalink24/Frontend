import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/networking/auth_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import 'package:pharmalink/features/access/auth/data/models/refresh_token_response.dart';

import '../../features/access/auth/data/models/refresh_token_request_body.dart';
import '../../features/access/sign/data/models/signin/signin_response.dart';
import '../di/dependency_injection.dart';
import 'api_constants.dart';
import 'api_error_handler.dart';
import 'api_result.dart';

class RefreshTokenInterceptor extends Interceptor {
  List<Map<dynamic, dynamic>> failedRequests = [];
  bool isRefreshing = false;

  final AuthService _authService;
  RefreshTokenInterceptor(this._authService);

  // ------------------ Repository ------------------ //

  Future<void> setAccessTokenRepo(String accessToken) async {
    try {
      await AuthSharedPrefs.storeAuthData(
        SigninResponse(
          id: AuthSharedPrefs.getUserId() ?? 0,
          username: AuthSharedPrefs.getUsername() ?? '',
          email: AuthSharedPrefs.getEmail() ?? '',
          accessToken: accessToken,
          refreshToken: AuthSharedPrefs.getRefreshToken() ?? '',
        ),
      );
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }

  Future<ApiResult<RefreshTokenResponse>> refreshTokenRepo() async {
    try {
      final response = await _authService.refreshToken(
        RefreshTokenRequestBody(
          refreshToken: AuthSharedPrefs.getRefreshToken() ?? '',
        ),
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<void> logoutRepo() async {
    try {
      await _authService.logout(AuthSharedPrefs.getAccessToken());
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }

  Future<void> clearAuthDataRepo() async {
    try {
      await AuthSharedPrefs.clearAuthData();
    } catch (error) {
      getIt<Logger>().e(error);
    }
  }

  // ------------------ Interceptor ------------------ //

  // Refresh Token Request
  FutureOr refreshToken(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // handle refresh token
    final response = await refreshTokenRepo();

    response.when(
      success: (refreshTokenResponse) async {
        // save new refresh token and access token
        setAccessTokenRepo(refreshTokenResponse.accessToken);

        failedRequests.add({'err': err, 'handler': handler});
        await retryRequests();

        return refreshTokenResponse;
      },
      failure: (error) async {
        if (error.apiErrorModel.code == 401 ||
            error.apiErrorModel.code == 403) {
          // handle logout
          // handle refresh token
          await logoutRepo();
          await clearAuthDataRepo();
        }

        return error;
      },
    );
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // If refresh token is not available, perform logout
      if ((AuthSharedPrefs.getRefreshToken() ?? "").isEmpty) {
        await logoutRepo();
        return handler.reject(err);
      }

      if (!isRefreshing) {
        // Initiating token refresh
        isRefreshing = true;
        var refreshTokenResponse = await refreshToken(err, handler);
        if (refreshTokenResponse is RefreshTokenResponse) {
          setAccessTokenRepo(refreshTokenResponse.accessToken);

          err.requestOptions.headers['Authorization'] =
              '${AuthSharedPrefs.getAccessToken()}';
        } else {
          // If the refresh process fails, reject with the previous error
          return handler.next(err);
        }
      } else {
        // Adding errored request to the queue
        failedRequests.add({'err': err, 'handler': handler});
      }
    } else {
      return handler.next(err);
    }
  }

  // Retry Requests
  Future retryRequests() async {
    // Create a Dio instance for retrying requests
    Dio retryDio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.httpsDomain,
      ),
    );
    // Iterate through failed requests and retry them
    for (var i = 0; i < failedRequests.length; i++) {
      // Get the RequestOptions from the failed request
      RequestOptions requestOptions =
          failedRequests[i]['err'].requestOptions as RequestOptions;

      // Update headers with the new access token
      requestOptions.headers = {
        HttpHeaders.authorizationHeader: '${AuthSharedPrefs.getAccessToken()}',
      };

      // Retry the request using the new token
      await retryDio.fetch(requestOptions).then(
        failedRequests[i]['handler'].resolve,
        onError: (error) async {
          // Reject the request if an error occurs during retry
          failedRequests[i]['handler'].reject(error as DioException);
        },
      );
    }

    // Reset the refreshing state and clear the failed requests queue
    isRefreshing = false;
    failedRequests = [];
  }
}
