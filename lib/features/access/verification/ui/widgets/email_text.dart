import 'package:flutter/material.dart';
import '../../../../../core/theme/styles.dart';

class EmailText extends StatelessWidget {
  final String email;
  const EmailText({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "You're almost there! We sent an email to",
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
