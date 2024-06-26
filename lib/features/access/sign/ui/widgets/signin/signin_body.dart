import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/widgets/form/form_button.dart';
import '../../../../../../core/widgets/form/form_view.dart';
import '../../../data/models/signin/signin_fields.dart';
import '../../../logic/signin_cubit/signin_cubit.dart';
import '../forget_password_text.dart';
import '../signin_bloc_listener.dart';
import '../welcome_text.dart';

class SigninBody extends StatefulWidget {
  const SigninBody({super.key});

  @override
  State<SigninBody> createState() => _SigninBodyState();
}

class _SigninBodyState extends State<SigninBody> {
  @override
  void initState() {
    super.initState();
    _initSignInControllers();
  }

  void _initSignInControllers() {
    // Initialize controllers
    signInFields["email"]!.controller =
        context.read<SigninCubit>().emailController;
    signInFields["password"]!.controller =
        context.read<SigninCubit>().passwordController;
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
            formKey: context.read<SigninCubit>().formKey,
            model: signInFields,
          ),
          const ForgetPasswordText(),
          FormButton(
            text: AppLocalizations.of(context).translate('signIn'),
            onPressed: () => validationThenSignin(context),
            padding: const EdgeInsets.symmetric(vertical: 12.0),
          ),
          SigninBlocListener(),
        ],
      ),
    );
  }

  void validationThenSignin(BuildContext context) {
    if (context.read<SigninCubit>().formKey.currentState!.validate()) {
      context.read<SigninCubit>().signin();
    }
  }
}
