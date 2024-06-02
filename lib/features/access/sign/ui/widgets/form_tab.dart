import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/core/theme/colors.dart';

import '../../../../../core/di/dependency_injection.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';
import '../../logic/signin_cubit/signin_cubit.dart';
import '../../logic/signup_cubit/signup_cubit.dart';
import 'signin/signin_body.dart';
import 'signup/signup_body.dart';

class FormTab extends StatefulWidget {
  const FormTab({super.key});

  @override
  State<FormTab> createState() => _FormTabState();
}

class _FormTabState extends State<FormTab> with TickerProviderStateMixin {
  TabController? tabBarController;

  @override
  void initState() {
    super.initState();

    // Initialize the TabController
    tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    );
  }

  // Build the TabBar
  TabBar _buildTabBar() {
    return TabBar(
      controller: tabBarController,
      tabs: [
        Tab(
          text: AppLocalizations.of(context).translate('signIn'),
        ),
        Tab(
          text: AppLocalizations.of(context).translate('signUp'),
        ),
      ],
      isScrollable: true,
      labelColor: context.colorScheme.onPrimary,
      unselectedLabelColor: context.colorScheme.onSecondary,
      tabAlignment: TabAlignment.start,
      overlayColor: WidgetStateProperty.all(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.label,
      enableFeedback: false,
      labelPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      labelStyle: AppTextStyle.displaySmall(context).copyWith(
        color: context.colorScheme.onPrimary,
        fontFamily: AppFonts.getFont(context, Font.tertiary),
        fontSize: AppLocalizations.of(context).isEnLocale ? 32.0 : 24.0,
      ),
      unselectedLabelStyle: AppTextStyle.displaySmall(context).copyWith(
        color: context.colorScheme.onSecondary,
        fontFamily: AppFonts.getFont(context, Font.tertiary),
        fontSize: AppLocalizations.of(context).isEnLocale ? 32.0 : 24.0,
      ),
      indicatorColor: context.colorScheme.primary,
      indicatorWeight: 4,
      onTap: (i) async {
        [() async {}, () async {}][i]();
      },
    );
  }

  // Build the TabBarView
  TabBarView _buildTabBody() {
    return TabBarView(
      controller: tabBarController,
      children: [
        BlocProvider<SigninCubit>(
          create: (context) => getIt<SigninCubit>(),
          child: const SigninBody(),
        ),
        BlocProvider<SignupCubit>(
          create: (context) => getIt<SignupCubit>(),
          child: const SignupBody(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(
          child: _buildTabBody(),
        ),
      ],
    );
  }
}
