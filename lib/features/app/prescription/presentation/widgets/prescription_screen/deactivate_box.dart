import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../../../shared/domain/entities/enums/drug_state.dart';
import '../../../../../../shared/presentation/widgets/form/form_button.dart';
import '../../../../../../shared/presentation/widgets/modal_bottom_widget.dart';
import '../../logic/prescription_cubit.dart';
import 'listeners/drug_state_listener.dart';

class DeactivateBoxWidget extends StatelessWidget {
  final int id;
  final DrugState state;

  const DeactivateBoxWidget({
    super.key,
    required this.id,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ModalBottomWidget(
      text: 'Why do you want to deactivate your prescription?',
      buttons: [
        DrugStateListener(state: state),
        FormButton(
          onPressed: () =>
              context.read<PrescriptionCubit>().reactivatePrescription(id),
          width: double.infinity,
          height: 45,
          text: 'I activated it by mistake.',
          color: context.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
        FormButton(
          onPressed: () =>
              context.read<PrescriptionCubit>().deactivatePrescription(id),
          width: double.infinity,
          height: 45,
          text: 'Doctor\'s orders.',
          color: context.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 8.0),
        ),
      ],
    );
  }
}
