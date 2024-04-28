import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:pharmalink/core/networking/networking.dart';
import 'package:pharmalink/features/main/prescription/doctor_info.dart';
import 'package:logger/logger.dart';
import 'package:pharmalink/core/di/dependency_injection.dart';
import 'package:pharmalink/features/main/prescription/widgets/activate_box.dart';
import 'widgets/drug_card.dart';
import 'widgets/ff_button_widget.dart';
import 'widgets/deactivate_box.dart';
import 'widgets/widget_size.dart';

class PrescriptionScreen extends StatefulWidget {
  static String url = "/prescription";
  final String fName;
  final String lName;
  final String date;
  final String image;
  final String id;
  final String category;

  PrescriptionScreen({
    super.key,
    required this.lName,
    required this.fName,
    required this.date,
    required this.image,
    required this.id,
    required this.category,
  });

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  List<DrugCard> drugCards = [];
  double otherWidgetsHeight = 0.0; // Initialize with zero
  double height = 0;

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
          Map<String, dynamic> drugs = prescriptionInfo['drugs'];

          drugs.forEach((key, value) {
            drugCards.add(DrugCard(
              tradeName: key,
              startDate: value['start_date'],
              endDate: value['end_date'],
              quantity: value['quantity'],
              rate: value['rate'],
              rateUnit: value['rate_unit'],
              quantityUnit: value['quantity_unit'],
            ));
          });
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
    AppBar appBar = AppBar(
      iconTheme: const IconThemeData(color: AppColors.secondaryText),
      backgroundColor: AppColors.primaryBackground,
      title: Text(
        'Prescription',
        style: AppTextStyle.displayMedium.copyWith(
          fontSize: 28,
        ),
      ),
      elevation: 2,
    );
    return Scaffold(
      backgroundColor: AppColors.secondaryBackground,
      appBar: appBar,
      body: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 16, 16, 24),
        child: Column(
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
                                ),
                              ),
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
                                            style: AppTextStyle.titleLarge,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 0, 12),
                                          child: Text(
                                            widget.date,
                                            style: AppTextStyle.labelMedium,
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
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 750,
                  maxHeight: MediaQuery.of(context).size.height -
                      (appBar.preferredSize.height + height + 80),
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
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: drugCards,
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
            )
          ],
        ),
      ),
      bottomNavigationBar: widget.category != "Inactive"
        ? Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 16),
        child: FFButtonWidget(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Color(0x15000000),
              enableDrag: false,
              context: context,
              builder: (context) {
                print(widget.category);
                return Padding(
                  padding: MediaQuery.viewInsetsOf(context),
                  child: widget.category == "Active" ? DeactivateBoxWidget(id: widget.id): ActivateBoxWidget(id: widget.id),
                );
              },
            ).then((value) => setState(() {}));
          },
          text:   widget.category == "Active" ? 'Deactivate' : 'Activate',
          options: FFButtonOptions(
            width: double.infinity,
            height: 40,
            padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: AppColors.primary,
            textStyle: AppTextStyle.titleSmall.copyWith(
              fontFamily: 'Readex Pro',
              color: Colors.white,
              letterSpacing: 0,
            ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      )
      :null,
    );
  }
}
