// import 'package:pharmalink/core/models/user.dart';
import 'dart:io';

import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/shared/domain/entities/models/user.dart';
import 'package:pharmalink/shared/data/data_sources/remote/api/api_error_handler.dart';
import 'package:pharmalink/shared/data/data_sources/remote/api/api_result.dart';
import 'package:pharmalink/shared/data/data_sources/remote/api/api_service.dart';

class EditProfileRepo {
  final ApiService _apiService;

  EditProfileRepo(this._apiService);

  Future<ApiResult<User>> getUserInformation() async {
    try {
      final drugs = await _apiService.getUserInformation(
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
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
