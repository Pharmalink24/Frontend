import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';

class StillCantFindText extends StatelessWidget {
  const StillCantFindText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(S.of(context).stillCantFindEmail),
    );
  }
}
