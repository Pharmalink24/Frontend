import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/doctor_card.dart';

import '../../../../core/models/doctor.dart';

class DoctorsScreen extends StatelessWidget {
  final List<Doctor> doctors;

  const DoctorsScreen({
    super.key,
    required this.doctors,
  });

  Widget buildListOfDoctors() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorCard(
          doctors[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          'Your Doctors',
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: buildListOfDoctors(),
    );
  }
}
