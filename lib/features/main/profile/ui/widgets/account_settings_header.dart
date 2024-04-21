import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/styles.dart';

class AccountSettingsHeader extends StatelessWidget {
  const AccountSettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            'Account Settings',
            style: AppTextStyle.labelMedium,
          ),
        ),
      ],
    );
  }
}
