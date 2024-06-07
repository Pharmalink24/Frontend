import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injection.dart';
import '../logic/cubit/drug_interaction_cubit.dart';
import 'drug_interaction_widget.dart';

@RoutePage()
class DrugInteractionScreen extends StatelessWidget {
  const DrugInteractionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DrugInteractionCubit>(),
      child: const DrugInteractionWidget(),
    );
  }
}
