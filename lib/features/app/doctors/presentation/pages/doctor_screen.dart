// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/features/app/doctors/presentation/logic/doctors_cubit.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../widgets/doctor_widget.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class DoctorScreen extends StatelessWidget {
  final int id;

  const DoctorScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DoctorsCubit>(),
      child: DoctorWidget(id: id),
    );
  }
}
