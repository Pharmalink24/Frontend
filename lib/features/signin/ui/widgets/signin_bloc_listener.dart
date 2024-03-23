import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/signin/logic/cubit/signin_cubit.dart';
import 'package:pharmalink/features/signin/logic/cubit/signin_state.dart';

class SigninBlocListener extends StatelessWidget {
  const SigninBlocListener({super.key});

  // Show loading indicator dialog
  void showLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.secondary,
        ),
      ),
    );
  }

  // Show error indicator dialog
  void showError(BuildContext context, String error) {
    print("${error}");
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error == " " ? error : "Unexpected error!\nPlease try again.",
          style: AppTextStyle.titleLarge,
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              "Got it",
              style: AppTextStyle.labelLarge.copyWith(
                color: AppColors.alternateText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showSuccess(BuildContext context) {
    context.pop();
    // context.pushNamed(Routes.patientScreen);
    context.pushReplacementNamed(Routes.patientScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () => showLoading(context),
          success: (signinResponse) => showSuccess(context),
          error: (error) => showError(context, error),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
