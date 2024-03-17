// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// Screens
import 'package:pharmalink/screens/landing/welcome_screen.dart';
import 'package:pharmalink/screens/patient/home_screen.dart';
import 'package:pharmalink/screens/patient/signin_screen.dart';
import 'package:pharmalink/screens/patient/signup_screen.dart';
// import 'package:pharmalink/screens/doctor/signin_screen.dart';
// import 'package:pharmalink/screens/doctor/signup_screen.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';
import 'package:pharmalink/utilities/info.dart';
// Packages
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppTitle,
      theme: AppTheme.generalAppTheme,
      initialRoute: WelcomeScreen.url,
      routes: {
        WelcomeScreen.url: (context) => const WelcomeScreen(),
        PatientSignInScreen.url: (context) => const PatientSignInScreen(),
        PatientSignUpScreen.url: (context) => const PatientSignUpScreen(),
        // DoctorSignInScreen.url: (context) => const DoctorSignInScreen(),
        // DoctorSignUpScreen.url: (context) => const DoctorSignUpScreen(),
        PatientHomeScreen.url: (context) => const PatientHomeScreen(),
      },
    );
  }
}
