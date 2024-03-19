// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
import 'package:pharmalink/components/app_bottom_navigation_bar.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Widget> pages = [];

class DoctorScreen extends StatefulWidget {
  const DoctorScreen({super.key});
  static String url = "doctor/";

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  int activeIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(activeIndex),
    );
  }
}
