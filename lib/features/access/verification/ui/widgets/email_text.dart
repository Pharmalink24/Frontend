import 'package:flutter/material.dart';
import 'package:pharmalink/generated/l10n.dart';
import '../../../../../core/theme/styles.dart';

class EmailText extends StatelessWidget {
  final String email;
  const EmailText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          S.of(context).almostThere,
          style: AppTextStyle.displayMedium.copyWith(fontSize: 16.0),
        ),
        Text(
          email,
          style: AppTextStyle.displayMedium.copyWith(fontSize: 20.0),
        ),
      ],
    );
  }
}
