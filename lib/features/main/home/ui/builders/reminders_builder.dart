import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/error_card.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';

import '../../logic/cubit/home_page_cubit.dart';
import '../../logic/cubit/home_page_state.dart';
import '../widgets/reminders_container.dart';

class RemindersBuilder extends StatelessWidget {
  const RemindersBuilder({super.key});

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
          return Expanded(
            flex: 6,
            child: RemindersContainer(reminders: reminders),
          );
        } else if (state is RemindersLoading) {
          return const LoadingIndicator();
        } else if (state is RemindersError) {
          var error = (state).error;
          return ErrorCard(
            message: error,
            onRetry: () {
              BlocProvider.of<HomePageCubit>(context).getReminderList();
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
