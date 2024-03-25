// Flutter Packages
import 'package:flutter/material.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/features/main/home/ui/widgets/doctors_container.dart';
import 'package:pharmalink/features/main/home/ui/widgets/prescriptions_container.dart';
import 'widgets/welcome_name_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryBackground,
      height: double.infinity,
      child: const SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeNameText(),
              DoctorsContainer(),
              PrescriptionsContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
