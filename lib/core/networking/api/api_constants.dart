// Apis
class ApiConstants {
  // Protocols
  static const httpProtocol = "http://";
  static const httpsProtocol = "https://";

  static const String domain = "pharmalink.tech/";
  static const String httpsDomain = "$httpsProtocol$domain";

  static const String tokenKey = "patientCustomToken";
  // User API
  static const signIn = "user/login/";
  static const signUp = "user/signup/";
  static const sendVerification = "user/resend-email-verification/";
  static const refreshToken = "user/refresh-token/";
  static const logout = "user/logout/";
  static const forgetPassword = "user/password/reset/";

  // Drug Interaction & Search API
  static const searchDrugFromDrugEye = "Prescription/drug_search/";
  static const twoDrugInteraction = "Drugs/check-drug-interaction-TradeName/";
  static const drugAndMedicationsInteraction =
      "Drugs/user/check-drug-interaction-All/";

  // Home API
  static const homePage = "Prescription/user/HomePage/";

  // Profile API
  static const userInformation = "user/user-info/";

  // Edit Profile API
  static const updateUserInformation = "user/update/";

  // Change Password API
  static const changePassword = "user/password/change/";
  // Doctors List API
  static const doctorsList = "Prescription/user/Doctors/list/";

  // Get Reminder List
  static const reminderList = "Reminder/list/";

  // Check Reminder
  static const makeReminderDone = "Reminder/check/{reminder_id}/";

  // Prescription
  static const prescriptionsList1 =
      "Prescription/user/state-prescriptions/Doctorinfo/";
  static const prescriptionsList2 = "Prescription/user/active-prescriptions/";
  static const activatePrescription =
      "Prescription/user/activate-prescription/{prescription_id}/";
  static const deactivatePrescription =
      "Prescription/user/deactivate-prescription/{prescription_id}/";

  // Prescription Detail
  static const specificPrescriptionInfo =
      "Prescription/get-prescription/{prescription_id}/";

  // Doctor Profile
  static const doctorProfile = "doctor/doctors/{doctor_id}/";

  // Activate & Deactivate Drug
  static const activateDrug = "Prescription/user/{prescription_id}/activate/";
  static const deactivateDrug =
      "Prescription/user/{prescription_id}/deactivate/";

  // Chat
  static const getMessagesHistory = "chat/user-retrieve-messages/";

  // Set Device Token
  static const setDeviceToken = "user/update_device_token/";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}
