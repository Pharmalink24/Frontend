import "package:flutter/material.dart";
import '../enums/drug_state.dart';
import '../../features/access/auth/logic/cubit/auth_cubit.dart';
import '../../features/main/doctors/ui/doctor_screen.dart';
import '../models/drug_search.dart';
import '../../features/main/prescription/logic/cubit/prescription_cubit.dart';
import '../../features/main/prescription/ui/prescription_screen.dart';
import '../../features/main/prescription/ui/prescriptions_screen.dart';
import '../../features/main/prescription/ui/widgets/category_widget.dart';
import '../../features/main/settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import '../../features/main/settings/edit_profile/ui/edit_profile_screen.dart';
import '../../features/main/settings/change_password/logic/cubit/change_password_cubit.dart';
import '../../features/main/settings/change_password/ui/change_password_screen.dart';
import '../../features/main/doctors/logic/cubit/doctors_cubit.dart';
import '../../features/main/doctors/ui/doctors_screen.dart';
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

      // ----------------- Access (Authorization) ----------------- //
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

      // ----------------- Main ----------------- //
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<AuthCubit>(),
            child: const MainScreen(),
          ),
        );

      case Routes.editProfileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<EditProfileCubit>(),
            child: const EditProfileScreen(),
          ),
        );

      case Routes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChangePasswordCubit>(),
            child: const ChangePasswordScreen(),
          ),
        );

      // ----------------- Doctor ----------------- //
      case Routes.doctorsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DoctorsCubit>(),
            child: const DoctorsScreen(),
          ),
        );

      case Routes.doctorScreen:
        final doctorId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<DoctorsCubit>(),
            child: DoctorScreen(
              id: doctorId,
            ),
          ),
        );

      // ----------------- Prescription ----------------- //
      case Routes.prescriptionsScreen:
        final category = settings.arguments as DrugState;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PrescriptionCubit>(),
            child: PrescriptionsScreen(
              state: category,
            ),
          ),
        );

      case Routes.prescriptionScreen:
        final prescription = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<PrescriptionCubit>(),
            child: PrescriptionScreen(
              id: prescription['id'],
              doctor: prescription['doctor'],
              drugState: prescription['state'],
            ),
          ),
        );

      case Routes.unknownRoute:
        return MaterialPageRoute(builder: (_) => const Error404Screen());

      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
