import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../access/signin/logic/cubit/signin_cubit.dart';
import '../../home/ui/home_screen.dart';
import '../../prescription/landing_prescription.dart';
import '../../drug_interaction/drug_interaction_screen.dart';
import '../../profile/profile_screen.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../../../../core/theme/colors.dart';
import '../data/models/navigation_items.dart';
import 'widgets/refresh_token_bloc_listener.dart';

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

    // Refresh token on start
    context.read<SigninCubit>().refreshToken();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: pages[activeIndex],
            ),
            const RefreshTokenBlocListener(),
          ],
        ),
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
