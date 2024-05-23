import "package:flutter/material.dart";
import '../../features/access/forget_password/logic/forget_password_cubit.dart';
import '../../features/access/forget_password/ui/forget_password_screen.dart';
import '../enums/drug_state.dart';
import '../../features/main/doctors/ui/doctor_screen.dart';
import '../../features/main/prescription/logic/prescription_cubit.dart';
import '../../features/main/prescription/ui/prescription_screen.dart';
import '../../features/main/prescription/ui/prescriptions_screen.dart';
import '../../features/main/settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import '../../features/main/settings/edit_profile/ui/edit_profile_screen.dart';
import '../../features/main/settings/change_password/logic/cubit/change_password_cubit.dart';
import '../../features/main/settings/change_password/ui/change_password_screen.dart';
import '../../features/main/doctors/logic/cubit/doctors_cubit.dart';
import '../../features/main/doctors/ui/doctors_screen.dart';
import 'package:pharmalink/features/main/chat/logic/cubit/chat_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/messages_screen.dart';
import '../../features/main/chat/data/models/chat.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';
import '../../features/404/error_404_screen.dart';
import '../../features/access/sign/logic/signin_cubit/signin_cubit.dart';
import '../../features/access/sign/data/models/signup/signup_response.dart';
import '../../features/access/sign/logic/signup_cubit/signup_cubit.dart';
import '../../features/access/verification/logic/cubit/verification_cubit.dart';
import '../../features/on_boarding/ui/on_boarding_screen.dart';
import '../../features/main/main/ui/main_screen.dart';
import '../../features/splash/ui/splash_screen.dart';
import '../../features/access/sign/ui/sign_screen.dart';
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
      case Routes.signScreen:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => getIt<SigninCubit>(),
              ),
              BlocProvider(
                create: (context) => getIt<SignupCubit>(),
              ),
            ],
            child: const SignScreen(),
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

        case Routes.forgetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ForgetPasswordCubit>(),
            child: const ForgetPasswordScreen(),
          ),
        );

      // ----------------- Main ----------------- //
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
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
              drugs: prescription['drugs'],
              drugState: prescription['state'],
            ),
          ),
        );

      // ----------------- Chat ----------------- //
      case Routes.messagesScreen:
        final chat = settings.arguments as Chat;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<ChatCubit>(),
            child: MessagesScreen(chat),
          ),
        );

      case Routes.unknownRoute:
        return MaterialPageRoute(builder: (_) => const Error404Screen());

      default:
        return MaterialPageRoute(builder: (_) => const Error404Screen());
    }
  }
}
