import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/access/sign/ui/widgets/form_tab.dart';
import '../../../../core/theme/app_bar.dart';
import '../../../../core/widgets/terms_and_conditions_text.dart';
import 'widgets/signin_bloc_listener.dart';
import 'widgets/signup_bloc_listener.dart';

class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.colorScheme.primaryContainer,
        appBar: const AppBarWidget(
          type: AppBarType.withoutTitle,
          isCentered: true,
        ).build(context),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              children: [
                const Expanded(
                  child: FormTab(),
                ),
                const TermsAndConditionsText(),
                SigninBlocListener(),
                SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
