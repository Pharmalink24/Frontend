import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/models/doctor.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/widgets/card_container.dart';
import 'package:pharmalink/core/widgets/card_container_with_title.dart';
import 'package:pharmalink/core/widgets/doctor_card.dart';
import 'package:pharmalink/core/widgets/loading_indicator.dart';
import 'package:pharmalink/features/main/profile/logic/cubit/profile_cubit.dart';

import '../logic/cubit/doctors_cubit.dart';
import '../logic/cubit/doctors_state.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({
    super.key,
  });

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  @override
  initState() {
    super.initState();

    // Get doctors list
    context.read<DoctorsCubit>().emitDoctorsList();
  }

  Widget buildListOfDoctorsWidget(BuildContext context, List<Doctor> doctors) {
    return Expanded(
      child: SizedBox(
        height: 500,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.zero,
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            return DoctorCard(
              doctors[index],
              width: 200,
              height: 150,
              titleFontSize: 28.0,
              subTitleFontSize: 18.0,
              outerPadding: const EdgeInsetsDirectional.symmetric(
                vertical: 10.0,
              ),
              innerPadding: const EdgeInsetsDirectional.only(
                start: 20,
                end: 10,
              ),
            );
          },
        ),
      ),
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

  Widget buildSuccessWidget(BuildContext context, List<Doctor> doctors) {
    return CardContainer(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        doctors.isEmpty
            ? buildNoDataWidget()
            : buildListOfDoctorsWidget(context, doctors),
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
                context.read<ProfileCubit>().getUserProfile();
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
        child: BlocBuilder<DoctorsCubit, DoctorsState>(
          builder: (context, state) {
            if (state is Loading) {
              return const LoadingIndicator();
            } else if (state is Success) {
              return buildSuccessWidget(context, state.data);
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
