import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import 'package:pharmalink/features/main/drug_interaction/ui/drug_interaction_screen.dart';
import 'package:pharmalink/features/main/home/ui/home_screen.dart';
import 'package:pharmalink/features/main/prescription/ui/landing_prescription_screen.dart';
import 'package:pharmalink/features/main/profile/logic/cubit/profile_cubit.dart';
import 'package:pharmalink/features/main/profile/ui/profile_screen.dart';
import 'package:pharmalink/features/main/reminders/logic/cubit/reminders_cubit.dart';

List<Widget> pages = [
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<DoctorsCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<RemindersCubit>(),
      ),

    ],
    child: const HomeScreen(),
  ),
  const LandingPrescriptionScreen(),
  BlocProvider(
    create: (context) => getIt<DrugInteractionCubit>(),
    child: const DrugInteractionScreen(),
  ),
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<AuthCubit>(),
      ),
    ],
    child: const ProfileScreen(),
  ),
];
