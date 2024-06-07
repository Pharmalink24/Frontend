import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmalink/core/helpers/extensions/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/shadow.dart';
import '../../../../../../core/theme/styles.dart';
import 'form/form_button.dart';

class ModalBottomWidget extends StatelessWidget {
  final String text;
  final List<Widget> buttons;
  const ModalBottomWidget(
      {super.key, required this.text, required this.buttons});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height / 2,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        boxShadow: AppShadows.box(context),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                child: Icon(
                  FontAwesomeIcons.solidCircleQuestion,
                  color: context.colorScheme.onSecondary,
                  size: 42,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 16),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyMedium(context).copyWith(
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              ...buttons,
              FormButton(
                onPressed: () async => context.maybePop(),
                width: double.infinity,
                height: 60,
                text: 'Cancel',
                color: context.colorScheme.primaryContainer,
                textColor: context.colorScheme.secondary,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
