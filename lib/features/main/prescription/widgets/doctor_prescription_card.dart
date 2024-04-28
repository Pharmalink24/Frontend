// Flutter Packages
import 'dart:io';

import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/features/main/prescription/prescription.dart';
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class DoctorPrescriptionCard extends StatelessWidget {
  const DoctorPrescriptionCard({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.date,
    required this.doctorImage,
    required this.prescriptionId,
    required this.category,

  });
  final String firstName;
  final String lastName;
  final String date;
  final String doctorImage;
  final int prescriptionId;
  final String category;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PrescriptionScreen(
                      fName: firstName,
                      date: date,
                      id: prescriptionId.toString(),
                      image: doctorImage,
                      lName: lastName,
                      category: category,

                ),
            ),
          );
        },
        child: Container(
          width: 100,
          height: 110,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.accent4],
              stops: [0, 1],
              begin: AlignmentDirectional(1, 1),
              end: AlignmentDirectional(-1, -1),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: AlignmentDirectional(0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 16, 0, 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    doctorImage,
                    width: 89,
                    fit: BoxFit.scaleDown,
                    alignment: Alignment(1, 1),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. $firstName $lastName',
                      style: AppTextStyle.titleMedium.copyWith(
                        fontFamily: 'Readex Pro',
                        fontSize: 20,
                        letterSpacing: 0,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        date,
                        // random_data.randomDate().toString(),
                        style: AppTextStyle.titleSmall.copyWith(
                          fontFamily: 'Readex Pro',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
