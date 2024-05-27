import 'package:flutter/material.dart';
import 'widgets/drug_interaction_form.dart';
import 'widgets/interaction_result_container.dart';

class DrugInteractionScreen extends StatefulWidget {
  const DrugInteractionScreen({super.key});

  @override
  State<DrugInteractionScreen> createState() => _DrugInteractionScreenState();
}

class _DrugInteractionScreenState extends State<DrugInteractionScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsetsDirectional.all(16),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: DrugInteractionForm(),
            ),
            Expanded(
              flex: 2,
              child: InteractionResultContainer(),
            ),
          ],
        ),
      ),
    );
  }
}
