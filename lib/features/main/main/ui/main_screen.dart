import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/home/ui/home_screen.dart';
import 'package:pharmalink/features/main/prescription/landing_prescription.dart';
import 'package:pharmalink/features/main/drug_interaction/drug_interaction_screen.dart';
import 'package:pharmalink/features/main/profile/profile_screen.dart';
import 'package:pharmalink/features/main/main/ui/widgets/app_bottom_navigation_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../data/models/navigation_items.dart';

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
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: pages.elementAt(activeIndex),
        backgroundColor: AppColors.secondaryBackground,
        bottomNavigationBar: AppBottomNavigationBar(
          currentIndex: activeIndex,
          onTap: (i) {
            setState(() {
              activeIndex = i;
            });
          },
          items: getBottomNavigationBarItems(navigationItems),
        ),
      ),
    );
  }
}
