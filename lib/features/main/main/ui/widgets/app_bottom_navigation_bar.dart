import "package:custom_navigation_bar/custom_navigation_bar.dart";
import "package:flutter/material.dart";
import "package:pharmalink/core/theme/colors.dart";

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  final List<CustomNavigationBarItem> items;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: CustomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => onTap(i),
        items: items,
        backgroundColor: context.colorScheme.primaryContainer,
        selectedColor: context.colorScheme.primary,
        unSelectedColor: context.colorScheme.onSecondary,
        isFloating: true,
        bubbleCurve: Curves.decelerate,
        iconSize: 28.0,
        borderRadius: const Radius.circular(12.0),
        strokeColor: context.colorScheme.scrim,
      ),
    );
  }
}
