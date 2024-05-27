import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'auth_service.dart';
import 'refresh_token_interceptor.dart';

class AppDioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  AppDioFactory._();

  static Dio? dio;

  static Dio getDio(AuthService authService) {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioInterceptor(authService);
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor(AuthService authService) {
    dio?.interceptors.add(RefreshTokenInterceptor(
      authService,
    ));

    dio?.interceptors.add(
      PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
      ),
    );
  }
}
