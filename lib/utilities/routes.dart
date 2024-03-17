// Flutter Packages
import "package:flutter/material.dart";
// Screens Packages
import 'package:pharmalink/screens/landing/welcome_screen.dart';
import 'package:pharmalink/screens/patient/home_screen.dart';
import 'package:pharmalink/screens/patient/landing_prescription.dart';
import 'package:pharmalink/screens/signin_screen.dart';
import 'package:pharmalink/screens/signup_screen.dart';
// Models Packages
import 'package:pharmalink/models/doctor/signup.dart';
import 'package:pharmalink/models/patient/signup.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';

String initialRoute = WelcomeScreen.url;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomeScreen.url: (context) => const WelcomeScreen(),
  "${AppUrl.patientUrl}/${SignInScreen.url}": (context) => SignInScreen(
        apiUrl: ApiUrl.patientSignIn,
      ),
  "${AppUrl.doctorUrl}/${SignInScreen.url}": (context) => SignInScreen(
        apiUrl: ApiUrl.doctorSignIn,
      ),
  "${AppUrl.patientUrl}/${SignUpScreen.url}": (context) => SignUpScreen(
        apiUrl: ApiUrl.patientSignUp,
        signUpModel: patientSignUpModel,
      ),
  "${AppUrl.doctorUrl}/${SignUpScreen.url}": (context) => SignUpScreen(
        apiUrl: ApiUrl.doctorSignUp,
        signUpModel: doctorSignUpModel,
      ),
  PatientHomeScreen.url: (context) => const PatientHomeScreen(),
  LandingPrescriptionScreen.url: (context) => const LandingPrescriptionScreen(),
};
