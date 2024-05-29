import 'package:flutter/material.dart';
import 'package:pharmalink/features/access/sign/logic/signin_cubit/signin_cubit.dart';

import '../../../../../../core/di/dependency_injection.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/form/form_button.dart';
import '../../../../../../core/widgets/form/form_view.dart';
import '../../../data/models/signup/signup_fields.dart';
import '../../../logic/signup_cubit/signup_cubit.dart';
import '../signup_bloc_listener.dart';
import '../welcome_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class SignupBody extends StatefulWidget {
  const SignupBody({super.key});

  @override
  State<SignupBody> createState() => _SignupBodyState();
}

class _SignupBodyState extends State<SignupBody> {
  @override
  void initState() {
    super.initState();
    _initSignupControllers();
  }

  void _initSignupControllers() {
    // Initialize controllers
    signUpFields["fname"]!.controller =
        context.read<SignupCubit>().fnameController;
    signUpFields["lname"]!.controller =
        context.read<SignupCubit>().lnameController;
    signUpFields["username"]!.controller =
        context.read<SignupCubit>().usernameController;
    signUpFields["password"]!.controller =
        context.read<SignupCubit>().passwordController;
    signUpFields["confirmPassword"]!.controller =
        context.read<SignupCubit>().confirmPasswordController;
    signUpFields["email"]!.controller =
        context.read<SignupCubit>().emailController;
    signUpFields["phone"]!.controller =
        context.read<SignupCubit>().phoneController;
    signUpFields["birthdate"]!.controller =
        context.read<SignupCubit>().birthdateController;
    signUpFields["gender"]!.controller =
        context.read<SignupCubit>().genderController;
  }

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
          SignupBlocListener(),
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
