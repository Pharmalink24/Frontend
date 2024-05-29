import 'package:flutter/material.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../data/models/navigation_items.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class MainScreen extends AutoRouter {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // Refresh token on start
    return PopScope(
      canPop: false,
      child: AutoTabsScaffold(
          resizeToAvoidBottomInset: false,
          routes: const [
            HomeRoute(),
            LandingPrescriptionRoute(),
            DrugInteractionRoute(),
            ProfileRoute(),
          ],
          bottomNavigationBuilder: (_, tabsRouter) {
            return AppBottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: getBottomNavigationBarItems(navigationItems),
            );
          }),
    );
  }
}
