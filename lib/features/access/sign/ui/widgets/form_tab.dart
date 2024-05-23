import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/fonts.dart';
import '../../../../../core/theme/styles.dart';
import '../../data/models/signin/signin_fields.dart';
import '../../data/models/signup/signup_fields.dart';
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

    // Initialize the controllers
    _initSignupControllers();
    _initSignInControllers();
  }

  void _initSignupControllers() {
    // Initialize controllers
    signUpFields["fname"]!.controller =
        context.read<SignupCubit>().fnameController;
    signUpFields["lname"]!.controller =
        context.read<SignupCubit>().lnameController;
    signUpFields["username"]!.controller =
        context.read<SignupCubit>().usernameController;
    signUpFields["password"]!.controller =
        context.read<SignupCubit>().passwordController;
    signUpFields["confirmPassword"]!.controller =
        context.read<SignupCubit>().confirmPasswordController;
    signUpFields["email"]!.controller =
        context.read<SignupCubit>().emailController;
    signUpFields["phone"]!.controller =
        context.read<SignupCubit>().phoneController;
    signUpFields["birthdate"]!.controller =
        context.read<SignupCubit>().birthdateController;
    signUpFields["gender"]!.controller =
        context.read<SignupCubit>().genderController;
  }

  void _initSignInControllers() {
    // Initialize controllers
    signInFields["email"]!.controller =
        context.read<SigninCubit>().emailController;
    signInFields["password"]!.controller =
        context.read<SigninCubit>().passwordController;
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
      labelColor: Theme.of(context).colorScheme.onPrimary,
      unselectedLabelColor: Theme.of(context).colorScheme.onSecondary,
      tabAlignment: TabAlignment.start,
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicatorSize: TabBarIndicatorSize.label,
      enableFeedback: false,
      labelPadding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
      labelStyle: AppTextStyle.displaySmall(context).copyWith(
        color: Theme.of(context).colorScheme.onPrimary,
        fontFamily: AppFonts.getFont(context, Font.tertiary),
        fontSize: AppLocalizations.of(context).isEnLocale ? 32.0 : 24.0,
      ),
      unselectedLabelStyle: AppTextStyle.displaySmall(context).copyWith(
        color: Theme.of(context).colorScheme.onSecondary,
        fontFamily: AppFonts.getFont(context, Font.tertiary),
        fontSize: AppLocalizations.of(context).isEnLocale ? 32.0 : 24.0,
      ),
      indicatorColor: Theme.of(context).colorScheme.primary,
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
      children: const [
        SigninBody(),
        SignupBody(),
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
