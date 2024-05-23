import 'package:bloc/bloc.dart';
import '../../../../core/helpers/errors.dart';
import '../data/repo/reminders_repo.dart';
import 'reminders_state.dart';

class RemindersCubit extends Cubit<RemindersState> {
  final RemindersRepo _remindersRepo;
  RemindersCubit(this._remindersRepo) : super(const RemindersState.initial());

  // Get reminders list
  void getRemindersList() async {
    // Loading until get data
    emit(const RemindersState.remindersLoading());

    // Get data
    final response = await _remindersRepo.getRemindersList();
    response.when(
      success: (data) {
        emit(RemindersState.remindersSuccess(data));
      },
      failure: (error) {
        emit(
          RemindersState.remindersError(
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  void makeReminderChecked(int reminderId) async {
    // Loading until get data
    emit(const RemindersState.makeReminderCheckedLoading());

    // Get data
    final response = await _remindersRepo.makeReminderChecked(reminderId);
    response.when(
      success: (_) {
        emit(const RemindersState.makeReminderCheckedSuccess());
      },
      failure: (error) {
        emit(
          RemindersState.makeReminderCheckedError(
            error: error.apiErrorModel.error ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }
}
