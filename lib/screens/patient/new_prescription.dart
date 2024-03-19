import 'package:flutter/material.dart';
import 'package:pharmalink/screens/patient/landing_prescription.dart';
import 'package:pharmalink/services/networking.dart';
import 'package:pharmalink/utilities/app_theme.dart';
import '../../components/doctor_prescription_card.dart';

class NewPrescriptionScreen extends StatefulWidget {
  @override
  _NewPrescriptionScreenState createState() => _NewPrescriptionScreenState();
}

class _NewPrescriptionScreenState extends State<NewPrescriptionScreen> {
  List<DoctorPrescriptionCard> doctorCards = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    API api = API();
    var doctorInfo = await api.GET('posts', true, 200);
    setState(() {
      for (var i = 0; i < doctorInfo.length; i++) {
        doctorCards.add(DoctorPrescriptionCard(
            firstName: doctorInfo[i]['firstName'],
            lastName: doctorInfo[i]['lastName'],
            date: doctorInfo[i]['created_at'],
            prescriptionId: doctorInfo[i]['id'],
            doctorImage: doctorInfo[i]['image']));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppTheme.secondaryText),
        backgroundColor: AppTheme.primaryBackground,
        title: Text(
          'New Prescriptions',
          style: AppTheme.displayMedium(
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
