import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/error_card.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_cubit.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_state.dart';

import '../widgets/doctors_container.dart';

class DoctorsBuilder extends StatelessWidget {
  const DoctorsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          current is HomePageLoading ||
          current is HomePageSuccess ||
          current is HomePageError,
      builder: (context, state) {
        if (state is HomePageSuccess) {
          var homePageData = state.data;
          return Expanded(
            flex: 5,
            child: DoctorsContainer(doctors: homePageData.doctors),
          );
        } else if (state is HomePageLoading) {
          return const LoadingIndicator();
        } else if (state is HomePageError) {
          var error = (state).error;
          return ErrorCard(
            message: error,
            onRetry: () {
              BlocProvider.of<HomePageCubit>(context).getHomePageData();
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
