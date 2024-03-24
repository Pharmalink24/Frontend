// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/features/main/home/ui/home_screen.dart';
import 'package:pharmalink/features/main/prescription/landing_prescription.dart';
import 'package:pharmalink/features/main/drug_interaction/drug_interaction_screen.dart';
import 'package:pharmalink/features/main/profile/profile_screen.dart';
// Components Packages
import 'package:pharmalink/core/widgets/app_bottom_navigation_bar.dart';
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
// External Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> pages = [
  const HomeScreen(),
  const LandingPrescriptionScreen(),
  const DrugInteractionScreen(),
  const ProfileScreen(),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
