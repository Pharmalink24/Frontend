import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/access/auth/logic/cubit/auth_cubit.dart';
import 'package:pharmalink/features/access/signin/data/models/signin_fields.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/access/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/access/signin/ui/widgets/signin_bloc_listener.dart';
import 'package:pharmalink/core/widgets/terms_and_conditions_text.dart';
import 'widgets/forget_password_text.dart';
import 'widgets/signin_tab.dart';
import 'widgets/welcome_text.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  void initState() {
    super.initState();

    // Initialize controllers
    signInFields["email"]!.controller =
        context.read<SigninCubit>().emailController;
    signInFields["password"]!.controller =
        context.read<SigninCubit>().passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SigninTab(),
                const WelcomeText(),
                FormView(
                  formKey: context.read<SigninCubit>().formKey,
                  model: signInFields,
                ),
                const ForgetPasswordText(),
                FormButton(
                  text: "Sign In",
                  onPressed: () => validationThenSignin(context),
                ),
                const TermsAndConditionsText(),
                const SigninBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validationThenSignin(BuildContext context) {
    if (context.read<SigninCubit>().formKey.currentState!.validate()) {
      context.read<SigninCubit>().emitSigninStates();
    }
  }
}
