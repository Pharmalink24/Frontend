import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pharmalink/core/networking/networking.dart';
import 'package:pharmalink/features/main/prescription/doctor_info.dart';
import 'widgets/drug_card.dart';
import 'widgets/ff_button_widget.dart';
import 'widgets/deactivate_box.dart';

class PrescriptionScreen extends StatefulWidget {
  static String url = "/prescription";
  final String fName;
  final String lName;
  final String date;
  final String image;
  final String id;

  PrescriptionScreen({
    super.key,
    required this.lName,
    required this.fName,
    required this.date,
    required this.image,
    required this.id,
  });

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  List<DrugCard> drugCards = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      API api = API();
      var prescriptionInfo = await api.GET(
        'Prescription/get-prescription/${widget.id}/',
        200,
        auth: true,
      );

      if (prescriptionInfo != null) {
        setState(() {
          for (var i = 0; i < prescriptionInfo.length; i++) {
            print(prescriptionInfo['drugs'][i]);
            drugCards.add(DrugCard(
              tradeName: prescriptionInfo['drugs'][i],
              startDate: prescriptionInfo['drugs'][i]['start_date'],
              endDate: prescriptionInfo['drugs'][i]['end_date'],
              quantity: prescriptionInfo['drugs'][i]['quantity'],
              rate: prescriptionInfo['drugs'][i]['rate'],
              rateUnit: prescriptionInfo['drugs'][i]['rate_unit'],
              quantityUnit: prescriptionInfo['drugs'][i]['quantity_unit'],
            ));
          }
        });
      } else {
        throw "Exception";
      }
    } catch (e) {
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
          'Prescription',
          style: AppTextStyle.displayMedium.copyWith(
            fontSize: 28,
          ),
        ),
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 24),
        child: Wrap(
          spacing: 16,
          runSpacing: 16,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: 750,
              ),
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
                  )
                ],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorInfoScreen(
                                        name: '${widget.fName} ${widget.lName}',
                                        image: widget.image,
                                        id: widget.id,
                                      )),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 4),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.network(
                                  widget.image,
                                  width: 70,
                                  height: 70,
                                  fit: BoxFit.cover,
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1, 0),
                                          child: Text(
                                              'Dr. ${widget.fName} ${widget.lName}',
                                              style: AppTextStyle.titleLarge),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 12),
                                          child: Text(widget.date,
                                              style: AppTextStyle.labelMedium),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: AppColors.accent4,
                        ),
                        ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: drugCards),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding:
                  //   EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
                  //   child: FFButtonWidget(
                  //     onPressed: () async {
                  //       await showModalBottomSheet(
                  //         isScrollControlled: true,
                  //         backgroundColor: Color(0x15000000),
                  //         enableDrag: false,
                  //         context: context,
                  //         builder: (context) {
                  //           return Padding(
                  //             padding: MediaQuery.viewInsetsOf(context),
                  //             child: DeactivateBoxWidget(),
                  //           );
                  //         },
                  //       ).then((value) => setState(() {}));
                  //     },
                  //     text: 'Track',
                  //     options: FFButtonOptions(
                  //       width: double.infinity,
                  //       height: 40,
                  //       padding:
                  //       EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                  //       iconPadding:
                  //       EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  //       color:AppColors.primary,
                  //       textStyle: AppTextStyle
                  //           .titleSmall.copyWith(
                  //         fontFamily: 'Readex Pro',
                  //         color: Colors.white,
                  //         letterSpacing: 0,
                  //       )
                  //       ,
                  //       elevation: 3,
                  //       borderSide: BorderSide(
                  //         color: Colors.transparent,
                  //         width: 1,
                  //       ),
                  //       borderRadius: BorderRadius.circular(8),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  return Container(
    width: MediaQuery.sizeOf(context).width,
    decoration: BoxDecoration(
      color: AppColors.primaryBackground,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 12),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 1, 1, 1),
                child: Icon(
                  FontAwesomeIcons.capsules,
                  size: 50,
                  color: AppColors.primary,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(13, 0, 4, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Augmentin', style: AppTextStyle.titleLarge),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(children: [
                            TextSpan(
                              text: '1 g',
                              style: TextStyle(),
                            )
                          ], style: AppTextStyle.labelSmall
                              //     .override(
                              //   fontFamily:
                              //   'Readex Pro',
                              //   letterSpacing:
                              //   0,
                              // ),
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
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 12),
          child: AutoSizeText('Course: 2 weeks\nDose: 2 tablet/day',
              textAlign: TextAlign.start, style: AppTextStyle.labelMedium),
        ),
      ],
    ),
  );
}
