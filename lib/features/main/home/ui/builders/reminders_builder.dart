import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/app_shimmer.dart';
import 'package:pharmalink/core/widgets/error_card.dart';
import '../../data/models/reminder.dart';
import '../../logic/cubit/home_page_cubit.dart';
import '../../logic/cubit/home_page_state.dart';
import '../widgets/reminders_container.dart';

const kFlex = 6;

class RemindersBuilder extends StatelessWidget {
  const RemindersBuilder({super.key});

  // Success widget
  Widget buildSuccessWidget(List<Reminder> reminders) {
    return Expanded(
      flex: kFlex,
      child: RemindersContainer(reminders: reminders),
    );
  }

  // Loading widget
  Widget buildLoadingWidget() {
    return const Expanded(
      flex: kFlex,
      child: AppShimmer(
        child: RemindersContainer(),
      ),
    );
  }

  // Error widget
  Widget buildErrorWidget(BuildContext context, String error) {
    return ErrorCard(
      message: error,
      onRetry: () {
        BlocProvider.of<HomePageCubit>(context).getRemindersList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      buildWhen: (previous, current) =>
          current is RemindersLoading ||
          current is RemindersSuccess ||
          current is RemindersError,
      builder: (context, state) {
        if (state is RemindersSuccess) {
          var reminders = state.data;
          return buildSuccessWidget(reminders);
        } else if (state is RemindersLoading) {
          return buildLoadingWidget();
        } else if (state is RemindersError) {
          var error = (state).error;
          return buildErrorWidget(context, error);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
