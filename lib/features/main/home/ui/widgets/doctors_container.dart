import 'package:flutter/material.dart';
import '../../../../../core/widgets/card_container.dart';
import 'doctor_container.dart';

const firstNames = ['Ahmed', 'Mohammed', 'Ali', 'Omar'];
const lastNames = ['Elmowafy', 'El Sayed', 'El Gendy', 'El Shazly'];
const specialists = [
  'Dentist, M.D.',
  'Surgeon, M.D.',
  'Pediatrician, M.D.',
  'Cardiologist, M.D.'
];

List<String?> imagesUrl = [
  null,
  'https://www.precisionptandmed.com/wp-content/uploads/2019/02/Doctor-PNG-Clipart.png',
  null,
  'https://purepng.com/public/uploads/large/purepng.com-doctorsdoctorsdoctors-and-nursesa-qualified-practitioner-of-medicine-aclinicianmedical-practitionermale-doctornotepad-1421526857009zrma0.png',
];

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      title: "Your Doctors",
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DoctorContainer(
              firstName: firstNames[0],
              lastName: lastNames[0],
              specialty: specialists[0],
              url: imagesUrl[0],
            ),
            DoctorContainer(
              firstName: firstNames[1],
              lastName: lastNames[1],
              specialty: specialists[1],
              url: imagesUrl[1],
            ),
            DoctorContainer(
              firstName: firstNames[2],
              lastName: lastNames[2],
              specialty: specialists[2],
              url: imagesUrl[2],
            ),
            DoctorContainer(
              firstName: firstNames[3],
              lastName: lastNames[3],
              specialty: specialists[3],
              url: imagesUrl[3],
            ),
          ],
        ),
      ),
    );
  }
}
