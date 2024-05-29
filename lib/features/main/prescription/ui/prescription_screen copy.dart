import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/enums/drug_state.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../doctors/data/models/doctor_info.dart';
import '../data/models/prescription_drugs.dart';
import '../../../../core/theme/app_bar.dart';
import '../../../../core/theme/styles.dart';
import '../logic/prescription_cubit.dart';
import 'widgets/activate_box.dart';
import 'widgets/drug_state_listener.dart';
import 'widgets/prescription_header_card.dart';
import 'widgets/drugs_list_card.dart';
import 'widgets/ff_button_widget.dart';
import 'widgets/deactivate_box.dart';

import 'package:auto_route/auto_route.dart';

@RoutePage()
class PrescriptionScreen extends StatelessWidget {
  final int id;
  final DoctorInfo doctor;
  final PrescriptionDrugs drugs;
  final DrugState drugState;

  const PrescriptionScreen({
    super.key,
    required this.id,
    required this.doctor,
    required this.drugs,
    required this.drugState,
  });

  Widget buildPrescriptionLayout(PrescriptionDrugs prescription) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          PrescriptionHeaderCard(
            id: doctor.id,
            doctorImage: doctor.image,
            doctorFirstName: doctor.firstName,
            doctorLastName: doctor.lastName,
            date: prescription.date,
            time: prescription.time,
          ),
          DrugsListCard(
            prescriptionId: id,
            drugs: prescription.drugs,
          ),
          // OtherInfoCard(
          // ),

          DrugStateListener(state: drugState)
        ],
      ),
    );
  }

  Widget? _buildNavigationBar(BuildContext context, DrugState drugState) {
    // Check if the drug is inactive
    if (drugState == DrugState.INACTIVE) {
      return null;
    } else {
      return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: FFButtonWidget(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: const Color(0x15000000),
              enableDrag: false,
              context: context,
              builder: (context) {
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: drugState == DrugState.ACTIVE
                      ? DeactivateBoxWidget(id: id)
                      : ActivateBoxWidget(id: id),
                );
              },
            );
          },
          text: drugState == DrugState.ACTIVE
              ? AppLocalizations.of(context).translate('deactivate')
              : AppLocalizations.of(context).translate('activate'),
          options: FFButtonOptions(
            width: double.infinity,
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: context.colorScheme.primary,
            textStyle: AppTextStyle.titleSmall(context),
            elevation: 3,
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        type: AppBarType.withoutLogo,
        title: AppLocalizations.of(context).translate('prescription'),
        automaticallyImplyLeading: true,
      ).build(context),
      body: SafeArea(
        child: BlocProvider<PrescriptionCubit>(
          create: (context) => getIt<PrescriptionCubit>(),
          child: buildPrescriptionLayout(drugs),
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(context, drugState),
    );
  }
}
