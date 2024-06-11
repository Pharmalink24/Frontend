import 'package:logger/logger.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/networking/api/api_error_handler.dart';
import '../../../../../core/networking/api/api_result.dart';
import '../../../../../core/networking/api/api_service.dart';
import '../models/reminder.dart';

enum ReminderType {
  all,
  previous,
  today,
  coming,
  activation,
}

class RemindersRepo {
  final ApiService _apiService;

  RemindersRepo(this._apiService);

  Future<ApiResult<List<Reminder>>> getRemindersList() async {
    try {
      final reminders = await _apiService.getReminderList();
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
      List<Reminder> reminders, ReminderType filter) {
    List<Reminder> filteredReminders = [];

    if (filter == ReminderType.all) {
      filteredReminders = reminders;
    } else if (filter == ReminderType.previous) {
      filteredReminders = reminders
          .where((reminder) => reminder.isNextDoseBeforeToday())
          .toList();
    } else if (filter == ReminderType.today) {
      filteredReminders =
          reminders.where((reminder) => reminder.isNextDoseToday()).toList();
    } else if (filter == ReminderType.coming) {
      filteredReminders = reminders
          .where((reminder) => reminder.isNextDoseAfterToday())
          .toList();
    } else if (filter == ReminderType.activation) {
      filteredReminders = reminders
          .where((reminder) => reminder.isActivationReminder())
          .toList();
    }

    return filteredReminders;
  }
}
