import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';

class StillCantFindText extends StatelessWidget {
  const StillCantFindText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        AppLocalizations.of(context).translate('stillCantFindEmail'),
      ),
    );
  }
}
