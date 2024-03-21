// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmalink/business_logic/sign/cubit/signup_cubit.dart';
import 'package:pharmalink/data/models/signup/doctor.dart';
import 'package:pharmalink/data/models/signup/patient.dart';
// Screens Packages
import 'package:pharmalink/presentation/screens/signup/verification_screen.dart';
// Components Packages
import 'package:pharmalink/presentation/components/rounded_button.dart';
import 'package:pharmalink/presentation/components/form_view.dart';
// Models Packages
import 'package:pharmalink/presentation/classes/field.dart';
// Services Packages
import 'package:pharmalink/data/web_services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/apis.dart';
import 'package:pharmalink/utilities/constants/app_bar.dart';
import 'package:pharmalink/utilities/constants/colors.dart';
import 'package:pharmalink/utilities/constants/styles.dart';
import 'package:pharmalink/utilities/constants/urls.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 20.0;

class SignUpScreen extends StatefulWidget {
  static const String url = "signup/";
  final String apiUrl;
  final List<Field> signUpFields;

  const SignUpScreen(
      {super.key, required this.apiUrl, required this.signUpFields});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _saving = false;
  late var user;

  @override
  void initState() {
    super.initState();
  }

  void signupRequest() {
    Map body = {};
    for (var field in widget.signUpFields) {
      if (field.dbName != null) body[field.dbName] = field.value;
    }
    user = widget.apiUrl == API.doctorSignUp
        ? BlocProvider.of<SignupCubit>(context).signupDoctor(body)
        : BlocProvider.of<SignupCubit>(context).signupPatient(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Hero(
                        tag: "SignInTitle",
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign In",
                            style: AppTextStyle.headlineLarge.copyWith(
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: Hero(
                        tag: "SignUpTitle",
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Sign Up",
                            style: AppTextStyle.headlineLarge.copyWith(
                              color: AppColors.primaryText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Let\'s get started by filling out the form below.',
                      style: AppTextStyle.labelSmall,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
                SizedBox(
                  height: kMarginBetweenTitleAndInputs,
                ),
                FormView(
                  model: widget.signUpFields,
                ),
                RoundedButton(
                  text: "Create an account",
                  onPressed: () async {
                    setState(() {
                      _saving = true;
                    });

                    // Sign up process
                    signupRequest();

                    setState(() {
                      _saving = false;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
