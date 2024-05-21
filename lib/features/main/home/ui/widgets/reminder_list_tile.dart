import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../../reminders/logic/reminders_cubit.dart';
import '../../../reminders/data/models/reminder.dart';

class ReminderListTile extends StatelessWidget {
  final Reminder reminder;

  const ReminderListTile(
    this.reminder, {
    super.key,
  });

  Widget _buildFirstRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          reminder.drugFirstName,
          style: AppTextStyle.titleMedium(context).copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        Text(
          '${reminder.date}',
          style: AppTextStyle.labelSmall(context),
        ),
      ],
    );
  }

  Widget _buildSecondRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${reminder.drugRemainingName}'.crop(25),
          style: AppTextStyle.labelSmall(context),
        ),
        Text(
          '${reminder.hours}:${reminder.minute}',
          style: AppTextStyle.labelSmall(context),
        ),
      ],
    );
  }

  Widget _buildThirdRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.delete_outline_rounded),
          iconSize: 20.0,
          onPressed: () => _checkReminder(context),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(
        left: 4,
        right: 8,
        top: 4,
        bottom: 0,
      ),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: AppShadows.box(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: false,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            onChanged: (value) => _checkReminder(context),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            side: BorderSide(
              width: 1.0,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFirstRow(context),
                _buildSecondRow(context),
                _buildThirdRow(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _checkReminder(BuildContext context) {
    // Make reminder checked
    BlocProvider.of<RemindersCubit>(context).makeReminderChecked(reminder.id);

    // Get reminders list
    BlocProvider.of<RemindersCubit>(context).getRemindersList();
  }
}
