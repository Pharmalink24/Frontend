import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminders_state.freezed.dart';

@freezed
class RemindersState<T> with _$RemindersState<T> {
  const factory RemindersState.initial() = _Initial;

  // user information
  const factory RemindersState.userInfoLoading() = UserInfoLoading;
  const factory RemindersState.userInfoSuccess(T data) = UserInfoSuccess<T>;
  const factory RemindersState.userInfoError({required String error}) =
      UserInfoError;

  // Doctors
  const factory RemindersState.doctorsLoading() = DoctorsLoading;
  const factory RemindersState.doctorsSuccess(T data) = DoctorsSuccess<T>;
  const factory RemindersState.doctorsError({required String error}) =
      DoctorsError;

  // Reminders
  const factory RemindersState.remindersLoading() = RemindersLoading;
  const factory RemindersState.remindersSuccess(T data) = RemindersSuccess<T>;
  const factory RemindersState.remindersError({required String error}) =
      RemindersError;

  // Make Reminder Checked
  const factory RemindersState.makeReminderCheckedLoading() =
      MakeReminderCheckedLoading;
  const factory RemindersState.makeReminderCheckedSuccess() =
      MakeReminderCheckedSuccess;
  const factory RemindersState.makeReminderCheckedError(
      {required String error}) = MakeReminderCheckedError;
}
