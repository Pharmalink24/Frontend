import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/features/main/prescription/logic/prescription_cubit.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/models/drug_info.dart';
import '../../../../../../core/theme/styles.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class DrugCard extends StatelessWidget {
  final String tradeName;
  final DrugInfo drugInfo;
  final int prescriptionId;

  const DrugCard({
    super.key,
    required this.prescriptionId,
    required this.tradeName,
    required this.drugInfo,
  });

  Widget _buildDrugIcon(BuildContext context) {
    return drugInfo.dosageUnit == 'capsule'
        ? Icon(
            size: 28.0,
            FontAwesomeIcons.capsules,
            color: context.colorScheme.primary,
          )
        : Icon(
            size: 28.0,
            FontAwesomeIcons.syringe,
            color: context.colorScheme.primary,
          );
  }

  Widget _buildTradeName(BuildContext context) {
    return Text(
      tradeName,
      style: AppTextStyle.bodyMedium(context),
    );
  }

  Widget _buildScName(BuildContext context) {
    return Text(
      drugInfo.scName,
      style: AppTextStyle.labelSmall(context),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    if (drugInfo.state == DrugState.NEW) {
      return FormButton(
        width: double.infinity,
        onPressed: () {
          context
              .read<PrescriptionCubit>()
              .activateDrug(prescriptionId, tradeName);
        },
        text: AppLocalizations.of(context).translate('activate'),
        color: context.colorScheme.primary,
      );
    } else if (drugInfo.state == DrugState.ACTIVE) {
      return FormButton(
        width: double.infinity,
        onPressed: () {
          context
              .read<PrescriptionCubit>()
              .deactivateDrug(prescriptionId, tradeName);
        },
        text: AppLocalizations.of(context).translate('deactivate'),
        color: context.colorScheme.primary,
      );
    } else {
      return FormButton(
        width: double.infinity,
        onPressed: () {
          context
              .read<PrescriptionCubit>()
              .reactivateDrug(prescriptionId, tradeName);
        },
        text: AppLocalizations.of(context).translate('reactivate'),
        color: context.colorScheme.primary,
      );
    }
  }

  // Build Course
  Widget _buildCourseRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'For',
          style: AppTextStyle.labelMedium(context),
        ),
        const SizedBox(width: 4.0),
        Text(
          '${drugInfo.course} day${drugInfo.course > 1 ? 's' : ''}',
          style: AppTextStyle.labelMedium(context),
        ),
      ],
    );
  }

  // Build Dose & Per
  Widget _buildDosePerRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${drugInfo.dosage}',
          style: AppTextStyle.labelMedium(context),
        ),
        const SizedBox(width: 4.0),
        const Icon(
          FontAwesomeIcons.pills,
          size: 14.0,
        ),
        Text(
          ' / ${drugInfo.per} day${drugInfo.per > 1 ? 's' : ''}',
          style: AppTextStyle.labelMedium(context),
        ),
      ],
    );
  }

  // Build date
  Widget _buildDateRow(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.calendar,
              size: 14.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              drugInfo.startDate,
              style: AppTextStyle.labelMedium(context),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.solidCalendar,
              size: 14.0,
            ),
            const SizedBox(width: 4.0),
            Text(
              drugInfo.endDate,
              style: AppTextStyle.labelMedium(context),
            ),
          ],
        ),
      ],
    );
  }

  List<Widget> _buildInstructions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // _buildCourseRow(context),
            // const SizedBox(height: 8.0),
            _buildDosePerRow(context),
            const SizedBox(height: 8.0),
            _buildDateRow(context),
            const SizedBox(height: 8.0),
            _buildButtonBar(context),
          ],
        ),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTileCard(
      baseColor: context.colorScheme.surface,
      expandedColor: context.colorScheme.surface,
      elevation: 5.0,
      initialElevation: 1.0,
      shadowColor: context.colorScheme.shadow,
      initialPadding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      finalPadding: const EdgeInsets.symmetric(
        vertical: 4.0,
        horizontal: 8.0,
      ),
      leading: _buildDrugIcon(context),
      title: _buildTradeName(context),
      animateTrailing: true,
      subtitle: _buildScName(context),
      children: _buildInstructions(context),
    );
  }
}
