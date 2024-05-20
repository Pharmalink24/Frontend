import 'package:flutter/material.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/form/form_button.dart';
import '../../../../../../core/widgets/form/form_view.dart';
import '../../../data/models/signup/signup_fields.dart';
import '../../../logic/signup_cubit/signup_cubit.dart';
import '../welcome_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBody extends StatelessWidget {
  const SignupBody({super.key});

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
            formKey: context.read<SignupCubit>().formKey,
            model: signUpFields,
          ),
          FormButton(
            text: AppLocalizations.of(context).translate('signUp'),
            onPressed: () => validationThenSignup(context),
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
        ],
      ),
    );
  }

  void validationThenSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
