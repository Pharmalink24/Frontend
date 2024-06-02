import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../core/widgets/expansion_card_container.dart';

class NotesCard extends StatelessWidget {
  final String notes;

  const NotesCard({
    super.key,
    required this.notes,
  });

  Widget _buildEmptyText(BuildContext context) {
    return Text(
      AppLocalizations.of(context).translate('No Notes'),
      style: AppTextStyle.bodySmall(context),
      textAlign: TextAlign.left,
    );
  }

  Widget _buildNotes(BuildContext context) {
    return Text(
      notes,
      style: AppTextStyle.bodySmall(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionCardContainer(
      title: AppLocalizations.of(context).translate('Notes'),
      children: [
        notes.isEmpty ? _buildEmptyText(context) : _buildNotes(context),
      ],
    );
  }
}
