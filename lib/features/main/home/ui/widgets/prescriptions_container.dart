import 'package:flutter/material.dart';
import 'package:pharmalink/core/widgets/card_container.dart';
import 'drug_list_tile.dart';

class PrescriptionsContainer extends StatelessWidget {
  const PrescriptionsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return const CardContainer(
      title: "Your Prescriptions",
      child: Column(
        children: [
          DrugListTile(
            drugName: "Brufen",
            quantity: "1",
            measure: "Pill",
            time: TimeOfDay(hour: 2, minute: 10),
          ),
          DrugListTile(
            drugName: "Augmentin",
            quantity: "2",
            measure: "Tablets",
            time: TimeOfDay(hour: 20, minute: 30),
          ),
          DrugListTile(
            drugName: "Panadol Cold&Flu",
            quantity: "1",
            measure: "Tablet",
            time: TimeOfDay(hour: 13, minute: 25),
          ),
        ],
      ),
    );
  }
}
