// Flutter Packages
import "package:flutter/material.dart";
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/404/error_404_screen.dart';
// Models Packages
import 'package:pharmalink/features/signup/models/doctor_signup_fields.dart';
import 'package:pharmalink/features/signup/models/patient_signup_fields.dart';
import 'package:pharmalink/features/on_boarding/ui/on_boarding_screen.dart';
// Screens Packages
import 'package:pharmalink/features/splash/splash_screen.dart';
import 'package:pharmalink/features/patient_main.dart';
import 'package:pharmalink/features/signin/ui/signin_screen.dart';
import 'package:pharmalink/features/signup/ui/signup_screen.dart';
import 'package:pharmalink/features/signup/ui/verification_screen.dart';
// Utilities
import 'package:pharmalink/core/networking/apis.dart';
// External Packages
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.signInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case Routes.verificationScreen:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case Routes.patientScreen:
        return MaterialPageRoute(builder: (_) => const PatientScreen());

      default:
        print(settings.name);
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
