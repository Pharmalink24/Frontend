import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/widgets/app_shimmer.dart';
import 'package:pharmalink/core/widgets/error_card.dart';
import 'package:pharmalink/features/main/home/data/models/home_page_response.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_cubit.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_state.dart';
import '../widgets/doctors_container.dart';

const kFlex = 4;

class DoctorsBuilder extends StatelessWidget {
  const DoctorsBuilder({super.key});

  // Success widget
  Widget buildSuccessWidget(List<Doctor> doctors) {
    return Expanded(
      flex: kFlex,
      child: DoctorsContainer(doctors: doctors),
    );
  }

  // Loading widget
  Widget buildLoadingWidget() {
    return const Expanded(
      flex: kFlex,
      child: AppShimmer(
        child: DoctorsContainer(),
      ),
    );
  }

  // Error widget
  Widget buildErrorWidget(BuildContext context, String error) {
    return ErrorCard(
      message: error,
      onRetry: () {
        BlocProvider.of<HomePageCubit>(context).getDoctorsList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          current is DoctorsLoading ||
          current is DoctorsSuccess ||
          current is DoctorsError,
      builder: (context, state) {
        if (state is DoctorsSuccess) {
          var homePageData = state.data;
          return buildSuccessWidget(homePageData);
        } else if (state is DoctorsLoading) {
          return buildLoadingWidget();
        } else if (state is DoctorsError) {
          var error = (state).error;
          return buildErrorWidget(context, error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
