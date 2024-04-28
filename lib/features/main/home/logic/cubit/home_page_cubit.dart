import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/core/models/state_request_body.dart';
import 'package:pharmalink/features/main/home/data/repo/home_page_repo.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomePageRepo _homePageRepo;
  HomePageCubit(this._homePageRepo) : super(const HomePageState.initial());

  void getHomePageData() async {
    // Loading until get data
    emit(const HomePageState.homePageLoading());

    // Get data
    final response = await _homePageRepo.getHomePageData(
      StateRequestBody(state: State.ACTIVE),
    );
    response.when(
      success: (data) {
        emit(HomePageState.homePageSuccess(data));
      },
      failure: (error) {
        emit(
          HomePageState.homePageError(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }

  void getReminderList() async {
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
