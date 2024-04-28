import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState<T> with _$HomePageState<T> {
  const factory HomePageState.initial() = _Initial;

  // Home Page
  const factory HomePageState.homePageLoading() = HomePageLoading;
  const factory HomePageState.homePageSuccess(T data) =
      HomePageSuccess<T>;
  const factory HomePageState.homePageError({required String error}) = HomePageError;

  // Reminders
  const factory HomePageState.remindersLoading() = RemindersLoading;
  const factory HomePageState.remindersSuccess(T data) =
      RemindersSuccess<T>;
  const factory HomePageState.remindersError({required String error}) = RemindersError;

  // Make Reminder Checked
  const factory HomePageState.makeReminderCheckedLoading() = MakeReminderCheckedLoading;
  const factory HomePageState.makeReminderCheckedSuccess() = MakeReminderCheckedSuccess;
  const factory HomePageState.makeReminderCheckedError({required String error}) = MakeReminderCheckedError;

}
