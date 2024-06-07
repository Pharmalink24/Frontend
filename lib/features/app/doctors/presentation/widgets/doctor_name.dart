import 'package:flutter/material.dart';
import '../../../../../core/theme/gradient.dart';
import '../../../../../core/theme/styles.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class DoctorName extends StatelessWidget {
  final String firstName;
  final String lastName;
  const DoctorName({
    super.key,
    this.firstName = "",
    this.lastName = "",
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
      child: GradientText(
        'Dr. $firstName $lastName',
        colors: AppGradients.primaryColors(context),
        textAlign: TextAlign.center,
        style: AppTextStyle.headlineLarge(context),
      ),
    );
  }
}
