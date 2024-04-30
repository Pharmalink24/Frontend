// Apis
class ApiConstants {
  static const String baseUrl = "https://pharmalink.tech/";
  static const String tokenKey = "patientCustomToken";
  // User API
  static const signIn = "user/login/";
  static const signUp = "user/signup/";
  static const sendVerification = "user/resend-email-verification/";
  static const refreshToken = "user/refresh-token/";

  // Drug Interaction & Search API
  static const searchDrugFromDrugEye = "Prescription/drug_search/";
  static const drugInteraction = "Drugs/check-drug-interaction-TradeName/";

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

  // Add Reminder
  static const makeReminderDone = "Reminder/check/{reminder_id}/";

  // Prescription 
  static const prescriptionsList = "Prescription/user/state-prescriptions/Doctorinfo/";

  // Prescription Detail
  static const prescriptionInfo = "Prescription/get-prescription/{prescription_id}/";

  // Doctor Profile
  static const doctorProfile = "doctor/doctors/{doctor_id}/";
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
