import 'package:logger/logger.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/shared_preferences/auth_prefs.dart';

import '../models/reminder.dart';

class RemindersRepo {
  final ApiService _apiService;

  RemindersRepo(this._apiService);

  Future<ApiResult<List<Reminder>>> getRemindersList() async {
    try {
      final reminders =
          await _apiService.getReminderList(AuthSharedPrefs.getAccessToken());

      List<Reminder> showedReminders = [];
      for (var reminder in reminders) {
        reminder.isToday() ? showedReminders.add(reminder) : null;
      }
      return ApiResult.success(showedReminders);
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
