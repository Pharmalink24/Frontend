import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/shared_preferences/auth_prefs.dart';
import '../../home/ui/home_screen.dart';
import '../../prescription/landing_prescription.dart';
import '../../drug_interaction/drug_interaction_screen.dart';
import '../../profile/profile_screen.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../../../../core/theme/colors.dart';
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
    if (!isTokenValid()) {
      // If token is not valid
      showErrMsg();
      // Clear all data and navigate to sign in screen
      AuthSharedPrefs.clearAuthData();
      context.pushNamed(Routes.signInScreen);
    }
  }

  void showErrMsg() {
    // Todo: Show error message
  }

  bool isTokenValid() {
    // Check if token is valid
    // _token = AuthSharedPrefs.getAccessToken();
    return false;
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
