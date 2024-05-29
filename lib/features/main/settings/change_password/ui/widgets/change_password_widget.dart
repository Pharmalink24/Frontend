import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/theme/app_bar.dart';
import '../../../../../../core/theme/styles.dart';
import '../../../../../../core/widgets/form/form_button.dart';
import '../../../../../../core/widgets/form/form_view.dart';
import 'change_password_bloc_listener.dart';
import '../../data/models/change_password_fields.dart';
import '../../logic/cubit/change_password_cubit.dart';

class ChangePasswordWidget extends StatefulWidget {
  const ChangePasswordWidget({super.key});

  @override
  State<ChangePasswordWidget> createState() => _ChangePasswordWidgetState();
}

class _ChangePasswordWidgetState extends State<ChangePasswordWidget> {
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
        type: AppBarType.withoutLogo,
        title: AppLocalizations.of(context).translate('changePassword'),
        automaticallyImplyLeading: true,
      ).build(context),
      body: SafeArea(
        child: ListView(
          padding:
              const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            Text(
              AppLocalizations.of(context)
                  .translate('changeYourPasswordDesc'),
              style: AppTextStyle.bodyLarge(context),
            ),
            const SizedBox(height: 24.0),
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
