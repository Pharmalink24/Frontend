import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/main/settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../chat/logic/cubit/chat_cubit.dart';
import '../../../doctors/logic/cubit/doctors_cubit.dart';
import '../../../drug_interaction/logic/cubit/drug_interaction_cubit.dart';
import '../../../drug_interaction/ui/drug_interaction_screen.dart';
import '../../../home/ui/home_screen.dart';
import '../../../prescription/ui/landing_prescription_screen.dart';
import '../../../profile/logic/profile_cubit/profile_cubit.dart';
import '../../../profile/ui/profile_screen.dart';
import '../../../reminders/logic/reminders_cubit.dart';
import 'package:pharmalink/features/main/chat/ui/all_chats_screen.dart';

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
  BlocProvider(
    create: (context) => getIt<ChatCubit>(),
    child: const ChatsScreen(),
  ), 
  MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
      ),
      BlocProvider(
        create: (context) => getIt<EditProfileCubit>(),
      ),
    ],
    child: const ProfileScreen(),
  ),
];
