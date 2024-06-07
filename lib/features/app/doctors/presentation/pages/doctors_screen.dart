import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../logic/doctors_cubit.dart';
import 'package:auto_route/auto_route.dart';
import '../widgets/doctors_widget.dart';

@RoutePage()
class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorsCubit>(),
      child: const DoctorsWidget(),
    );
  }
}
