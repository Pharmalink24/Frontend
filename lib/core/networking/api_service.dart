import 'package:dio/dio.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_request_body.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_response.dart';
import 'package:retrofit/http.dart' as http;
import 'api_constants.dart';
import '../../features/access/signin/data/models/refresh_taken_request_body.dart';
import '../../features/access/signup/data/models/signup_request_body.dart';
import '../../features/access/signup/data/models/signup_response.dart';
import '../../features/access/verification/data/models/verification_request_params.dart';
import '../../features/access/verification/data/models/verification_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../features/access/signin/data/models/signin_request_body.dart';
import '../../features/access/signin/data/models/signin_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Sign in
  @POST(ApiConstants.signIn)
  Future<SigninResponse> signin(
    @Body() SigninRequestBody signinRequestBody,
  );

  // Refresh Taken
  // TODO: Edit this API
  @POST(ApiConstants.refreshToken)
  Future<SigninResponse> refreshToken(
    @Body() RefreshTakenRequestBody refreshTakenRequestBody,
  );

  // Signup
  @POST(ApiConstants.signUp)
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  // Resend Verification
  @POST(ApiConstants.sendVerification)
  Future<VerificationResponse> resendVerification(
    @Queries() VerificationRequestParams verificationRequestParams,
  );

  // Search Drug from drug eye
  @GET(ApiConstants.searchDrugFromDrugEye)
  @http.Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<List<Drug>> searchDrugFromDrugEye(
    @Queries() DrugEyeSearchRequestParams drugEyeSearchRequestParams,
    @Header("Authorization") String? auth,
  );

  // TODO: EDIT THIS FROM 'POST' TO 'GET' WHEN BACKEND EDIT IT.
  // Drug Interaction Checker
  @POST(ApiConstants.drugInteraction)
  @http.Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  Future<DrugInteractionResponse> drugInteractionCheck(
    @Body() DrugInteractionRequestBody drugInteractionRequestBody,
    @Header("Authorization") String? auth,
  );
}
