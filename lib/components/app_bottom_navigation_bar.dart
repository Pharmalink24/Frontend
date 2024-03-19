import "package:flutter/material.dart";
import "package:pharmalink/utilities/constants.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBottomNavigationBar extends StatelessWidget {
  int currentIndex;
  Function onTap;
  AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (i) => () {
        onTap(i);
      },
      backgroundColor: AppColors.secondaryBackground,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.secondaryText,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
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
    );
  }
}
