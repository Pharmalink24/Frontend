// Flutter Packages
import 'package:flutter/material.dart';
// Components Packages
import 'package:pharmalink/features/main/prescription/widgets/doctor_prescription_card.dart';
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class ActivePrescriptionScreen extends StatefulWidget {
  static String url = "/active_prescription";

  const ActivePrescriptionScreen({super.key});

  @override
  _ActivePrescriptionScreenState createState() =>
      _ActivePrescriptionScreenState();
}

class _ActivePrescriptionScreenState extends State<ActivePrescriptionScreen> {
  List<DoctorPrescriptionCard> doctorCards = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    //   try {
    //     Api api = Api();
    //     var doctorInfo = await api.get(
    //       'Prescription/user/prescriptions/',
    //       true,
    //       200,
    //     );

    //     if (doctorInfo != null) {
    //       setState(() {
    //         for (var i = 0; i < doctorInfo.length; i++) {
    //           doctorCards.add(DoctorPrescriptionCard(
    //             firstName: doctorInfo[i]['firstName'],
    //             lastName: doctorInfo[i]['lastName'],
    //             date: doctorInfo[i]['created_at'],
    //             doctorImage: doctorInfo[i]['image'],
    //             prescriptionId: doctorInfo[i]['id'],
    //           ));
    //         }
    //       });
    //     } else {
    //       throw "Exception";
    //     }
    //   } catch (e) {
    //     getIt<Logger>().e(e);
    //   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          'Active Prescriptions',
          style: AppTextStyle.displayMedium(context).copyWith(
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
