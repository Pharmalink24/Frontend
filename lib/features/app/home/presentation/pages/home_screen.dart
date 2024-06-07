import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/app/doctors/presentation/logic/doctors_cubit.dart';
import 'package:pharmalink/features/app/reminders/presentation/logic/reminders_cubit.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../profile/presentation/logic/profile_cubit.dart';
import 'home_widget.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
      child: const HomeWidget(),
    );
  }
}
