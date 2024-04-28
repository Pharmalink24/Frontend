// Flutter Packages
import 'dart:convert';

import 'package:flutter/material.dart';
// Components Packages
import 'package:pharmalink/features/main/prescription/widgets/doctor_prescription_card.dart';
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/networking/networking.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  // Parse the date string to DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format you want
  DateFormat dateFormat = DateFormat('on yyyy-MM-dd');

  // Format the DateTime object using the defined format
  String formattedDate = dateFormat.format(dateTime);

  return formattedDate;
}


class AllPrescriptionScreen extends StatefulWidget {
  static String url = "/active_prescription";
  final String category;

  const AllPrescriptionScreen({
    super.key,
    required this.category,
  });


@override
  _AllPrescriptionScreenState createState() =>
      _AllPrescriptionScreenState();
}

class _AllPrescriptionScreenState extends State<AllPrescriptionScreen> {
  List<DoctorPrescriptionCard> doctorCards = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
      try {
        API api = API();
        var doctorInfo = await api.GET(
          'Prescription/user/state-prescriptions/Doctorinfo/?state=${widget.category}',
          200,
          auth: true,
        );

        if (doctorInfo != null) {
          setState(() {
            for (var i = 0; i < doctorInfo.length; i++) {
              doctorCards.add(DoctorPrescriptionCard(
                firstName: doctorInfo[i]['doctorInfo']['fname'],
                lastName: doctorInfo[i]['doctorInfo']['lname'],
                date: formatDateTime(doctorInfo[i]['created_at']),
                doctorImage: doctorInfo[i]['doctorInfo']['image'] != null
                    ? '${ApiConstants.baseUrl}${doctorInfo[i]['doctorInfo']['image']}'
                    : 'https://drive.google.com/file/d/1KdhhjQ-zhDq2AAkJ7YgBujT5ykGMebg3/view',
                prescriptionId: doctorInfo[i]['id'],
                category: widget.category,
              ));
            }
          });
        } else {
          throw "Exception";
        }
      }
      catch (e) {
        // getIt<Logger>().e(e);
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          '${widget.category} Prescriptions',
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: doctorCards,
        ),
      ),
    );
  }
}
