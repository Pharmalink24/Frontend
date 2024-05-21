// import 'package:pharmalink/core/models/user.dart';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/models/profile_image.dart';
import 'package:pharmalink/core/models/user.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

class EditProfileRepo {
  final ApiService _apiService;

  EditProfileRepo(this._apiService);

  Future<ApiResult<User>> getUserInformation() async {
    try {
      final drugs = await _apiService.getUserInformation(
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(drugs);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<User>> editProfile(User user) async {
    try {
      final response = await _apiService.updateUserInformation(
        user,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<User>> editProfileImage(File image) async {
    try {
      final response = await _apiService.updateUserImage(
        image,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
