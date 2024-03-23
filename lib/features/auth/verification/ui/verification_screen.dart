// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/features/auth/verification/data/models/verification_request_params.dart';
import 'package:pharmalink/features/auth/verification/logic/cubit/verification_cubit.dart';
import 'package:pharmalink/features/auth/verification/ui/widgets/email_text.dart';
import 'package:pharmalink/features/auth/verification/ui/widgets/just_click_text.dart';
import 'package:pharmalink/features/auth/verification/ui/widgets/please_verify_text.dart';
import 'package:pharmalink/features/auth/verification/ui/widgets/still_cant_find_text.dart';
import 'package:pharmalink/features/auth/verification/ui/widgets/verification_bloc_listener.dart';

class VerificationScreen extends StatelessWidget {
  final String email;
  final int userId;

  const VerificationScreen({
    super.key,
    required this.email,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const PleaseVerifyText(),
              EmailText(email: email),
              const JustClickText(),
              const StillCantFindText(),
              FormButton(
                text: "Resend Verification Email",
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                onPressed: () => sendVerification(context),
              ),
              FormButton(
                text: "Sign in",
                padding: EdgeInsets.zero,
                onPressed: () => context.pushNamed(Routes.signInScreen),
              ),
              const VerificationBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void sendVerification(BuildContext context) {
    context
        .read<VerificationCubit>()
        .emitVerificationStates(VerificationRequestParams(userId: userId));
  }
}
