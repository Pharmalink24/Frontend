// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
import 'package:pharmalink/components/rounded_button.dart';
import 'package:pharmalink/components/form_view.dart';
// Models Packages
import 'package:pharmalink/models/input.dart';
// Services Packages
import 'package:pharmalink/services/networking.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

const kMarginBetweenTitleAndInputs = 35.0;

class VerificationScreen extends StatefulWidget {
  static String url = "/signup/verification";
  final String apiUrl;

  const VerificationScreen({super.key, required this.apiUrl});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  bool _saving = false;
  String email = "member@email.com";

  @override
  void initState() {
    sendVerificationRequest();
    super.initState();
  }

  void sendVerificationRequest() async {
    try {
      API api = API();
      // var response = await api.POST(
      //   widget.apiUrl,
      //   {},
      //   false,
      // );

      // if (response != null) {
      // } else {
      //   throw "Exception";
      // }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App.barWithoutLabel,
      backgroundColor: AppColors.secondaryBackground,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _saving,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    "Please verify your email",
                    style: AppTextStyle.title.copyWith(fontSize: 28.0),
                  ),
                ),
                Text(
                  "You're almost there! We sent an email to",
                  style: AppTextStyle.subtitle.copyWith(fontSize: 16.0),
                ),
                Text(
                  email,
                  style: AppTextStyle.title.copyWith(fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    "Just click on the link in that email to complete your signup. if you don't see it, you may need to check your spam folder.",
                    style: AppTextStyle.subtitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text("Still can't find the email? No problem."),
                ),
                RoundedButton(
                  text: "Resend Verification Email",
                  onPressed: () {
                    setState(() {
                      _saving = true;
                    });
                    sendVerificationRequest();
                    setState(() {
                      _saving = false;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
