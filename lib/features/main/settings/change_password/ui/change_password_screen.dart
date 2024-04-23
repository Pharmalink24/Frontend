import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/main/settings/change_password/ui/widgets/change_password_bloc_listener.dart';

import '../data/models/change_password_fields.dart';
import '../logic/cubit/change_password_cubit.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize controllers
    changePasswordFields["currentPassword"]!.controller =
        context.read<ChangePasswordCubit>().oldPasswordController;
    changePasswordFields["newPassword"]!.controller =
        context.read<ChangePasswordCubit>().newPasswordController;
    changePasswordFields["confirmPassword"]!.controller =
        context.read<ChangePasswordCubit>().confirmPasswordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: AppColors.secondaryText,
        ),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          'Change Password',
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            Text(
              "Please Enter your current password and new password to update your password.",
              style: AppTextStyle.bodyLarge.copyWith(
                color: AppColors.secondaryText,
              ),
            ),
            FormView(
              model: changePasswordFields,
              formKey: context.read<ChangePasswordCubit>().formKey,
              decorationType: DecorationType.secondary,
            ),
            FormButton(
              text: "Update password",
              onPressed: () => changePassword(context),
              color: AppColors.primary,
              borderRadius: 12.0,
            ),
            ChangePasswordBlocListener(),
          ],
        ),
      ),
    );
  }

  void changePassword(BuildContext context) {
    if (context.read<ChangePasswordCubit>().formKey.currentState!.validate()) {
      context.read<ChangePasswordCubit>().emitChangePassword();
    }
  }
}
