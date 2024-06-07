import 'dart:io';

import 'package:dio/dio.dart' hide Headers;
import '../../../features/access/auth/data/models/forget_password_request_body.dart';
import '../../../features/access/auth/data/models/refresh_token_request_body.dart';
import '../../../features/access/auth/data/models/refresh_token_response.dart';
import '../../../features/access/sign/data/models/signin/signin_request_body.dart';
import '../../../features/access/sign/data/models/signin/signin_response.dart';
import '../../../features/main/chat/data/models/messages_history_response.dart';
import '../../../features/main/doctors/data/models/doctor.dart';
import '../../../features/main/drug_interaction/data/models/interaction.dart';
import '../../../features/main/prescription/data/models/prescription_doctor.dart';
import '../../../features/main/prescription/data/models/prescription_info.dart';
import '../../../features/main/reminders/data/models/reminder.dart';
import '../../../features/main/settings/change_password/data/models/change_password_request_body.dart';
import '../../../features/main/settings/change_password/data/models/change_password_response.dart';
import 'package:retrofit/http.dart';
import '../../../features/main/drug_interaction/data/models/drug_eye_search_request_params.dart';
import '../../models/device_token_request_body.dart';
import '../../models/drug_search.dart';
import '../../../features/main/drug_interaction/data/models/drug_interaction_request_body.dart';
import '../../../features/main/drug_interaction/data/models/drug_interaction_response.dart';
import '../../models/message_response.dart';
import '../../models/state_request_body.dart';
import '../../models/user.dart';
import '../../../features/main/doctors/data/models/doctor_info.dart';
import 'api_constants.dart';
import '../../../features/access/sign/data/models/signup/signup_request_body.dart';
import '../../../features/access/sign/data/models/signup/signup_response.dart';
import '../../../features/access/verification/data/models/verification_request_params.dart';
import '../../../features/access/verification/data/models/verification_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.httpsDomain)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //-------------------- AUTHENTICATION --------------------//

  // Refresh Token
  @POST(ApiConstants.refreshToken)
  Future<RefreshTokenResponse> refreshToken(
    @Body() RefreshTokenRequestBody refreshTokenRequestBody,
  );

  // Firebase Token
  @POST(ApiConstants.setDeviceToken)
  Future<MessageResponse> setDeviceToken(
    @Body() DeviceTokenRequestBody deviceToken,
  );

  // Logout
  @POST(ApiConstants.logout)
  Future<void> logout();

  // Sign in
  @POST(ApiConstants.signIn)
  @Headers(<String, dynamic>{
    'requires-token': 'false',
  })
  Future<SigninResponse> signin(
    @Body() SigninRequestBody signinRequestBody,
  );

  // Signup
  @POST(ApiConstants.signUp)
  @Headers(<String, dynamic>{
    'requires-token': 'false',
  })
  Future<SignupResponse> signup(
    @Body() SignupRequestBody signupRequestBody,
  );

  // Resend Verification
  @POST(ApiConstants.sendVerification)
  @Headers(<String, dynamic>{
    'requires-token': 'false',
  })
  Future<VerificationResponse> resendVerification(
    @Queries() VerificationRequestParams verificationRequestParams,
  );

  // Forget Password
  @POST(ApiConstants.forgetPassword)
  @Headers(<String, dynamic>{
    'requires-token': 'false',
  })
  Future<MessageResponse> forgetPassword(
    @Body() ForgetPasswordRequestBody forgetPasswordRequestBody,
  );

  //-------------------- Reminder --------------------//

  // Get Reminder List
  @GET(ApiConstants.reminderList)
  Future<List<Reminder>> getReminderList();

  // Make Reminder Done
  @PUT(ApiConstants.makeReminderDone)
  Future<void> makeReminderDone(
    @Path('reminder_id') int reminderId,
  );

  //-------------------- Prescription --------------------//

  // Prescription
  @GET(ApiConstants.prescriptionsList1)
  Future<List<PrescriptionDoctor>> getPrescriptionsDoctors(
    @Queries() StateRequestBody stateRequestBody,
  );

  // Prescription
  @GET(ApiConstants.prescriptionsList2)
  Future<List<PrescriptionInfo>> getPrescriptionsDrugs(
    @Queries() StateRequestBody stateRequestBody,
  );

  // Prescription Detail
  @GET(ApiConstants.specificPrescriptionInfo)
  Future<PrescriptionInfo> getSpecificPrescriptionInfo(
    @Path('prescription_id') int prescriptionId,
  );

  // Activate Drug
  @POST(ApiConstants.activateDrug)
  Future<MessageResponse> activateDrug(
    @Path('prescription_id') int prescriptionId,
    @Query('drug_name') String drugName,
  );

  // Deactivate Drug
  @POST(ApiConstants.deactivateDrug)
  Future<MessageResponse> deactivateDrug(
    @Path('prescription_id') int prescriptionId,
    @Query('drug_name') String drugName,
  );

  // Activate Prescription
  @POST(ApiConstants.activatePrescription)
  Future<MessageResponse> activatePrescription(
    @Path('prescription_id') int prescriptionId,
  );

  // Deactivate Prescription
  @POST(ApiConstants.deactivatePrescription)
  Future<MessageResponse> deactivatePrescription(
    @Path('prescription_id') int prescriptionId,
  );

  //-------------------- DRUG INTERACTION --------------------//

  // Search Drug from drug eye
  @GET(ApiConstants.searchDrugFromDrugEye)
  Future<List<DrugSearch>> searchDrugFromDrugEye(
    @Queries() DrugEyeSearchRequestParams drugEyeSearchRequestParams,
  );

  // TODO: EDIT THIS FROM 'POST' TO 'GET' WHEN BACKEND EDIT IT.
  // Drug Interaction Checker
  @POST(ApiConstants.twoDrugInteraction)
  Future<TwoDrugsInteractionResponse> checkInteractionBetweenTwoDrugs(
    @Body() DrugInteractionRequestBody drugInteractionRequestBody,
  );

  @POST(ApiConstants.drugAndMedicationsInteraction)
  Future<List<Interaction>> checkInteractionBetweenDrugAndMedications(
    @Body() DrugInteractionRequestBody drugInteractionRequestBody,
  );

  //-------------------- User Profile --------------------//

  // User Profile Data
  @GET(ApiConstants.userInformation)
  Future<User> getUserInformation();

  // Update User Profile
  @PATCH(ApiConstants.updateUserInformation)
  Future<User> updateUserInformation(
    @Body() User user,
  );

  // Update User Image
  @PATCH(ApiConstants.updateUserInformation)
  @Headers(<String, dynamic>{
    'Content-Type': 'application/json',
  })
  @MultiPart()
  Future<User> updateUserImage(
    @Part() File image,
  );

  // Change Password
  @PATCH(ApiConstants.changePassword)
  Future<ChangePasswordResponse> changePassword(
    @Body() ChangePasswordRequestBody changePasswordRequestBody,
  );

  //-------------------- Doctor --------------------//

  // Get Doctors List
  @GET(ApiConstants.doctorsList)
  Future<List<Doctor>> getDoctorList();

  @GET(ApiConstants.doctorProfile)
  Future<DoctorInfo> getDoctorProfile(
    @Path('doctor_id') int doctorId,
  );

  //-------------------- Chat --------------------//

  @GET(ApiConstants.getMessagesHistory)
  Future<MessagesHistoryResponse> getMessagesHistory(
    @Query('sender_user_id') int senderUserId,
    @Query('receiver_doctor_id') int receiverDoctorId,
    @Query('page') int page,
    @Query('page_size') int pageSize,
  );

  // @Put(ApiConstants.updateMessage)
  // @Delete(ApiConstants.deleteMessage)
  // @POST(ApiConstants.markMessageAsRead)
}
