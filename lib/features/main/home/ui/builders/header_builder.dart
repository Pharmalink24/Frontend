import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/error_card.dart';
import '../../../profile/logic/cubit/profile_cubit.dart';
import '../../../profile/logic/cubit/profile_state.dart';
import '../widgets/welcome_name_text.dart';

const kFlex = 1;

class HeaderBuilder extends StatelessWidget {
  const HeaderBuilder({super.key});

  // Success widget
  Widget buildSuccessWidget(User user) {
    return Expanded(
      flex: kFlex,
      child: WelcomeNameText(fname: user.fname!, lname: user.lname!),
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
        BlocProvider.of<ProfileCubit>(context).getUserProfile();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is ProfileInformationLoading ||
          current is ProfileInformationSuccess ||
          current is ProfileInformationError,
      builder: (context, state) {
        if (state is ProfileInformationSuccess) {
          var user = state.data;
          return buildSuccessWidget(user);
        } else if (state is ProfileInformationLoading) {
          return buildLoadingWidget();
        } else if (state is ProfileInformationError) {
          var error = (state).error;
          return buildErrorWidget(context, error);
        } else {
          return buildLoadingWidget();
        }
      },
    );
  }
}
