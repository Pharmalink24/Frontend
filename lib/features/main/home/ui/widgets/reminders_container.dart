import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/card_container_with_title.dart';
import '../../../../../core/widgets/text_with_icon.dart';
import '../../../reminders/models/reminder.dart';
import '../../../../../core/localization/app_localizations.dart';
import 'reminder_list_tile.dart';

class RemindersContainer extends StatelessWidget {
  final List<Reminder> reminders;
  const RemindersContainer({
    super.key,
    this.reminders = const [],
  });

  Widget buildLoadedListWidgets() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return ReminderListTile(reminders[index]);
      },
    );
  }

  Widget buildNoDataWidget(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.playlist_add_check_circle_rounded,
          size: 80,
          color: AppColors.accent5,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noRemindersToday'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: AppLocalizations.of(context).translate('yourReminders'),
      isScrollable: false,
      flex: 6,
      iconButton: const TextWithIcon(
        icon: Icons.calendar_today_outlined,
        text: '',
      ),
      child: reminders.isEmpty
          ? buildNoDataWidget(context)
          : buildLoadedListWidgets(),
    );
  }
}
