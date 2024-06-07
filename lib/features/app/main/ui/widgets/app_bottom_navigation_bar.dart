import "package:flutter/material.dart";

class AppBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function onTap;
  final List<BottomNavigationBarItem> items;

  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) => onTap(i),
      items: items,
      backgroundColor:
          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
      selectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
      unselectedItemColor:
          Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
      selectedLabelStyle:
          Theme.of(context).bottomNavigationBarTheme.selectedLabelStyle,
      unselectedLabelStyle:
          Theme.of(context).bottomNavigationBarTheme.unselectedLabelStyle,
      elevation: Theme.of(context).bottomNavigationBarTheme.elevation,
    );
  }
}
