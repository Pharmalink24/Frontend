import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/Blocs/theme/theme_cubit.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../access/auth/logic/cubit/auth_cubit.dart';
import '../../../doctors/logic/cubit/doctors_cubit.dart';
import '../../../drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import '../../../drug_interaction/ui/drug_interaction_screen.dart';
import '../../../home/ui/home_screen.dart';
import '../../../prescription/ui/landing_prescription_screen.dart';
import '../../../profile/logic/cubit/profile_cubit.dart';
import '../../../profile/ui/profile_screen.dart';
import '../../../reminders/logic/cubit/reminders_cubit.dart';

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
