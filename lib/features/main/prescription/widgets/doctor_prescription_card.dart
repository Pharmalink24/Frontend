// Flutter Packages
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
  });
  final String firstName;
  final String lastName;
  final String date;
  final String doctorImage;
  final int prescriptionId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PrescriptionScreen()),
          );
        },
        child: Card(
          color: AppColors.secondaryBackground,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 16),
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    doctorImage,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. $firstName $lastName',
                      style: AppTextStyle.displayMedium.copyWith(
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        date,
                        // random_data.randomDate().toString(),
                        style: AppTextStyle.displayMedium.copyWith(
                          fontSize: 16,
                          color: Colors.grey,
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
