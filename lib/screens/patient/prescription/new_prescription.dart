import 'package:flutter/material.dart';
import 'package:pharmalink/services/networking.dart';
import 'package:pharmalink/utilities/constants.dart';
import '../../../components/doctor_prescription_card.dart';

class NewPrescriptionScreen extends StatefulWidget {
  static String url = "/new_prescription";

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
    try {
      API api = API();
      var doctorInfo = await api.GET(
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
          'New Prescriptions',
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
