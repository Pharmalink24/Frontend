// Flutter Packages
import "package:flutter/material.dart";
// Models Packages
import 'package:pharmalink/presentation/screens/signup/doctor_signup_fields.dart';
import 'package:pharmalink/presentation/screens/signup/patient_signup_fields.dart';
import 'package:pharmalink/presentation/screens/landing/landing_screen.dart';
import 'package:pharmalink/presentation/screens/landing/on_boarding_screen.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/landing/welcome_screen.dart';
import 'package:pharmalink/presentation/screens/patient/patient_main.dart';
import 'package:pharmalink/presentation/screens/signin/signin_screen.dart';
import 'package:pharmalink/presentation/screens/signup/signup_screen.dart';
import 'package:pharmalink/presentation/screens/signup/verification_screen.dart';
// Utilities
import 'package:pharmalink/utilities/constants/apis.dart';
import 'package:pharmalink/utilities/constants/urls.dart';

String initialRoute = WelcomeScreen.url;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomeScreen.url: (context) => const WelcomeScreen(),
  LandingScreen.url: (context) => const LandingScreen(),
  OnBoardingScreen.url: (context) => const OnBoardingScreen(),
  "${URL.patient}/${SignInScreen.url}": (context) => const SignInScreen(
        apiUrl: API.patientSignIn,
      ),
  "${URL.doctor}/${SignInScreen.url}": (context) => const SignInScreen(
        apiUrl: API.doctorSignIn,
      ),
  "${URL.patient}/${SignUpScreen.url}": (context) => SignUpScreen(
        apiUrl: API.patientSignUp,
        signUpModel: patientSignUpFields,
      ),
  "${URL.doctor}/${SignUpScreen.url}": (context) => SignUpScreen(
        apiUrl: API.doctorSignUp,
        signUpModel: doctorSignUpFields,
      ),
  "${URL.patient}/${VerificationScreen.url}": (context) =>
      const VerificationScreen(
        apiUrl: API.patientSendVerification,
      ),
  "${URL.doctor}/${VerificationScreen.url}": (context) =>
      const VerificationScreen(
        apiUrl: API.doctorSendVerification,
      ),
  PatientScreen.url: (context) => const PatientScreen(),
};
