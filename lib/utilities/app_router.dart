// Flutter Packages
import "package:flutter/material.dart";
import 'package:pharmalink/business_logic/sign/cubit/signup_cubit.dart';
import 'package:pharmalink/data/repository/signup_repo.dart';
import 'package:pharmalink/data/web_services/signup_web_services.dart';
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
// External Packages
import 'package:flutter_bloc/flutter_bloc.dart';

String initialRoute = WelcomeScreen.url;

class AppRouter {
  AppRouter();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.url:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());

      case LandingScreen.url:
        return MaterialPageRoute(builder: (_) => const LandingScreen());

      case OnBoardingScreen.url:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case "${URL.patient}/${SignInScreen.url}":
        return MaterialPageRoute(
            builder: (_) => const SignInScreen(
                  apiUrl: API.patientSignIn,
                ));

      case "${URL.doctor}/${SignInScreen.url}":
        return MaterialPageRoute(
            builder: (_) => const SignInScreen(
                  apiUrl: API.doctorSignIn,
                ));

      case "${URL.patient}/${SignUpScreen.url}":
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(
                  apiUrl: API.patientSignUp,
                  signUpFields: patientSignUpFields,
                ));

      case "${URL.doctor}/${SignUpScreen.url}":
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(
                  apiUrl: API.patientSignUp,
                  signUpFields: doctorSignUpFields,
                ));

      case "${URL.patient}/${VerificationScreen.url}":
        return MaterialPageRoute(
            builder: (_) => const VerificationScreen(
                  apiUrl: API.patientSendVerification,
                ));

      case "${URL.doctor}/${VerificationScreen.url}":
        return MaterialPageRoute(
            builder: (_) => const VerificationScreen(
                  apiUrl: API.doctorSendVerification,
                ));

      case PatientScreen.url:
        return MaterialPageRoute(builder: (_) => const PatientScreen());

      default:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
    }
  }
}
