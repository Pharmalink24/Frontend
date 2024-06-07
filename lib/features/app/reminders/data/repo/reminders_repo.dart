import 'package:logger/logger.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../shared/data/data_sources/remote/api/api_error_handler.dart';
import '../../../../../shared/data/data_sources/remote/api/api_result.dart';
import '../../../../../shared/data/data_sources/remote/api/api_service.dart';
import '../models/reminder.dart';

enum ReminderTime {
  all,
  previous,
  today,
  coming,
}

class RemindersRepo {
  final ApiService _apiService;

  RemindersRepo(this._apiService);

  Future<ApiResult<List<Reminder>>> getRemindersList() async {
    try {
      final reminders =
          await _apiService.getReminderList();
      return ApiResult.success(reminders);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> makeReminderChecked(int reminderId) async {
    try {
      final response = await _apiService.makeReminderDone(
        reminderId,
      );
      return ApiResult.success(response);
    } catch (error) {
      getIt<Logger>().e(error);
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }

  List<Reminder> filterReminders(
      List<Reminder> reminders, ReminderTime filter) {
    List<Reminder> filteredReminders = [];

    if (filter == ReminderTime.all) {
      filteredReminders = reminders;
    } else if (filter == ReminderTime.previous) {
      filteredReminders =
          reminders.where((reminder) => reminder.isBeforeToday()).toList();
    } else if (filter == ReminderTime.today) {
      filteredReminders =
          reminders.where((reminder) => reminder.isToday()).toList();
    } else if (filter == ReminderTime.coming) {
      filteredReminders =
          reminders.where((reminder) => reminder.isAfterToday()).toList();
    }

    return filteredReminders;
  }
}
