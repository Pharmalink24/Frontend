import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:provider/provider.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';
import 'ff_button_widget.dart';
import 'package:pharmalink/core/networking/networking.dart';



class ActivateBoxWidget extends StatefulWidget {

  final String id;

  const ActivateBoxWidget({
    super.key,
    required this.id,
  });

  @override
  State<ActivateBoxWidget> createState() => _ActivateBoxWidgetState();
}

class _ActivateBoxWidgetState extends State<ActivateBoxWidget> {

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }
  void activatePrescription() async {
    try {
      API api = API();
      var doctorInfo = await api.POST(
        'Prescription/user/activate-prescription/${widget.id}/',
        {},
        200,
        auth: true,
      );
      print("tamam");

      if (doctorInfo != null) {
        print(doctorInfo);
        setState(() {
          Navigator.pop(context, 'Activated');
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
    return Container(
      width: double.infinity,
      height: 449,
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Color(0x3B1D2429),
            offset: Offset(
              0.0,
              -3,
            ),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: FaIcon(
                FontAwesomeIcons.question,
                color: AppColors.secondaryText,
                size: 32,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: Text(
                'Are you sure ?',
                textAlign: TextAlign.center,
                style: AppTextStyle.bodyMedium.copyWith(
                  fontFamily: 'Readex Pro',
                  fontSize: 25,
                  letterSpacing: 0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  activatePrescription();
                },
                text: 'Active !',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: AppColors.primary,
                  textStyle: AppTextStyle.bodyLarge.copyWith(
                    fontFamily: 'Readex Pro',
                    fontSize: 20,
                    letterSpacing: 0,
                  ),
                  elevation: 2,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async {
                  context.pop();
                },
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: AppColors.secondaryBackground,
                  textStyle: AppTextStyle.titleSmall.copyWith(
                    fontFamily: 'Lexend Deca',
                    color: AppColors.secondaryText,
                    fontSize: 16,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                  ),
                  elevation: 0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}