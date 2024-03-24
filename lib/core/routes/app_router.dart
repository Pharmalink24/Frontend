import "package:flutter/material.dart";
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/features/404/error_404_screen.dart';
import 'package:pharmalink/features/auth/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/auth/signup/data/models/signup_response.dart';
import 'package:pharmalink/features/auth/signup/logic/cubit/signup_cubit.dart';
import 'package:pharmalink/features/auth/verification/logic/cubit/verification_cubit.dart';
import 'package:pharmalink/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:pharmalink/features/splash/splash_screen.dart';
import 'package:pharmalink/features/main/main_screen.dart';
import 'package:pharmalink/features/auth/signin/ui/signin_screen.dart';
import 'package:pharmalink/features/auth/signup/ui/signup_screen.dart';
import 'package:pharmalink/features/auth/verification/ui/verification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/router_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

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
          ),
        );

      case Routes.verificationScreen:
        final signupResponse = settings.arguments as SignupResponse;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<VerificationCubit>(),
                  child: VerificationScreen(
                    email: signupResponse.email,
                    userId: signupResponse.id,
                  ),
                ));

      case Routes.mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      default:
        // print(settings.name);
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
