import 'package:dio/dio.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/models/prescription1.dart';
import 'package:pharmalink/core/models/prescription2.dart';
import 'package:pharmalink/core/models/prescription_info.dart';
import 'package:pharmalink/features/access/auth/data/models/refresh_token_response.dart';
import 'package:pharmalink/features/main/reminders/models/reminder.dart';
import 'package:pharmalink/features/main/settings/change_password/data/models/change_password_request_body.dart';
import 'package:pharmalink/features/main/settings/change_password/data/models/change_password_response.dart';
import 'package:retrofit/http.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import 'package:pharmalink/core/models/drug_search.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_request_body.dart';
import 'package:pharmalink/features/main/drug_interaction/data/models/drug_interaction_response.dart';
import 'package:pharmalink/core/models/state_request_body.dart';
import 'package:pharmalink/core/models/user.dart';
import '../models/doctor_info.dart';
import 'api_constants.dart';
import '../../features/access/auth/data/models/refresh_token_request_body.dart';
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

  //-------------------- AUTHENTICATION --------------------//

  // Sign in
  @POST(ApiConstants.signIn)
  Future<SigninResponse> signin(
    @Body() SigninRequestBody signinRequestBody,
  );

  // Refresh Token
  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequestBody refreshTokenRequestBody,
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

  //-------------------- Reminder --------------------//

  // Get Reminder List
  @GET(ApiConstants.reminderList)
  Future<List<Reminder>> getReminderList(
    @Header('Authorization') String? auth,
  );

  // Make Reminder Done
  @PUT(ApiConstants.makeReminderDone)
  Future<void> makeReminderDone(
    @Path('reminder_id') int reminderId,
    @Header('Authorization') String? auth,
  );

  //-------------------- Prescription --------------------//

  // Prescription
  @GET(ApiConstants.prescriptionsList1)
  Future<List<Prescription1>> getPrescriptions1(
    @Queries() StateRequestBody stateRequestBody,
    @Header('Authorization') String? auth,
  );


  // Prescription
  @GET(ApiConstants.prescriptionsList2)
  Future<List<Prescription2>> getPrescriptions2(
    @Queries() StateRequestBody stateRequestBody,
    @Header('Authorization') String? auth,
  );

  // Prescription Detail
  @GET(ApiConstants.prescriptionInfo)
  Future<PrescriptionInfo> getPrescriptionInfo(
    @Path('prescription_id') int prescriptionId,
    @Header('Authorization') String? auth,
  );

  //-------------------- DRUG INTERACTION --------------------//

  // Search Drug from drug eye
  @GET(ApiConstants.searchDrugFromDrugEye)
  Future<List<DrugSearch>> searchDrugFromDrugEye(
    @Queries() DrugEyeSearchRequestParams drugEyeSearchRequestParams,
    @Header("Authorization") String? auth,
  );

  // TODO: EDIT THIS FROM 'POST' TO 'GET' WHEN BACKEND EDIT IT.
  // Drug Interaction Checker
  @POST(ApiConstants.drugInteraction)
  Future<DrugInteractionResponse> drugInteractionCheck(
    @Body() DrugInteractionRequestBody drugInteractionRequestBody,
    @Header("Authorization") String? auth,
  );

  //-------------------- User Profile --------------------//

  // User Profile Data
  @GET(ApiConstants.userInformation)
  Future<User> getUserInformation(
    @Header('Authorization') String? auth,
  );

  // Update User Profile
  @PATCH(ApiConstants.updateUserInformation)
  Future<User> updateUserInformation(
    @Body() User user,
    @Header('Authorization') String? auth,
  );

  // Change Password
  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequestBody changePasswordRequestBody,
    @Header('Authorization') String? auth,
  );

  //-------------------- Doctor --------------------//

  // Get Doctors List
  @GET(ApiConstants.doctorsList)
  Future<List<Doctor>> getDoctorList(
    @Header('Authorization') String? auth,
  );

  @GET(ApiConstants.doctorProfile)
  Future<DoctorInfo> getDoctorProfile(
    @Path('doctor_id') int doctorId,
    @Header('Authorization') String? auth,
  );
}
