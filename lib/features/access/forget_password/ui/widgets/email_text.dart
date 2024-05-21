import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/styles.dart';

class EmailText extends StatelessWidget {
  final String email;
  const EmailText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context).translate('almostThere'),
          style: AppTextStyle.displayMedium(context).copyWith(fontSize: 16.0),
        ),
        Text(
          email,
          style: AppTextStyle.displayMedium(context).copyWith(fontSize: 20.0),
        ),
      ],
    );
  }
}
