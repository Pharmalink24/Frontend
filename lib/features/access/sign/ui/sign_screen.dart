import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/access/sign/ui/widgets/form_tab.dart';
import '../../../../core/theme/app_bar.dart';
import '../../../../shared/presentation/widgets/terms_and_conditions_text.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()    
class SignScreen extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.colorScheme.primaryContainer,
        appBar: const AppBarWidget(
          type: AppBarType.withoutTitle,
          isCentered: true,
        ).build(context),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              children: [
                Expanded(
                  child: FormTab(),
                ),
                TermsAndConditionsText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
