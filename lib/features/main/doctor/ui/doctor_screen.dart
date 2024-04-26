import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'package:pharmalink/features/main/doctor/data/models/doctor_profile.dart';

import '../logic/cubit/doctor_cubit.dart';
import '../logic/cubit/doctor_state.dart';

class DoctorScreen extends StatefulWidget {
  final int doctorId;
  const DoctorScreen({super.key, required this.doctorId});

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().emitDoctorProfile(widget.doctorId);
  }

  Widget buildDoctorProfile(BuildContext context, DoctorProfile doctor) {
    return CardContainer(
      children: [
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(doctor.image),
        ),
        const SizedBox(height: 20),
        Text(
          '${doctor.fname} ${doctor.lname}',
          style: AppTextStyle.headlineMedium,
        ),
        const SizedBox(height: 10),
        Text(
          doctor.specialization,
          style: AppTextStyle.bodyMedium.copyWith(
            color: AppColors.secondaryText,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          doctor.brief,
          style: AppTextStyle.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text(
          'Phone: ${doctor.phone}',
          style: AppTextStyle.bodyMedium,
        ),
        const SizedBox(height: 20),
        Text(
          'Email: ${doctor.email}',
          style: AppTextStyle.bodyMedium,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget buildNoDataWidget() {
    return Column(
      children: [
        const Icon(
          Icons.person_add_alt_1_rounded,
          size: 80,
          color: AppColors.accent5,
        ),
        Center(
          child: Text(
            'Your doctors list is empty.',
            style: AppTextStyle.headlineSmall.copyWith(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildErrorWidget(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 50,
              color: AppColors.error,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: AppTextStyle.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<DoctorCubit>().emitDoctorProfile(widget.doctorId);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
              ),
              child: Text(
                'Retry',
                style: AppTextStyle.bodySmall.copyWith(
                  color: AppColors.accent5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          'Your Doctors',
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: SafeArea(
        child: BlocBuilder<DoctorCubit, DoctorState>(
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingIndicator();
            } else if (state is Success) {
              return buildDoctorProfile(context, state.data);
            } else if (state is Error) {
              return buildErrorWidget(context, state.error);
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
