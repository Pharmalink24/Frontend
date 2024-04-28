import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/home/logic/cubit/home_page_cubit.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/reminder.dart';

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
        BlocProvider.of<HomePageCubit>(context).makeReminderChecked(widget.reminder.id);
        // Get reminders list
        BlocProvider.of<HomePageCubit>(context).getReminderList();
      }),
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      checkColor: AppColors.alternate,
      activeColor: AppColors.secondary,
      secondary: Text(
        "${widget.reminder.hours} : ${widget.reminder.minute}\n${widget.reminder.period}",
        textAlign: TextAlign.center,
        style: AppTextStyle.labelLarge.copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      title: Text(
        widget.reminder.drugName,
        style: AppTextStyle.titleMedium.copyWith(
          color: AppColors.primaryText,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        "${widget.reminder.dosage} ${widget.reminder.dosageUnit}",
        style: AppTextStyle.labelMedium.copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
