import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/app_bar.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/widgets/form/form_button.dart';
import '../../../../../core/widgets/form/form_view.dart';
import 'widgets/change_password_bloc_listener.dart';

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
      appBar: AppBarWidget(
        type: AppBarType.withLogoAndTitle,
        title: AppLocalizations.of(context).translate('changePassword'),
      ).build(context),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            Text(
                AppLocalizations.of(context)
                    .translate('changeYourPasswordDesc'),
                style: AppTextStyle.bodyLarge(context)),
            FormView(
              model: changePasswordFields,
              formKey: context.read<ChangePasswordCubit>().formKey,
              decorationType: DecorationType.secondary,
            ),
            FormButton(
              text: AppLocalizations.of(context).translate('update'),
              onPressed: () => changePassword(context),
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
