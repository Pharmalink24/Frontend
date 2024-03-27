import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import '../../home/ui/home_screen.dart';
import '../../prescription/landing_prescription.dart';
import '../../drug_interaction/ui/drug_interaction_screen.dart';
import '../../profile/profile_screen.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../../../../core/theme/colors.dart';
import '../data/models/navigation_items.dart';

List<Widget> pages = [
  const HomeScreen(),
  const LandingPrescriptionScreen(),
  BlocProvider(
    create: (context) => getIt<DrugInteractionCubit>(),
    child: const DrugInteractionScreen(),
  ),
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
