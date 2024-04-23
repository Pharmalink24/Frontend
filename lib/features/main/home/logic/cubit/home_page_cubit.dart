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
    emit(const HomePageState.loading());

    // Get data
    final response = await _homePageRepo.getHomePageData(
      StateRequestBody(state: State.NEW),
    );
    response.when(
      success: (data) {
        emit(HomePageState.success(data));
      },
      failure: (error) {
        emit(
          HomePageState.error(
            error: error.apiErrorModel.message ?? ERR.UNEXPECTED,
          ),
        );
      },
    );
  }
}
