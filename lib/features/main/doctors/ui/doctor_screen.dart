// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/helpers/constants/paths.dart';
import 'package:pharmalink/core/models/doctor_info.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/features/main/doctors/logic/cubit/doctors_cubit.dart';
import 'package:pharmalink/features/main/prescription/ui/landing_prescription_screen.dart';
// Components Packages
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../logic/cubit/doctors_state.dart';



class DoctorScreen extends StatefulWidget {
  final int id;

  const DoctorScreen({
    super.key,
    required this.id,
  });

  @override
  _DoctorScreenState createState() => _DoctorScreenState();
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
        Align(
          alignment: const AlignmentDirectional(0, 0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
            child: Text(
              'Dr. ${doctor.firstName} ${doctor.lastName}',
              style: AppTextStyle.headlineLarge(context).copyWith(
                fontFamily: AppFonts.getFont(context, Font.secondary),
              ),
            ),
          ),
        ),
        Flexible(
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Container(
              width: 330,
              height: 274,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(
                      0,
                      2,
                    ),
                    spreadRadius: 2,
                  )
                ],
                gradient: const LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                  stops: [0, 1],
                  begin: AlignmentDirectional(0, -1),
                  end: AlignmentDirectional(0, 1),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: const AlignmentDirectional(0, 0),
              child: Align(
                alignment: const AlignmentDirectional(0, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    doctor.image != null
                        ? "${ApiConstants.baseUrl}${doctor.image}"
                        : '${AppPaths.images}/doctor_placeholder.png',
                    width: double.infinity,
                    height: double.infinity,
                    // fit: BoxFit.scaleDown,
                    fit: BoxFit.contain,

                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return _getLoadingIndicator(loadingProgress);
                    },
                    errorBuilder: (BuildContext context, Object error,
                        StackTrace? stackTrace) {
                      return Image.asset(
                        '${AppPaths.images}/doctor_placeholder.png',
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
          child: Container(
            width: double.infinity,
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
                  spreadRadius: 2,
                )
              ],
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                      child: Text(
                        'About',
                        style: AppTextStyle.bodyLarge(context).copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Text(
                      doctor.degree!,
                      style: AppTextStyle.bodyMedium(context),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Text(
                      'M.D. ${doctor.university}',
                      style: AppTextStyle.bodyMedium(context),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                      child: Text(
                        doctor.brief ?? 'No brief available',
                        style: AppTextStyle.labelMedium(context),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LandingPrescriptionScreen()),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(
                                0,
                                2,
                              ),
                              spreadRadius: 2,
                            )
                          ],
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                            stops: [0, 1],
                            begin: AlignmentDirectional(0, -1),
                            end: AlignmentDirectional(0, 1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 12, 0, 12),
                                    child: Icon(
                                      FontAwesomeIcons.whatsapp,
                                      color: AppColors.secondaryBackground,
                                      size: 24,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 12, 0),
                                    child: Text(
                                      'Chat',
                                      style: AppTextStyle.bodyMedium(context).copyWith(
                                        color: AppColors.secondaryBackground,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(
        error,
        style: AppTextStyle.bodyMedium(context).copyWith(
          color: AppColors.error,
        ),
      ),
    );
  }

  Center _getLoadingIndicator(ImageChunkEvent loadingProgress) {
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

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColors.secondaryText),
        backgroundColor: AppColors.primaryBackground,
        title: Text(
          'Doctor Profile',
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
