import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'ff_button_widget.dart';
import '../../../../../core/theme/styles.dart';
import '../../../../../core/networking/networking.dart';

class DeactivateBoxWidget extends StatefulWidget {
  final int id;

  const DeactivateBoxWidget({
    super.key,
    required this.id,
  });

  @override
  State<DeactivateBoxWidget> createState() => _DeactivateBoxWidgetState();
}

class _DeactivateBoxWidgetState extends State<DeactivateBoxWidget> {
  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
  }

  @override
  void initState() {
    super.initState();
  }

  void deactivatePrescription() async {
    try {
      API api = API();
      var doctorInfo = await api.POST(
        'Prescription/user/deactivate-prescription/${widget.id}/',
        {},
        200,
        auth: true,
      );

      if (doctorInfo != null) {
        setState(() {
          context.maybePop('Activated');
          // Navigator.pop(context, 'Activated');
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
    return Container(
      width: double.infinity,
      height: 449,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: context.colorScheme.shadow,
            offset: const Offset(
              0.0,
              -3,
            ),
          )
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: FaIcon(
                FontAwesomeIcons.question,
                color: context.colorScheme.onSecondary,
                size: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
              child: Text(
                'Why do you want to deactivate your prescription?',
                textAlign: TextAlign.center,
                style: AppTextStyle.headlineSmall(context),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  deactivatePrescription();
                },
                text: 'I activated it by mistake.',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: context.colorScheme.primary,
                  textStyle: AppTextStyle.bodyLarge(context).copyWith(
                    fontSize: 20,
                  ),
                  elevation: 2,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () {
                  deactivatePrescription();
                },
                text: 'Doctor\'s orders.',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 45,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: context.colorScheme.primary,
                  textStyle: AppTextStyle.bodyLarge(context).copyWith(
                    fontSize: 20,
                  ),
                  elevation: 2,
                  borderSide: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
              child: FFButtonWidget(
                onPressed: () async => context.maybePop(),
                text: 'Cancel',
                options: FFButtonOptions(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                  color: context.colorScheme.primaryContainer,
                  textStyle: AppTextStyle.titleSmall(context).copyWith(
                    color: context.colorScheme.onSecondary,
                    fontWeight: FontWeight.normal,
                  ),
                  elevation: 0,
                  borderSide: const BorderSide(
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
