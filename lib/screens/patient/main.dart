// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
import 'package:pharmalink/screens/patient/drug_interaction_screen.dart';
import 'package:pharmalink/screens/patient/home_screen.dart';
import 'package:pharmalink/screens/patient/prescription/prescription.dart';
import 'package:pharmalink/screens/patient/profile/profile_screen.dart';
// Components Packages
import 'package:pharmalink/components/app_bottom_navigation_bar.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages

String Name = "Youssef";
String imageUrl =
    'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jb3RyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60';

class PatientScreen extends StatefulWidget {
    static String url = "patient/";
  final String? initialPage;
  final Widget? page;

  const PatientScreen({super.key, this.initialPage, this.page});

  @override
  State<PatientScreen> createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  String _currentPageName = PatientHomeScreen.url;
  Widget? _currentPage;

  @override
  void initState() {
    @override
    void initState() {
      super.initState();
      _currentPageName = widget.initialPage ?? _currentPageName;
      _currentPage = widget.page;
    }
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      PatientHomeScreen.url: PatientHomeScreen(),
      PatientPrescriptionScreen.url: PatientPrescriptionScreen(),
      PatientDrugInteractionScreen.url: PatientDrugInteractionScreen(),
      PatientProfileScreen.url: PatientProfileScreen(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);

    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
      ),
      body: _currentPage ?? tabs[_currentPageName],
    );
  }
}
