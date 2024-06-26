import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/core/widgets/modal_bottom_widget.dart';
import '../../../../../core/enums/drug_state.dart';
import '../../logic/prescription_cubit.dart';
import '../listeners/drug_state_listener.dart';

class ReactivateBoxWidget extends StatelessWidget {
  final int id;
  final DrugState state;

  const ReactivateBoxWidget({
    super.key,
    required this.id,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ModalBottomWidget(
      text: 'Are you sure you want to reactivate this prescription?',
      buttons: [
        DrugStateListener(state: state),
        FormButton(
          onPressed: () =>
              context.read<PrescriptionCubit>().activatePrescription(id),
          width: double.infinity,
          text: 'Reactive !',
          color: context.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
      ],
    );
  }
}
