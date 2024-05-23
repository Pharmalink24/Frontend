import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import 'package:pharmalink/features/main/chat/data/models/message.dart';
import '../../features/access/auth/data/models/forget_password_request_body.dart';
import '../../features/access/sign/data/models/signin/signin_request_body.dart';
import '../../features/access/sign/data/models/signin/signin_response.dart';
import '../../features/main/chat/data/models/chat.dart';
import '../../features/main/doctors/data/models/doctor.dart';
import '../../features/main/prescription/data/models/prescription_doctor.dart';
import '../../features/main/prescription/data/models/prescription_drugs.dart';
import '../../features/main/prescription/data/models/prescription_info.dart';
import '../../features/access/auth/data/models/refresh_token_response.dart';
import '../../features/main/reminders/data/models/reminder.dart';
import '../../features/main/settings/change_password/data/models/change_password_request_body.dart';
import '../../features/main/settings/change_password/data/models/change_password_response.dart';
import 'package:retrofit/http.dart';
import '../../features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import '../models/drug_search.dart';
import '../../features/main/drug_interaction/data/models/drug_interaction_request_body.dart';
import '../../features/main/drug_interaction/data/models/drug_interaction_response.dart';
import '../models/message_response.dart';
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

@RestApi(baseUrl: ApiConstants.httpsDomain)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //-------------------- AUTHENTICATION --------------------//

  // Sign in
  @POST(ApiConstants.signIn)
  Future<SigninResponse> signin(
    @Body() SigninRequestBody signinRequestBody,
  );

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

  // Forget Password
  @POST(ApiConstants.forgetPassword)
  Future<MessageResponse> forgetPassword(
    @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
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

  // Activate Drug
  @POST(ApiConstants.activateDrug)
  Future<MessageResponse> activateDrug(
    @Path('prescription_id') int prescriptionId,
    @Query('drug_name') String drugName,
    @Header('Authorization') String? auth,
  );

  // Deactivate Drug
  @POST(ApiConstants.deactivateDrug)
  Future<MessageResponse> deactivateDrug(
    @Path('prescription_id') int prescriptionId,
    @Query('drug_name') String drugName,
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

  // Update User Image
  @PATCH(ApiConstants.updateUserInformation)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  @MultiPart()
  Future<User> updateUserImage(
    @Part() File image,
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

  //-------------------- Chat --------------------//
  @GET(ApiConstants.getAllChats)
  Future<List<Chat>> getAllChats(
    @Header('Authorization') String? auth,
  );

  @GET(ApiConstants.getUserChats)
  Future<List<Chat>> getUserChats(
    @Header('Authorization') String? auth,
  );

  @POST(ApiConstants.addChats)
  Future<Chat> addChats(
    @Path('id') String id,
    @Header('Authorization') String? auth,
  );

  @GET(ApiConstants.getMessagesHistory)
  Future<List<Message>> getMessagesHistory(
    @Path('id') String id,
    @Header('Authorization') String? auth,
  );
}
