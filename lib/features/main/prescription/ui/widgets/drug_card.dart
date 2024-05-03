import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/models/drug_info.dart';
import '../../../../../core/theme/styles.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class DrugCard extends StatelessWidget {
  final String tradeName;
  final DrugInfo drugInfo;

  const DrugCard({
    super.key,
    required this.tradeName,
    required this.drugInfo,
  });

  Widget _buildDrugIcon(BuildContext context) {
    return drugInfo.dosageUnit == 'capsule'
        ? Icon(
            size: 40.0,
            FontAwesomeIcons.capsules,
            color: Theme.of(context).colorScheme.primary,
          )
        : Icon(
            size: 40.0,
            FontAwesomeIcons.syringe,
            color: Theme.of(context).colorScheme.primary,
          );
  }

  Widget _buildTradeName(BuildContext context) {
    return Text(
      tradeName,
      style: AppTextStyle.bodyLarge(context),
    );
  }

  Widget _buildScName(BuildContext context) {
    return Text(
      drugInfo.scName,
      style: AppTextStyle.labelMedium(context),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      iconColor: Theme.of(context).colorScheme.secondary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(65.0)),
      ),
    );

    return ButtonBar(
      alignment: MainAxisAlignment.spaceAround,
      buttonHeight: 52.0,
      buttonMinWidth: 90.0,
      children: <Widget>[
        TextButton(
          style: flatButtonStyle,
          onPressed: () {},
          child: Icon(Icons.task_alt_rounded),
        ),
        TextButton(
          style: flatButtonStyle,
          onPressed: () {},
          child: Icon(Icons.cancel),
        ),
      ],
    );
  }

  List<Widget> _buildInstructions(BuildContext context) {
    return [
      Text(
        'Course: ${drugInfo.course} weeks',
        style: AppTextStyle.labelMedium(context),
      ),
      Text(
        'Dose: ${drugInfo.dosage} ${drugInfo.dosageUnit}/day',
        style: AppTextStyle.labelMedium(context),
      ),
      Text(
        'Period: ${drugInfo.startDate} - ${drugInfo.endDate}',
        style: AppTextStyle.labelMedium(context),
      ),
      const SizedBox(height: 10.0),
      _buildButtonBar(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: Theme.of(context).colorScheme.secondaryContainer,
      expandedColor: Theme.of(context).colorScheme.secondaryContainer,
      elevation: 5.0,
      initialElevation: 1.0,
      shadowColor: Theme.of(context).colorScheme.shadow,
      initialPadding: const EdgeInsets.symmetric(vertical: 12.0),
      leading: _buildDrugIcon(context),
      title: _buildTradeName(context),
      animateTrailing: true,
      subtitle: _buildScName(context),
      children: _buildInstructions(context),
    );
  }
}
