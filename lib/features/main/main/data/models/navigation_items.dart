import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'bottom_navigation_bar_item_info.dart';

// List of navigation items
List<BottomNavigationBarItemInfo> navigationItems = [
  BottomNavigationBarItemInfo(
    icon: FontAwesomeIcons.house,
    label: "Home",
  ),
  BottomNavigationBarItemInfo(
    icon: FontAwesomeIcons.clipboardList,
    label: "Prescriptions",
  ),
  BottomNavigationBarItemInfo(
    icon: FontAwesomeIcons.flask,
    label: "Drug Interactions",
  ),
  BottomNavigationBarItemInfo(
    icon: FontAwesomeIcons.solidUser,
    label: "User Information",
  ),
];

// Function to retrieve bottom navigation bar items given navigation items info list
List<BottomNavigationBarItem> getBottomNavigationBarItems(navigationItems) {
  List<BottomNavigationBarItem> items = [];

  for (var itemInfo in navigationItems) {
    items.add(
      BottomNavigationBarItem(
        icon: FaIcon(
          itemInfo.icon,
          size: 24.0,
        ),
        label: itemInfo.label,
        tooltip: itemInfo.label,
      ),
    );
  }

  return items;
}
