import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/signin_response.dart';
import '../../logic/cubit/signin_cubit.dart';
import '../../logic/cubit/signin_state.dart';

class SigninBlocListener extends StatelessWidget {
  SigninBlocListener({super.key});

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
    _loadingOverlay.hide();
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
