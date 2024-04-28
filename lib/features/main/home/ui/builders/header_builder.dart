import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/models/user.dart';
import 'package:pharmalink/core/widgets/app_shimmer.dart';
import 'package:pharmalink/core/widgets/error_card.dart';
import 'package:pharmalink/features/main/home/data/models/home_page_response.dart';
import '../../logic/cubit/home_page_cubit.dart';
import '../../logic/cubit/home_page_state.dart';
import '../widgets/welcome_name_text.dart';

const kFlex = 1;

class HeaderBuilder extends StatelessWidget {
  const HeaderBuilder({super.key});

  // Success widget
  Widget buildSuccessWidget(User user) {
    return Expanded(
      flex: kFlex,
      child: WelcomeNameText(name: user.fname!),
    );
  }

  // Loading widget
  Widget buildLoadingWidget() {
    return const Expanded(
      flex: kFlex,
      child: AppShimmer(
        child: WelcomeNameText(),
      ),
    );
  }

  // Error widget
  Widget buildErrorWidget(BuildContext context, String error) {
    return ErrorCard(
      message: error,
      onRetry: () {
        BlocProvider.of<HomePageCubit>(context).getUserInformation();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          current is UserInfoLoading ||
          current is UserInfoSuccess ||
          current is UserInfoError,
      builder: (context, state) {
        if (state is UserInfoSuccess) {
          var user = state.data;
          return buildSuccessWidget(user);
        } else if (state is UserInfoLoading) {
          return buildLoadingWidget();
        } else if (state is UserInfoError) {
          var error = (state).error;
          return buildErrorWidget(context, error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
