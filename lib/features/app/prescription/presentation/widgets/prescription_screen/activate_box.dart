import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/shared/domain/entities/enums/drug_state.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/shared/presentation/widgets/form/form_button.dart';
import 'package:pharmalink/shared/presentation/widgets/modal_bottom_widget.dart';
import '../../logic/prescription_cubit.dart';
import 'listeners/drug_state_listener.dart';

class ActivateBoxWidget extends StatelessWidget {
  final int id;
  final DrugState state;

  const ActivateBoxWidget({
    super.key,
    required this.id,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ModalBottomWidget(
      text: 'Are you sure you want to activate this prescription?',
      buttons: [
        DrugStateListener(state: state),
        FormButton(
          onPressed: () =>
              context.read<PrescriptionCubit>().activatePrescription(id),
          width: double.infinity,
          text: 'Active !',
          color: context.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
      ],
    );
  }
}
