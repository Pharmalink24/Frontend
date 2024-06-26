import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../core/widgets/loading/loading_overlay.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/signin/signin_response.dart';
import '../../logic/signin_cubit/signin_cubit.dart';
import '../../logic/signin_cubit/signin_state.dart';

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

  void showSuccess(BuildContext context, SigninResponse signinResponse) async {
    _loadingOverlay.hide();
    // Redirect to main route
    context.pushRoute(const MainRoute());
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
