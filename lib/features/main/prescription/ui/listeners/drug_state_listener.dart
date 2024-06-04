import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/routes/app_router.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/prescription/logic/prescription_state.dart';
import '../../../../../core/enums/drug_state.dart';
import '../../../../../core/widgets/loading/loading_overlay.dart';
import '../../logic/prescription_cubit.dart';

class DrugStateListener extends StatelessWidget {
  final DrugState state;
  DrugStateListener({super.key, required this.state});

  final LoadingOverlay _loadingOverlay = LoadingOverlay();

  void _showErrorDialog(BuildContext context, String error) {
    _loadingOverlay.hide();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(error),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    _loadingOverlay.hide();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Success',
          style: AppTextStyle.headlineLarge(context),
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              context.maybePop();
              context.navigateTo(
                const MainPrescriptionRoute(),
              );
            },
            child: Text(
              'Ok',
              style: AppTextStyle.labelLarge(context),
            ),
          ),
        ],
      ),
    );
  }

  // Show loading indicator dialog
  void _showLoading(BuildContext context) {
    _loadingOverlay.show(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PrescriptionCubit, PrescriptionState>(
      listenWhen: (previous, current) =>
          current is StateError ||
          current is StateSuccess ||
          current is StateLoading,
      listener: (context, state) {
        if (state is StateError) {
          var message = state.message;
          _showErrorDialog(context, message);
        } else if (state is StateSuccess) {
          var message = state.message;
          _showSuccessDialog(context, message.message);
        } else if (state is StateLoading) {
          _showLoading(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
