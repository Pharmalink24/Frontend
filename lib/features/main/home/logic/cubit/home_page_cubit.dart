import 'package:bloc/bloc.dart';
import 'package:pharmalink/core/helpers/errors.dart';
import 'package:pharmalink/features/main/home/data/models/home_page_request_body.dart';
import 'package:pharmalink/features/main/home/data/repo/home_page_repo.dart';

import 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  final HomePageRepo _homePageRepo;
  HomePageCubit(this._homePageRepo) : super(const HomePageState.initial());

  Future<void> getHomePageData() async {
    emit(const HomePageState.loading());
    await _homePageRepo
        .getHomePageData(
          HomePageRequestBody(state: State.NEW),
        )
        .then(
          (response) => response.when(
            success: (data) {
              emit(HomePageState.success(data));
            },
            failure: (error) {
              emit(
                HomePageState.error(
                    error: error.apiErrorModel.message ?? ERR.UNEXPECTED),
              );
            },
          ),
        );
  }
}
