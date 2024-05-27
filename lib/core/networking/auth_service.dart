import 'package:dio/dio.dart' hide Headers;
import '../../features/access/auth/data/models/refresh_token_response.dart';
import 'package:retrofit/http.dart';
import 'api_constants.dart';
import '../../features/access/auth/data/models/refresh_token_request_body.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_service.g.dart';

@RestApi(baseUrl: ApiConstants.httpsDomain)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  //-------------------- AUTHENTICATION --------------------//

  // Logout
  @POST(ApiConstants.logout)
  Future<void> logout(
    @Header('Authorization') String? auth,
  );

  // Refresh Token
  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequestBody refreshTokenRequestBody,
  );
}
