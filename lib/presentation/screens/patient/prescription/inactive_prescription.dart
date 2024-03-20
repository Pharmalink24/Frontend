// Flutter Packages
import 'package:flutter/material.dart';
// Services Packages
import 'package:pharmalink/data/web_services/networking.dart';
// Components Packages
import 'package:pharmalink/presentation/components/doctor_prescription_card.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/constants.dart';

class InactivePrescriptionScreen extends StatefulWidget {
  static String url = "/inactive_prescription";

  @override
  _InactivePrescriptionScreenState createState() =>
      _InactivePrescriptionScreenState();
}

class _InactivePrescriptionScreenState
    extends State<InactivePrescriptionScreen> {
  List<DoctorPrescriptionCard> doctorCards = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    try {
      API api = API();
      var doctorInfo = await api.get(
        'Prescription/user/prescriptions/',
        true,
        200,
      );

      if (doctorInfo != null) {
        setState(() {
          for (var i = 0; i < doctorInfo.length; i++) {
            doctorCards.add(DoctorPrescriptionCard(
              firstName: doctorInfo[i]['firstName'],
              lastName: doctorInfo[i]['lastName'],
              date: doctorInfo[i]['created_at'],
              doctorImage: doctorInfo[i]['image'],
              prescriptionId: doctorInfo[i]['id'],
            ));
          }
        });
      } else {
        throw "Exception";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          'Inactive Prescriptions',
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
