import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/app/prescription/presentation/widgets/prescriptions_screen/prescriptions_widget.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../shared/domain/entities/enums/drug_state.dart';
import '../logic/prescription_cubit.dart';

@RoutePage()
class PrescriptionsScreen extends StatelessWidget {
  final DrugState state;

  const PrescriptionsScreen({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PrescriptionCubit>(),
      child: PrescriptionsWidget(state: state),
    );
  }
}
