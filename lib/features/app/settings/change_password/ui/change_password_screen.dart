import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/app/settings/change_password/ui/widgets/change_password_widget.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../logic/cubit/change_password_cubit.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChangePasswordCubit>(),
      child: const ChangePasswordWidget(),
    );
  }

  void changePassword(BuildContext context) {
    if (context.read<ChangePasswordCubit>().formKey.currentState!.validate()) {
      context.read<ChangePasswordCubit>().emitChangePassword();
    }
  }
}
