// Apis
class ApiConstants {
  static const String baseUrl = "http://54.234.91.4:8000/";
  // User API
  static const signIn = "user/login/";
  static const signUp = "user/signup/";
  static const sendVerification = "user/resend-email-verification/";
  static const refreshToken = "user/refreshTaken/";
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
