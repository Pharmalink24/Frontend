import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';
import 'package:pharmalink/core/widgets/text_with_icon.dart';
import 'package:pharmalink/features/main/home/data/models/drug.dart';
import 'drug_list_tile.dart';

class RemindersContainer extends StatelessWidget {
  final List<Drug> drugs;
  const RemindersContainer({
    super.key,
    required this.drugs,
  });

  Widget buildLoadedListWidgets() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: drugs.length,
      itemBuilder: (context, index) {
        return drugs[index].isToday()
            ? DrugListTile(
                drugName: drugs[index].commercialName,
                quantity: drugs[index].quantity,
                measure: drugs[index].quantityUnit,
                time: drugs[index].calcReminderTime(),
              )
            : const SizedBox.shrink();
      },
    );
  }

  Widget buildNoDataWidget() {
    return const Center(
      child: Text(
        'Here will be your reminders list.',
        style: AppTextStyle.bodyLarge,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardContainerWithTitle(
      title: "Your Reminders",
      iconButton: const TextWithIcon(
        icon: Icons.playlist_add_check_circle_rounded,
        text: 'Check All',
      ),
      child: drugs.isEmpty ? buildLoadedListWidgets() : buildNoDataWidget(),
    );
  }
}
