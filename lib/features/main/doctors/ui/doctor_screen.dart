// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/models/doctor_info.dart';
import 'package:pharmalink/core/widgets/app_shimmer.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_cubit.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/doctors/ui/widgets/about_container.dart';
import '../logic/cubit/doctors_state.dart';
import 'widgets/doctor_image.dart';
import 'widgets/doctor_name.dart';

class DoctorScreen extends StatefulWidget {
  final int id;

  const DoctorScreen({
    super.key,
    required this.id,
  });

  @override
  State<DoctorScreen> createState() => _DoctorScreenState();
}

class _DoctorScreenState extends State<DoctorScreen> {
  @override
  void initState() {
    super.initState();

    // Fetch the doctor profile
    context.read<DoctorsCubit>().emitDoctorProfile(widget.id);
  }

  Widget _buildDoctorProfile(DoctorInfo doctor) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DoctorName(
          firstName: doctor.firstName,
          lastName: doctor.lastName,
        ),
        DoctorImage(image: doctor.image),
        AboutContainer(
          university: doctor.university,
          degree: doctor.degree,
          brief: doctor.brief,
        )
      ],
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(
        error,
        style: AppTextStyle.bodyMedium(context).copyWith(
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return const AppShimmer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DoctorName(),
          DoctorImage(),
          AboutContainer(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('doctor_profile'),
          style: AppTextStyle.displayMedium(context).copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: BlocBuilder<DoctorsCubit, DoctorsState>(
        builder: (context, state) {
          if (state is Loading) {
            return _buildLoading();
          } else if (state is Success) {
            return _buildDoctorProfile(state.data);
          } else if (state is Error) {
            return _buildError(state.error);
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
