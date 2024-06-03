import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/home/ui/widgets/home_header_row.dart';
import '../../../../../core/models/user.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/error_card.dart';
import '../../../profile/logic/profile_cubit/profile_cubit.dart';
import '../../../profile/logic/profile_cubit/profile_state.dart';

class HomeHeaderBuilder extends StatelessWidget {
  const HomeHeaderBuilder({super.key});

  // Success widget
  Widget buildSuccessWidget(User user) {
    return HomeHeaderRow(
      fname: user.fname ?? "",
      lname: user.lname ?? "",
      image: user.image,
      gender: user.gender ?? "",
    );
  }

  // Loading widget
  Widget buildLoadingWidget(BuildContext context) {
    return HomeHeaderRow.buildShimmer(context);
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
          return buildLoadingWidget(context);
        } else if (state is ProfileInformationError) {
          var error = (state).error;
          return buildErrorWidget(context, error);
        } else {
          return buildLoadingWidget(context);
        }
      },
    );
  }
}
