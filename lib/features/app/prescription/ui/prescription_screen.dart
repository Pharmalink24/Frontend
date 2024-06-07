import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/app/prescription/data/models/prescription_info.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../shared/domain/entities/enums/drug_state.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../shared/presentation/widgets/form/form_button.dart';
import '../../doctors/data/models/doctor_info.dart';
import '../../../../core/theme/app_bar.dart';
import '../logic/prescription_cubit.dart';
import 'widgets/activate_box.dart';
import 'listeners/drug_state_listener.dart';
import 'widgets/prescription_screen/diagnosis_card.dart';
import 'widgets/prescription_screen/notes_card.dart';
import 'widgets/prescription_screen/prescription_header_card.dart';
import 'widgets/prescription_screen/drugs_list_card.dart';
import 'widgets/deactivate_box.dart';

import 'package:auto_route/auto_route.dart';

import 'widgets/prescription_screen/tests_card.dart';
import 'widgets/reactivate_box.dart';

@RoutePage()
class PrescriptionScreen extends StatelessWidget {
  final int id;
  final DoctorInfo doctor;
  final PrescriptionInfo prescriptionInfo;
  final DrugState drugState;

  const PrescriptionScreen({
    super.key,
    required this.id,
    required this.doctor,
    required this.prescriptionInfo,
    required this.drugState,
  });

  Widget buildPrescriptionLayout(
      BuildContext context, PrescriptionInfo prescription) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
      child: ListView(
        children: [
          PrescriptionHeaderCard(
            id: doctor.id,
            doctorImage: doctor.image,
            doctorFirstName: doctor.firstName,
            doctorLastName: doctor.lastName,
            date: prescription.date,
            time: prescription.time,
            nextVisit: prescription.nextVisit,
          ),
          DrugsListCard(
            prescriptionId: id,
            drugs: prescription.drugs,
          ),
          DiagnosisCard(diagnosis: prescription.diagnosis),
          NotesCard(notes: prescription.doctorNotes),
          TestsCard(tests: prescription.tests),
          DrugStateListener(state: drugState),
        ],
      ),
    );
  }

  Widget? _buildNavigationBar(
    BuildContext context,
    DrugState drugState,
  ) {
    return FormButton(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 8.0,
      ),
      width: double.infinity,
      borderRadius: 8.0,
      color: context.colorScheme.primary,
      onPressed: () async {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: const Color(0x15000000),
          enableDrag: false,
          context: context,
          builder: (context) {
            return BlocProvider<PrescriptionCubit>(
              create: (context) => getIt<PrescriptionCubit>(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: drugState == DrugState.ACTIVE
                    ? DeactivateBoxWidget(id: id, state: drugState)
                    : drugState == DrugState.INACTIVE
                        ? ReactivateBoxWidget(id: id,state: drugState)
                        : ActivateBoxWidget(id: id,state: drugState),
              ),
            );
          },
        );
      },
      text: drugState == DrugState.ACTIVE
          ? AppLocalizations.of(context).translate('deactivate')
          : drugState == DrugState.INACTIVE
              ? AppLocalizations.of(context).translate('reactivate')
              : AppLocalizations.of(context).translate('activate'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrescriptionCubit>(
      create: (context) => getIt<PrescriptionCubit>(),
      child: Scaffold(
        appBar: AppBarWidget(
          type: AppBarType.withoutLogo,
          title: AppLocalizations.of(context).translate('prescription'),
          automaticallyImplyLeading: true,
        ).build(context),
        body: SafeArea(
          child: buildPrescriptionLayout(context, prescriptionInfo),
        ),
        bottomNavigationBar: _buildNavigationBar(context, drugState),
      ),
    );
  }
}
