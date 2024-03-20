// ignore_for_file: prefer_const_constructors

// Flutter Packages
import 'package:flutter/material.dart';
// External Packages
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// Models Packages
// Services Packages
import 'package:pharmalink/data/web_services/networking.dart';
// Screens Packages
// Components Packages
import 'package:pharmalink/presentation/components/rounded_button.dart';
import 'package:pharmalink/utilities/constants/app_bar.dart';
import 'package:pharmalink/utilities/constants/colors.dart';
import 'package:pharmalink/utilities/constants/styles.dart';

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
      Api api = Api();
      var response = await api.post(widget.apiUrl, {}, false, 200);

      if (response != null) {
      } else {
        throw "Null Response";
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.withoutLabel,
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
                    style: AppTextStyle.displayMedium.copyWith(fontSize: 28.0),
                  ),
                ),
                Text(
                  "You're almost there! We sent an email to",
                  style: AppTextStyle.displayMedium.copyWith(fontSize: 16.0),
                ),
                Text(
                  email,
                  style: AppTextStyle.displayMedium.copyWith(fontSize: 20.0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: Text(
                    "Just click on the link in that email to complete your signup. if you don't see it, you may need to check your spam folder.",
                    style: AppTextStyle.bodyMedium,
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
