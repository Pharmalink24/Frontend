import 'package:dio/dio.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/features/signup/data/models/signup_request_body.dart';
import 'package:pharmalink/features/signup/data/models/signup_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/signin/data/models/signin_request_body.dart';
import '../../features/signin/data/models/signin_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Sign in
  @POST(ApiConstants.signIn)
  Future<SigninResponse> signin(
    @Body() SigninRequestBody signinRequestBody,
  );

  @POST(ApiConstants.signUp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );
}
