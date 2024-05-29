import 'package:flutter/material.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';

class NotesCard extends StatelessWidget {
  final String notes;

  const NotesCard({
    super.key,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 100),
      child: CardContainerWithTitle(
        isScrollable: false,
        title: AppLocalizations.of(context).translate('Notes'),
        child: Column(
          children: [
            Text(notes),
          ],
        ),
      ),
    );
  }
}
