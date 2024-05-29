import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../logic/cubit/edit_profile_cubit.dart';
import 'widgets/edit_profile_widget.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditProfileCubit>(),
      child: const EditProfileWidget(),
    );
  }
}
