// Flutter Packages
import 'package:flutter/material.dart';

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
