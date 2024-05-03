import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';

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
    return Align(
      alignment: const AlignmentDirectional(0, 0),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 32, 0, 0),
        child: Text(
          'Dr. $firstName $lastName',
          style: AppTextStyle.headlineLarge(context).copyWith(
            fontFamily: AppFonts.getFont(context, Font.secondary),
          ),
        ),
      ),
    );
  }
}
