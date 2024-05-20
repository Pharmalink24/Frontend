import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/form/form_button.dart';
import '../../../../../../core/widgets/form/form_view.dart';
import '../../../../../../core/widgets/terms_and_conditions_text.dart';
import '../../../data/models/signin/signin_fields.dart';
import '../../../logic/signin_cubit/signin_cubit.dart';
import '../forget_password_text.dart';
import '../welcome_text.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeText(),
          FormView(
            formKey: context.read<SigninCubit>().formKey,
            model: signInFields,
          ),
          const ForgetPasswordText(),
          FormButton(
            text: AppLocalizations.of(context).translate('signIn'),
            onPressed: () => validationThenSignin(context),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
          ),
        ],
      ),
    );
  }

  void validationThenSignin(BuildContext context) {
    if (context.read<SigninCubit>().formKey.currentState!.validate()) {
      context.read<SigninCubit>().emitSigninStates();
    }
  }
}
