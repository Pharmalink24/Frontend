// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/patient/home/home_screen.dart';
import 'package:pharmalink/presentation/screens/patient/prescription/landing_prescription.dart';
import 'package:pharmalink/presentation/screens/patient/drug_interaction/drug_interaction_screen.dart';
import 'package:pharmalink/presentation/screens/patient/profile/profile_screen.dart';
// Components Packages
import 'package:pharmalink/presentation/components/app_bottom_navigation_bar.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/colors.dart';
// External Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> pages = [
  const PatientHomeScreen(),
  const PatientLandingPrescriptionScreen(),
  const PatientDrugInteractionScreen(),
  const PatientProfileScreen(),
];

class PatientScreen extends StatefulWidget {
  const PatientScreen({super.key});
  static String url = "patient/";

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(activeIndex),
      backgroundColor: AppColors.secondaryBackground,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: activeIndex,
        onTap: (i) {
          setState(() {
            activeIndex = i;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.house,
              size: 24.0,
            ),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.clipboardList,
              size: 24.0,
            ),
            label: 'Prescriptions',
            tooltip: 'Prescriptions',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.flask,
              size: 24.0,
            ),
            label: 'Drug Interactions',
            tooltip: 'Drug Interactions',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.solidUser,
              size: 24.0,
            ),
            label: 'User Information',
            tooltip: 'User Information',
          )
        ],
      ),
    );
  }
}
