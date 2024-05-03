// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/core/widgets/terms_and_conditions_text.dart';
import 'package:pharmalink/features/access/signin/ui/widgets/welcome_text.dart';
import 'package:pharmalink/features/access/signup/logic/cubit/signup_cubit.dart';
import 'package:pharmalink/features/access/signup/data/models/signup_fields.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/features/access/signup/ui/widgets/signup_tab.dart';
import '../../../../core/widgets/form/form_button.dart';
import 'widgets/signup_bloc_listener.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  void initState() {
    super.initState();

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
    return Scaffold(
      appBar: MyAppBar.withoutLabel(context),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          children: [
            const SignupTab(),
            const WelcomeText(),
            FormView(
              formKey: context.read<SignupCubit>().formKey,
              model: signUpFields,
            ),
            FormButton(
              text: AppLocalizations.of(context).translate('signUp'),
              onPressed: () => validationThenSignup(context),
            ),
            const TermsAndConditionsText(),
            SignupBlocListener(),
          ],
        ),
      ),
    );
  }

  void validationThenSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
