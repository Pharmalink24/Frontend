// Flutter Packages
import "package:flutter/material.dart";
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/404/error_404_screen.dart';
import 'package:pharmalink/features/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/signup/data/logic/cubit/signup_cubit.dart';
import 'package:pharmalink/features/on_boarding/ui/on_boarding_screen.dart';
// Screens Packages
import 'package:pharmalink/features/splash/splash_screen.dart';
import 'package:pharmalink/features/patient_main.dart';
import 'package:pharmalink/features/signin/ui/signin_screen.dart';
import 'package:pharmalink/features/signup/ui/signup_screen.dart';
import 'package:pharmalink/features/signup/ui/verification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.signInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SigninCubit>(),
                  child: const SigninScreen(),
                ));

      case Routes.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignupScreen(),
                ));

      case Routes.verificationScreen:
        return MaterialPageRoute(builder: (_) => const VerificationScreen());

      case Routes.patientScreen:
        return MaterialPageRoute(builder: (_) => const PatientScreen());

      default:
        // print(settings.name);
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
