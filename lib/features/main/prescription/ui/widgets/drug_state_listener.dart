import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/features/main/prescription/logic/prescription_state.dart';

import '../../../../../core/enums/drug_state.dart';
import '../../../../../core/models/message.dart';
import '../../../../../core/routes/routes.dart';
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
            onPressed: () {
              context.pop();
            },
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
        title: const Text('Success'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
              context.pop();
              context.pushReplacementNamed(Routes.prescriptionsScreen, argument: state);
            },
            child: const Text('OK'),
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
          current is ActivateDrugError ||
          current is ActivateDrugSuccess ||
          current is ActivateDrugLoading ||
          current is DeactivateDrugError ||
          current is DeactivateDrugSuccess ||
          current is DeactivateDrugLoading,
      listener: (context, state) {
        if (state is ActivateDrugError) {
          _showErrorDialog(context, state.message);
        } else if (state is ActivateDrugSuccess) {
          var data = state.message as Message;
          _showSuccessDialog(context, data.message);
        } else if (state is ActivateDrugLoading) {
          _showLoading(context);
        } else if (state is DeactivateDrugError) {
          _showErrorDialog(context, state.message);
        } else if (state is DeactivateDrugSuccess) {
          var data = state.message as Message;

          _showSuccessDialog(context, data.message);
        } else if (state is DeactivateDrugLoading) {
          _showLoading(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
