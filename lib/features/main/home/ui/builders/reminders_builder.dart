import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/app_shimmer.dart';
import '../../../../../core/widgets/error_card.dart';
import '../../../reminders/logic/reminders_state.dart';
import '../../../reminders/data/models/reminder.dart';
import '../../../reminders/logic/reminders_cubit.dart';
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
        BlocProvider.of<RemindersCubit>(context).getRemindersList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemindersCubit, RemindersState>(
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
          return buildLoadingWidget();
        }
      },
    );
  }
}
