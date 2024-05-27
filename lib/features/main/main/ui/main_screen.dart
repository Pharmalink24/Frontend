import 'package:flutter/material.dart';
import 'widgets/app_bottom_navigation_bar.dart';
import '../data/models/navigation_items.dart';
import 'widgets/pages.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Refresh token on start
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Expanded(child: pages[activeIndex]),
          ],
        ),
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
