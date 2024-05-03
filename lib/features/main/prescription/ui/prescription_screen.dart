import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/drug_state.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/models/doctor_info.dart';
import '../../../../core/models/prescription_info.dart';
import '../../../../core/theme/styles.dart';
import '../logic/cubit/prescription_cubit.dart';
import 'widgets/activate_box.dart';
import 'widgets/prescription_header_card.dart';
import '../logic/cubit/prescription_state.dart';
import 'widgets/drugs_list_card.dart';
import 'widgets/ff_button_widget.dart';
import 'widgets/deactivate_box.dart';

class PrescriptionScreen extends StatefulWidget {
  final int id;
  final DoctorInfo doctor;
  final DrugState drugState;

  const PrescriptionScreen({
    super.key,
    required this.id,
    required this.doctor,
    required this.drugState,
  });

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  double otherWidgetsHeight = 0.0; // Initialize with zero
  double height = 0;

  @override
  void initState() {
    super.initState();

    // Load the prescription data
    BlocProvider.of<PrescriptionCubit>(context).loadPrescription(widget.id);
  }

  Widget buildSuccessWidget(PrescriptionInfo prescription) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          PrescriptionHeaderCard(
            id: widget.doctor.id,
            doctorImage: widget.doctor.image,
            doctorFirstName: widget.doctor.firstName,
            doctorLastName: widget.doctor.lastName,
            date: prescription.date,
            time: prescription.time,
          ),
          DrugsListCard(
            drugs: prescription.drugs,
          ),
        ],
      ),
    );
  }

  Widget? _buildNavigationBar(DrugState drugState) {
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
                      ? DeactivateBoxWidget(id: widget.id)
                      : ActivateBoxWidget(id: widget.id),
                );
              },
            ).then((value) => setState(() {}));
          },
          text: drugState == DrugState.ACTIVE
              ? AppLocalizations.of(context).translate('deactivate')
              : AppLocalizations.of(context).translate('activate'),
          options: FFButtonOptions(
            width: double.infinity,
            height: 40,
            padding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: Theme.of(context).colorScheme.primary,
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

  Widget buildErrorWidget(error) {
    return Scaffold(
      body: Center(
        child: Text(
          error,
          style: AppTextStyle.titleLarge(context).copyWith(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('prescription'),
          style: AppTextStyle.displayMedium(context).copyWith(
            fontSize: 28,
          ),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<PrescriptionCubit, PrescriptionState>(
          buildWhen: (previous, current) =>
              current is PrescriptionLoaded ||
              current is Loading ||
              current is Error,
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PrescriptionLoaded) {
              return buildSuccessWidget(state.data);
            } else if (state is Error) {
              return buildErrorWidget(state.message);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(widget.drugState),
    );
  }
}
