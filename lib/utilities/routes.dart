// Flutter Packages
import "package:flutter/material.dart";
import 'package:pharmalink/screens/landing/on_boarding_screen.dart';
import 'package:pharmalink/screens/landing/landing_screen.dart';
// Screens Packages
import 'package:pharmalink/screens/landing/welcome_screen.dart';
import 'package:pharmalink/screens/patient/home_screen.dart';
import 'package:pharmalink/screens/patient/prescription/landing_prescription.dart';
import 'package:pharmalink/screens/signin_screen.dart';
import 'package:pharmalink/screens/signup/signup_screen.dart';
// Models Packages
import 'package:pharmalink/models/auth/doctor/signup.dart';
import 'package:pharmalink/models/auth/patient/signup.dart';
import 'package:pharmalink/screens/signup/verification_screen.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';

String initialRoute = WelcomeScreen.url;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomeScreen.url: (context) => const WelcomeScreen(),
  LandingScreen.url: (context) => const LandingScreen(),
  OnBoardingScreen.url: (context) => const OnBoardingScreen(),
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
  "${AppUrl.patientUrl}/${VerificationScreen.url}": (context) =>
      VerificationScreen(
        apiUrl: ApiUrl.patientSendVerification,
      ),
  "${AppUrl.doctorUrl}/${VerificationScreen.url}": (context) =>
      VerificationScreen(
        apiUrl: ApiUrl.doctorSendVerification,
      ),
  PatientHomeScreen.url: (context) => const PatientHomeScreen(),
  LandingPrescriptionScreen.url: (context) => const LandingPrescriptionScreen(),
};
