import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/app_bar.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/widgets/form/form_button.dart';
import 'package:pharmalink/core/localization/app_localizations.dart';
import 'package:pharmalink/core/widgets/form/form_view.dart';
import 'package:pharmalink/features/access/forget_password/data/models/forget_password_fields.dart';
import 'package:pharmalink/features/access/forget_password/logic/forget_password_cubit.dart';
import 'package:pharmalink/features/access/forget_password/ui/widgets/verification_bloc_listener.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/theme/styles.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({
    super.key,
  });

  @override
  State<ForgetPasswordWidget> createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  @override
  void initState() {
    super.initState();

    // Initialize controllers
    forgetPasswordFields["email"]!.controller =
        context.read<ForgetPasswordCubit>().emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primaryContainer,
      appBar: AppBarWidget(
        type: AppBarType.withoutLogo,
        title: AppLocalizations.of(context).translate('forgetPassword'),
        automaticallyImplyLeading: true,
      ).build(context),
      body: BlocProvider(
        create: (context) => getIt<ForgetPasswordCubit>(),
        child: SafeArea(
          child: ListView(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 22.0),
            children: [
              Text(
                AppLocalizations.of(context)
                    .translate('forgetYourPasswordDesc'),
                style: AppTextStyle.bodyLarge(context),
              ),
              const SizedBox(height: 24.0),
              FormView(
                model: forgetPasswordFields,
                formKey: context.read<ForgetPasswordCubit>().formKey,
                decorationType: DecorationType.secondary,
              ),
              FormButton(
                text: AppLocalizations.of(context).translate('forgetPassword'),
                onPressed: () => forgetPassword(context),
                borderRadius: 12.0,
              ),
              ForgetPasswordBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void forgetPassword(BuildContext context) {
    context.read<ForgetPasswordCubit>().forgetPassword();
  }
}
