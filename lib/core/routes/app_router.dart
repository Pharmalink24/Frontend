import "package:flutter/material.dart";
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';
import '../../features/404/error_404_screen.dart';
import '../../features/access/signin/logic/cubit/signin_cubit.dart';
import '../../features/access/signup/data/models/signup_response.dart';
import '../../features/access/signup/logic/cubit/signup_cubit.dart';
import '../../features/access/verification/logic/cubit/verification_cubit.dart';
import '../../features/on_boarding/ui/on_boarding_screen.dart';
import '../../features/main/main/ui/main_screen.dart';
import '../../features/splash/ui/splash_screen.dart';
import '../../features/access/signin/ui/signin_screen.dart';
import '../../features/access/signup/ui/signup_screen.dart';
import '../../features/access/verification/ui/verification_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          ),
        );

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
          ),
        );

      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const MainScreen(),
          ),
        );

      
      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
