import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/models/user.dart';
import 'package:pharmalink/core/networking/api_error_handler.dart';
import 'package:pharmalink/core/networking/api_result.dart';
import 'package:pharmalink/core/networking/api_service.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';

import '../models/reminder.dart';

class RemindersRepo {
  final ApiService _apiService;

  RemindersRepo(this._apiService);

  Future<ApiResult<List<Reminder>>> getRemindersList() async {
    try {
      final response =
          await _apiService.getReminderList(AuthSharedPrefs.getAccessToken());
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> makeReminderChecked(int reminderId) async {
    try {
      final response = await _apiService.makeReminderDone(
        reminderId,
        AuthSharedPrefs.getAccessToken(),
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
