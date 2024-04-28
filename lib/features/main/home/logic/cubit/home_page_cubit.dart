import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/features/main/home/data/repo/home_page_repo.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomePageRepo _homePageRepo;
  HomePageCubit(this._homePageRepo) : super(const HomePageState.initial());

  // Get user data
  void getUserInformation() async {
    // Loading until get data
    emit(const HomePageState.userInfoLoading());

    // Get data
    final response = await _homePageRepo.getUserInformation();
    
    response.when(
      success: (data) {
        emit(HomePageState.userInfoSuccess(data));
      },
      failure: (error) {
        emit(
          HomePageState.userInfoError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Get doctors list
  void getDoctorsList() async {
    // Loading until get data
    emit(const HomePageState.doctorsLoading());

    // Get data
    final response = await _homePageRepo.getDoctors();

    response.when(
      success: (data) {
        emit(HomePageState.doctorsSuccess(data));
      },
      failure: (error) {
        emit(
          HomePageState.doctorsError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  // Get reminders list
  void getRemindersList() async {
    // Loading until get data
    emit(const HomePageState.remindersLoading());

    // Get data
    final response = await _homePageRepo.getRemindersList();
    response.when(
      success: (data) {
        emit(HomePageState.remindersSuccess(data));
      },
      failure: (error) {
        emit(
          HomePageState.remindersError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  void makeReminderChecked(int reminderId) async {
    // Loading until get data
    emit(const HomePageState.makeReminderCheckedLoading());

    // Get data
    final response = await _homePageRepo.makeReminderChecked(reminderId);
    response.when(
      success: (_) {
        emit(const HomePageState.makeReminderCheckedSuccess());
      },
      failure: (error) {
        emit(
          HomePageState.makeReminderCheckedError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }
}
