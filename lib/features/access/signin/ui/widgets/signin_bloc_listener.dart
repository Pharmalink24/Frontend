import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/signin_response.dart';
import '../../logic/cubit/signin_cubit.dart';
import '../../logic/cubit/signin_state.dart';

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
          error,
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

  void showSuccess(BuildContext context, SigninResponse signinResponse) async {
    context.pop();
    context.pushNamed(Routes.mainScreen);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
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
