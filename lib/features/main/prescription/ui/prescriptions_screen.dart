import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/features/main/prescription/data/models/prescription_drugs.dart';
import '../../../../core/enums/drug_state.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/localization/app_localizations.dart';
import '../data/models/prescription_doctor.dart';
import '../logic/prescription_state.dart';
import 'widgets/doctor_prescription_card.dart';
import '../../../../core/theme/styles.dart';
import '../logic/prescription_cubit.dart';

class PrescriptionsScreen extends StatefulWidget {
  final DrugState state;

  const PrescriptionsScreen({
    super.key,
    required this.state,
  });

  @override
  State<PrescriptionsScreen> createState() => _PrescriptionsScreenState();
}

class _PrescriptionsScreenState extends State<PrescriptionsScreen> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<PrescriptionCubit>(context).loadPrescriptions(widget.state);
  }

  // This method is used to build the no prescriptions found widget
  Widget _buildNoPrescriptionsFound() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.featured_play_list_rounded,
          size: 80,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noPrescriptionsFound'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
          ),
        ),
      ],
    );
  }

  // This method is used to build the list of prescriptions
  Widget _buildPrescriptionsList(
      List<PrescriptionDoctor> doctors, List<PrescriptionDrugs> drugs) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return DoctorPrescriptionCard(
          doctor: doctors[index],
          drugs: drugs[index],
          state: widget.state,
        );
      },
    );
  }

  // This method is used to build the success widget
  Widget _buildSuccessWidget(
      List<PrescriptionDoctor> doctors, List<PrescriptionDrugs> drugs) {
    return doctors.isEmpty
        ? _buildNoPrescriptionsFound()
        : _buildPrescriptionsList(doctors, drugs);
  }

  // This method is used to build the error widget
  Widget _buildErrorWidget(String message) {
    return Center(
      child: Text(message),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: AppBarType.withoutLogo,
        title: AppLocalizations.of(context).isEnLocale
            ? '${widget.state.value.toString().capitalize()} Drugs'
            : 'الأدوية ال${widget.state.valueInArabic}',
        automaticallyImplyLeading: true,
      ).build(context),
      body: SafeArea(
        child: BlocBuilder<PrescriptionCubit, PrescriptionState>(
          buildWhen: (previous, current) =>
              current is Loading ||
              current is PrescriptionsLoaded ||
              current is Error,
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PrescriptionsLoaded) {
              var prescriptionsDoctors = state.doctors;
              var prescriptionsDrugs = state.drugs;
              return _buildSuccessWidget(
                  prescriptionsDoctors, prescriptionsDrugs);
            } else if (state is Error) {
              return _buildErrorWidget(state.message);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
