import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/reminders/data/models/reminder.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_bar.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class ReminderCalenderScreen extends StatelessWidget {
  final List<Reminder> reminders;
  const ReminderCalenderScreen({super.key, required this.reminders});

  Widget _buildCalender(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.parse('2021-01-01'),
      lastDay: DateTime.now(),
      focusedDay: DateTime.now(),
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: context.colorScheme.primary,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color: context.colorScheme.secondary,
          shape: BoxShape.circle,
        ),
        selectedTextStyle: TextStyle(color: context.colorScheme.onSecondary),
        todayTextStyle: TextStyle(color: context.colorScheme.onPrimary),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          type: AppBarType.withoutLogo,
          title: AppLocalizations.of(context).translate('calender'),
          automaticallyImplyLeading: true,
        ).build(context),
        body: SafeArea(
          child: Column(
            children: [
              _buildCalender(context),
            ],
          ),
        ));
  }
}
