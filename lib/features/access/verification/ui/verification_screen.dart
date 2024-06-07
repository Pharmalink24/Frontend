// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/shared/presentation/widgets/form/form_button.dart';
import 'package:pharmalink/features/access/verification/data/models/verification_request_params.dart';
import 'package:pharmalink/features/access/verification/logic/cubit/verification_cubit.dart';
import 'package:pharmalink/features/access/verification/ui/widgets/email_text.dart';
import 'package:pharmalink/features/access/verification/ui/widgets/just_click_text.dart';
import 'package:pharmalink/features/access/verification/ui/widgets/please_verify_text.dart';
import 'package:pharmalink/features/access/verification/ui/widgets/still_cant_find_text.dart';
import 'package:pharmalink/features/access/verification/ui/widgets/verification_bloc_listener.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
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
      appBar: const AppBarWidget(
        type: AppBarType.withoutTitle,
      ).build(context),
      body: BlocProvider(
        create: (context) => getIt<VerificationCubit>(),
        child: SafeArea(
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
                  text: AppLocalizations.of(context)
                      .translate('resendVerificationEmail'),
                  padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                  onPressed: () => sendVerification(context),
                ),
                FormButton(
                  text: AppLocalizations.of(context).translate('signIn'),
                  padding: EdgeInsets.zero,
                  onPressed: () => context.pushRoute(const SignRoute()),
                ),
                VerificationBlocListener(),
              ],
            ),
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
