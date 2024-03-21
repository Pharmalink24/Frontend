// Flutter Packages
import 'package:flutter/material.dart';
// Screens Packages
// Components Packages
import 'package:pharmalink/core/widgets/card_container.dart';
import 'package:pharmalink/core/widgets/drug_list_tile.dart';
import 'package:pharmalink/core/widgets/circle_image.dart';
// Utilities Packages
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/fonts.dart';
import 'package:pharmalink/core/theme/styles.dart';
// External Packages

String userName = "Mohammed";
String imageUrl =
    'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZG9jb3RyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60';

class PatientHomeScreen extends StatefulWidget {
  static String url = "patient/home/";

  const PatientHomeScreen({super.key});

  @override
  State<PatientHomeScreen> createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  void getCurrentUser() {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: AppTextStyle.bodyMedium.copyWith(
                fontFamily: AppFonts.secondary,
                fontSize: 45,
              ),
            ),
            Text(
              userName,
              style: AppTextStyle.bodyMedium.copyWith(
                fontFamily: AppFonts.secondary,
                fontSize: 45,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            CardContainer(
              title: "Your Doctors",
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleImage(
                      image: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CircleImage(
                      image: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    CircleImage(
                      image: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CardContainer(
              title: "Your Prescriptions",
              child: Column(
                children: [
                  DrugListTile(
                    drugName: "Mohamed",
                    quantity: "20",
                    measure: "mg",
                    time: "2 PM",
                  ),
                  DrugListTile(
                    drugName: "Mohamed",
                    quantity: "20",
                    measure: "mg",
                    time: "2 PM",
                  ),
                  DrugListTile(
                    drugName: "Mohamed",
                    quantity: "20",
                    measure: "mg",
                    time: "2 PM",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
