import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/enums/drug_state.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/models/prescription1.dart';
import '../logic/cubit/prescription_state.dart';
import 'widgets/doctor_prescription_card.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../logic/cubit/prescription_cubit.dart';

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
        const Icon(
          Icons.featured_play_list_rounded,
          size: 80,
          color: AppColors.accent5,
        ),
        Center(
          child: Text(
            AppLocalizations.of(context).translate('noPrescriptionsFound'),
            textAlign: TextAlign.center,
            style: AppTextStyle.headlineSmall(context).copyWith(
              color: AppColors.secondaryText,
            ),
          ),
        ),
      ],
    );
  }

  // This method is used to build the list of prescriptions
  Widget _buildPrescriptionsList(List<Prescription1> prescriptions) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: prescriptions.length,
      itemBuilder: (context, index) {
        return DoctorPrescriptionCard(
          prescription: prescriptions[index],
          state: widget.state,
        );
      },
    );
  }

  // This method is used to build the success widget
  Widget _buildSuccessWidget(List<Prescription1> prescriptions) {
    return prescriptions.isEmpty
        ? _buildNoPrescriptionsFound()
        : _buildPrescriptionsList(prescriptions);
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
      backgroundColor: AppColors.primaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          AppLocalizations.of(context).isEnLocale
              ? '${widget.state.value.toString().capitalize()} Drugs'
              : 'الأدوية ال${widget.state.valueInArabic}',
          style: AppTextStyle.displayMedium(context).copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
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
              var prescriptions = state.data;
              return _buildSuccessWidget(prescriptions);
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
