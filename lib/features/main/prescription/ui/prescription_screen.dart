import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/enums/drug_state.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/models/doctor_info.dart';
import 'package:pharmalink/core/models/prescription_info.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:pharmalink/core/routes/routes.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/features/main/prescription/logic/cubit/prescription_cubit.dart';
import 'package:pharmalink/features/main/prescription/ui/widgets/activate_box.dart';
import '../logic/cubit/prescription_state.dart';
import 'widgets/drug_card.dart';
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

  Center getLoadingIndicator(ImageChunkEvent loadingProgress) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.secondary,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }

  Widget buildSuccessWidget(PrescriptionInfo prescription) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          AppLocalizations.of(context).translate('prescription'),
          style: AppTextStyle.displayMedium(context).copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 24),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxWidth: 750,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(
                      0,
                      2,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.doctorScreen,
                                argument: widget.id);
                          },
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.network(
                                  widget.doctor.image != null
                                      ? "${ApiConstants.baseUrl}${widget.doctor.image}"
                                      : '${AppPaths.images}/doctor_placeholder.png',
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return getLoadingIndicator(loadingProgress);
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object error, StackTrace? stackTrace) {
                                    return Image.asset(
                                      '${AppPaths.images}/doctor_placeholder.png',
                                    );
                                  },
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(-1, 0),
                                          child: Text(
                                            '${AppLocalizations.of(context).translate("dr")} ${widget.doctor.firstName} ${widget.doctor.lastName}',
                                            style: AppTextStyle.titleLarge(
                                                context),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 4, 0, 12),
                                          child: Text(
                                            "${prescription.date} - ${prescription.time}",
                                            style: AppTextStyle.labelMedium(
                                                context),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            ),
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 750),
                decoration: BoxDecoration(
                  color: AppColors.primaryBackground,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(
                        0,
                        2,
                      ),
                    )
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: prescription.drugs.entries
                            .map(
                              (entry) => DrugCard(
                                tradeName: entry.key,
                                drugInfo: entry.value,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: _buildNavigationBar(widget.drugState),
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
            color: AppColors.primary,
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
            color: AppColors.error,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrescriptionCubit, PrescriptionState>(
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
    );
  }
}
