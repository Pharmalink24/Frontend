import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../reminders/logic/reminders_cubit.dart';
import '../../../reminders/models/reminder.dart';
import '../../../../../core/theme/styles.dart';

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
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) => setState(() {
        isChecked = value ?? false;
        // Make reminder checked
        BlocProvider.of<RemindersCubit>(context)
            .makeReminderChecked(widget.reminder.id);
        // Todo: Get reminders list
        // BlocProvider.of<HomePageCubit>(context).getReminderList();
      }),
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      checkColor: Theme.of(context).colorScheme.tertiary,
      activeColor: Theme.of(context).colorScheme.secondary,
      secondary: Text(
        "${widget.reminder.hours} : ${widget.reminder.minute}\n${widget.reminder.period}",
        textAlign: TextAlign.center,
        style: AppTextStyle.labelLarge(context).copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      title: Text(
        widget.reminder.drugName,
        style: AppTextStyle.titleMedium(context).copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        "${widget.reminder.dosage} ${widget.reminder.dosageUnit}",
        style: AppTextStyle.labelMedium(context).copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
