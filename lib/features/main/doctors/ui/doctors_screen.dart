import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/localization/app_localizations.dart';
import '../data/models/doctor.dart';
import '../../../../core/theme/app_bar.dart';
import '../../../../core/theme/styles.dart';
import '../../../../core/widgets/card_container.dart';
import '../../../../core/widgets/doctor_card.dart';
import '../../../../core/widgets/loading/loading_indicator.dart';
import '../../profile/logic/cubit/profile_cubit.dart';

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
                end: 0,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildNoDataWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.person_add_alt_1_rounded,
          size: 80,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noDoctorsMessage'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSuccessWidget(BuildContext context, List<Doctor> doctors) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: doctors.isEmpty
          ? buildNoDataWidget()
          : buildListOfDoctorsWidget(context, doctors),
    );
  }

  Widget buildErrorWidget(BuildContext context, String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              size: 50,
              color: Theme.of(context).colorScheme.error,
            ),
            const SizedBox(height: 20),
            Text(
              error,
              style: AppTextStyle.bodyMedium(context),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<ProfileCubit>().getUserProfile();
              },
              child: Text(
                AppLocalizations.of(context).translate('retry'),
                style: AppTextStyle.bodySmall(context),
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
      appBar: AppBarWidget(
        type: AppBarType.withoutLogo,
        title: AppLocalizations.of(context).translate('yourDoctors'),
        automaticallyImplyLeading: true,
      ).build(context),
      body: SafeArea(
        child: BlocBuilder<DoctorsCubit, DoctorsState>(
          buildWhen: (previous, current) =>
              current is Loading || current is Success || current is Error,
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
