import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/generated/l10n.dart';

class AccountSettingsHeader extends StatelessWidget {
  const AccountSettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            S.of(context).accountSettings,
            style: AppTextStyle.labelMedium,
          ),
        ),
      ],
    );
  }
}
