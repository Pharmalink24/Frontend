import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../shared/presentation/widgets/loading/loading_overlay.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/signup/signup_response.dart';
import '../../logic/signup_cubit/signup_cubit.dart';
import '../../logic/signup_cubit/signup_state.dart';

class SignupBlocListener extends StatelessWidget {
  SignupBlocListener({super.key});
  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  // Show loading indicator dialog
  void showLoading(BuildContext context) {
    _loadingOverlay.show(context);
  }

  // Show error indicator dialog
  void showError(BuildContext context, String error) {
    _loadingOverlay.hide();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          color: context.colorScheme.error,
          size: 32,
        ),
        content: Text(
          error,
          style: AppTextStyle.titleLarge(context),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: Text(
              "Got it",
              style: AppTextStyle.labelLarge(context).copyWith(
                color: context.colorScheme.onTertiary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSuccess(BuildContext context, SignupResponse signupResponse) {
    _loadingOverlay.hide();
    context.pushRoute(VerificationRoute(
        email: signupResponse.email, userId: signupResponse.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showLoading(context),
          success: (signinResponse) => showSuccess(context, signinResponse),
          error: (error) => showError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
