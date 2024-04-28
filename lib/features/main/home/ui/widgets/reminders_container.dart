import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';
import 'package:pharmalink/core/widgets/text_with_icon.dart';
import '../../data/models/reminder.dart';
import 'reminder_list_tile.dart';

class RemindersContainer extends StatelessWidget {
  final List<Reminder> reminders;
  const RemindersContainer({
    super.key,
    required this.reminders,
  });

  // Todo: Delete the height of the SizedBox
  Widget buildLoadedListWidgets() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: reminders.length,
      itemBuilder: (context, index) {
        return reminders[index].isToday()
            ? ReminderListTile(reminders[index])
            : const SizedBox.shrink();
      },
    );
  }

  Widget buildNoDataWidget() {
    return Column(
      children: [
        const Icon(
          Icons.playlist_add_check_circle_rounded,
          size: 80,
          color: AppColors.accent5,
        ),
        Center(
          child: Text(
            'Your reminders list is empty.',
            style: AppTextStyle.headlineSmall.copyWith(
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
      title: "Your Reminders",
      flex: 6,
      iconButton: const TextWithIcon(
        icon: Icons.playlist_add_check_circle_rounded,
        text: 'Check All',
      ),
      child: reminders.isEmpty ? buildNoDataWidget() : buildLoadedListWidgets(),
    );
  }
}
