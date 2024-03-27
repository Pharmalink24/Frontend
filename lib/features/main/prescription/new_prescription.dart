import 'package:flutter/material.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import 'widgets/doctor_prescription_card.dart';

class NewPrescriptionScreen extends StatefulWidget {
  static String url = "/new_prescription";

  const NewPrescriptionScreen({super.key});

  @override
  _NewPrescriptionScreenState createState() => _NewPrescriptionScreenState();
}

class _NewPrescriptionScreenState extends State<NewPrescriptionScreen> {
  List<DoctorPrescriptionCard> doctorCards = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    // try {
    //   Api api = Api();
    //   var doctorInfo = await api.get(
    //     'Prescription/user/prescriptions/',
    //     true,
    //     200,
    //   );

    //   if (doctorInfo != null) {
    //     setState(() {
    //       for (var i = 0; i < doctorInfo.length; i++) {
    //         doctorCards.add(DoctorPrescriptionCard(
    //           firstName: doctorInfo[i]['firstName'],
    //           lastName: doctorInfo[i]['lastName'],
    //           date: doctorInfo[i]['created_at'],
    //           doctorImage: doctorInfo[i]['image'],
    //           prescriptionId: doctorInfo[i]['id'],
    //         ));
    //       }
    //     });
    //   } else {
    //     throw "Exception";
    //   }
    // } catch (e) {
    //   getIt<Logger>().e(e);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
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
