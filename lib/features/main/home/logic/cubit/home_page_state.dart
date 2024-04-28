import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState<T> with _$HomePageState<T> {
  const factory HomePageState.initial() = _Initial;

  // user information
  const factory HomePageState.userInfoLoading() = UserInfoLoading;
  const factory HomePageState.userInfoSuccess(T data) =
      UserInfoSuccess<T>;
  const factory HomePageState.userInfoError({required String error}) = UserInfoError;

  // Doctors
  const factory HomePageState.doctorsLoading() = DoctorsLoading;
  const factory HomePageState.doctorsSuccess(T data) =
      DoctorsSuccess<T>;
  const factory HomePageState.doctorsError({required String error}) = DoctorsError;

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
