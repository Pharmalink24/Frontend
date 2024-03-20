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
// Utilities Packages
import 'package:pharmalink/utilities/constants/constants.dart';

String initialRoute = WelcomeScreen.url;

Map<String, Widget Function(BuildContext)> routes = {
  WelcomeScreen.url: (context) => const WelcomeScreen(),
  LandingScreen.url: (context) => const LandingScreen(),
  OnBoardingScreen.url: (context) => const OnBoardingScreen(),
  "${AppUrl.patient}/${SignInScreen.url}": (context) => SignInScreen(
        apiUrl: ApiUrl.patientSignIn,
      ),
  "${AppUrl.doctor}/${SignInScreen.url}": (context) => SignInScreen(
        apiUrl: ApiUrl.doctorSignIn,
      ),
  "${AppUrl.patient}/${SignUpScreen.url}": (context) => SignUpScreen(
        apiUrl: ApiUrl.patientSignUp,
        signUpModel: patientSignUpFields,
      ),
  "${AppUrl.doctor}/${SignUpScreen.url}": (context) => SignUpScreen(
        apiUrl: ApiUrl.doctorSignUp,
        signUpModel: doctorSignUpFields,
      ),
  "${AppUrl.patient}/${VerificationScreen.url}": (context) =>
      const VerificationScreen(
        apiUrl: ApiUrl.patientSendVerification,
      ),
  "${AppUrl.doctor}/${VerificationScreen.url}": (context) =>
      const VerificationScreen(
        apiUrl: ApiUrl.doctorSendVerification,
      ),
  PatientScreen.url: (context) => const PatientScreen(),
};
