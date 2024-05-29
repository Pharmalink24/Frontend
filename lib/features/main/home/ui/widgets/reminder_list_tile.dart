import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/gradient.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import 'package:pharmalink/core/theme/styles.dart';
import '../../../reminders/logic/reminders_cubit.dart';
import '../../../reminders/data/models/reminder.dart';

class ReminderListTile extends StatefulWidget {
  final Reminder reminder;

  const ReminderListTile(
    this.reminder, {
    super.key,
  });

  @override
  State<ReminderListTile> createState() => _ReminderListTileState();
}

class _ReminderListTileState extends State<ReminderListTile> {
  bool checked = false;

  Widget _buildDrugIcon(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(100),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          FontAwesomeIcons.capsules,
          color: context.colorScheme.scrim,
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Row(
      children: [
        _buildDrugIcon(context),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.reminder.drugFirstName,
                    style: AppTextStyle.titleSmall(context).copyWith(
                      color: context.colorScheme.scrim,
                    ),
                  ),
                  _buildCheckBox(context),
                ],
              ),
              Text(
                '${widget.reminder.drugRemainingName}',
                style: AppTextStyle.bodySmall(context).copyWith(
                  color: context.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTime(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: context.colorScheme.primary.withAlpha(100),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FontAwesomeIcons.solidCalendarDays,
                  size: 24,
                  color: context.colorScheme.scrim,
                ),
                Text(
                  '${widget.reminder.date}',
                  style: AppTextStyle.labelMedium(context).copyWith(
                    color: context.colorScheme.scrim,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 24.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  FontAwesomeIcons.solidClock,
                  size: 24,
                  color: context.colorScheme.scrim,
                ),
                Text(
                  '${widget.reminder.getNextDoseTime()?.format('hh:mm a')}',
                  style: AppTextStyle.labelMedium(context).copyWith(
                    color: context.colorScheme.scrim,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCheckBox(BuildContext context) {
    return Checkbox(
      value: checked,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      onChanged: (value) => _checkReminder(context),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      side: BorderSide(
        width: 2.0,
        color: context.colorScheme.scrim,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: context.colorScheme.primary,
        gradient: AppGradients.main(context),
        borderRadius: BorderRadius.circular(24.0),
        boxShadow: AppShadows.box(context),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildInfo(context),
                const SizedBox(height: 20.0),
                _buildTime(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _checkReminder(BuildContext context) {
    setState(() {
      checked = !checked;
    });

    // Make reminder checked
    BlocProvider.of<RemindersCubit>(context)
        .makeReminderChecked(widget.reminder.id);

    Future.delayed(const Duration(seconds: 2));

    // Get reminders list
    BlocProvider.of<RemindersCubit>(context).getRemindersList();
  }
}
