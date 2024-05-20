import 'package:dio/dio.dart';
import '../../features/access/sign/data/models/signin/signin_request_body.dart';
import '../../features/access/sign/data/models/signin/signin_response.dart';
import '../../features/main/doctors/data/models/doctor.dart';
import '../../features/main/prescription/data/models/prescription_doctor.dart';
import '../../features/main/prescription/data/models/prescription_drugs.dart';
import '../../features/main/prescription/data/models/prescription_info.dart';
import '../../features/access/auth/data/models/refresh_token_response.dart';
import '../../features/main/reminders/models/reminder.dart';
import '../../features/main/settings/change_password/data/models/change_password_request_body.dart';
import '../../features/main/settings/change_password/data/models/change_password_response.dart';
import 'package:retrofit/http.dart';
import '../../features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import '../models/drug_search.dart';
import '../../features/main/drug_interaction/data/models/drug_interaction_request_body.dart';
import '../../features/main/drug_interaction/data/models/drug_interaction_response.dart';
import '../models/state_request_body.dart';
import '../models/user.dart';
import '../../features/main/doctors/data/models/doctor_info.dart';
import 'api_constants.dart';
import '../../features/access/auth/data/models/refresh_token_request_body.dart';
import '../../features/access/sign/data/models/signup/signup_request_body.dart';
import '../../features/access/sign/data/models/signup/signup_response.dart';
import '../../features/access/verification/data/models/verification_request_params.dart';
import '../../features/access/verification/data/models/verification_response.dart';
import 'package:retrofit/retrofit.dart';

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
  Future<List<PrescriptionDoctor>> getPrescriptionsDoctors(
    @Queries() StateRequestBody stateRequestBody,
    @Header('Authorization') String? auth,
  );

  // Prescription
  @GET(ApiConstants.prescriptionsList2)
  Future<List<PrescriptionDrugs>> getPrescriptionsDrugs(
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
