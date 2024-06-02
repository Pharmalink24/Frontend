import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/access/sign/logic/signin_cubit/signin_cubit.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../settings/edit_profile/logic/cubit/edit_profile_cubit.dart';
import '../logic/profile_cubit/profile_cubit.dart';
import 'profile_widget.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProfileCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<EditProfileCubit>(),
        ),
      ],
      child: const ProfileWidget(),
    );
  }
}
