// Flutter Packages
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/prescription/landing_prescription.dart';
// Components Packages
import 'package:pharmalink/features/main/prescription/widgets/doctor_prescription_card.dart';
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:pharmalink/core/networking/networking.dart';
import 'package:pharmalink/core/networking/api_constants.dart';
import 'package:intl/intl.dart';
import'package:font_awesome_flutter/font_awesome_flutter.dart';

String formatDateTime(String dateTimeString) {
  // Parse the date string to DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format you want
  DateFormat dateFormat = DateFormat('on yyyy-MM-dd');

  // Format the DateTime object using the defined format
  String formattedDate = dateFormat.format(dateTime);

  return formattedDate;
}


class DoctorInfoScreen extends StatefulWidget {
  static String url = "/doctor_info";
  final String id;
  final String name;
  final String image;

  const DoctorInfoScreen({
    super.key,
    required this.id,
    required this.name,
    required this.image,
  });


  @override
  _DoctorInfoScreenState createState() =>
      _DoctorInfoScreenState();
}

class _DoctorInfoScreenState extends State<DoctorInfoScreen> {

  late String  fName ;
  late String  lName ;
   String  university = '';
  late String  about = 'information is not available';
  late String  image ;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      API api = API();
      var doctorInfo = await api.GET(
        'doctor/doctors/${widget.id}/',
        200,
        auth: true,
      );

      if (doctorInfo != null) {
        setState(() {
          fName = doctorInfo['fname'];
          lName =  doctorInfo['lname'];
          university=  doctorInfo['university'];
          about= doctorInfo['brief'] ?? 'information is not available';
          image = doctorInfo['image'] != null
              ? '${ApiConstants.baseUrl}${doctorInfo['image']}'
              : 'https://drive.google.com/file/d/1KdhhjQ-zhDq2AAkJ7YgBujT5ykGMebg3/view';


        });
      } else {
        throw "Exception";
      }
    }
    catch (e) {
      // getIt<Logger>().e(e);
    }
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
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 60, 0, 0),
              child: Text(
                'Dr. ${widget.name} ',
                style: AppTextStyle.headlineMedium.copyWith(
                  fontFamily: 'Readex Pro',
                  fontSize: 30,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Flexible(
            child: Align(
              alignment: AlignmentDirectional(0, 0),
              child: Container(
                width: 330,
                height: 274,
                decoration: BoxDecoration(
                  boxShadow: [
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
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.secondary
                    ],
                    stops: [0, 1],
                    begin: AlignmentDirectional(0, -1),
                    end: AlignmentDirectional(0, 1),
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: AlignmentDirectional(0, 0),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.network(
                      widget.image,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.contain,
                      alignment: Alignment(0, 0),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 8),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryBackground,
                boxShadow: [
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
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                        child: Text(
                          'About',
                          style: AppTextStyle.bodyLarge.copyWith(
                            fontFamily: 'Readex Pro',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        'General Practiotioner',
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Text(
                        'M.D. $university',
                        style: AppTextStyle.bodyMedium.copyWith(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 12),
                        child: Text(
                          about,
                          style: AppTextStyle.labelMedium.copyWith(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LandingPrescriptionScreen()),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                            boxShadow: [
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
                            gradient: LinearGradient(
                              colors: [
                                AppColors.primary,
                                AppColors.secondary
                              ],
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
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 12, 0, 12),
                                      child: Icon(
                                        FontAwesomeIcons.whatsapp,
                                        color: AppColors
                                            .secondaryBackground,
                                        size: 24,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                      EdgeInsetsDirectional.fromSTEB(8, 0, 12, 0),
                                      child: Text(
                                        'Chat',
                                        style: AppTextStyle
                                            .bodyMedium
                                            .copyWith(
                                          fontFamily: 'Readex Pro',
                                          color: AppColors
                                              .secondaryBackground,
                                          letterSpacing: 0,
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
      ),
    );
  }
}
