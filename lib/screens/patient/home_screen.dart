// Flutter Packages
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// Screens Packages
// Components Packages
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';
// External Packages

String Name = "Youssef";
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
    return  Padding(
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
            Name,
            style: AppTextStyle.bodyMedium.copyWith(
              fontFamily: AppFonts.secondary,
              fontSize: 45,
              color: AppColors.primary,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          WhiteCard(
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
          SizedBox(
            height: 10.0,
          ),
          WhiteCard(
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
    )
    ;
  }
}

class CircleImage extends StatelessWidget {
  final Image image;
  const CircleImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(vertical: 0, horizontal: 8),
      child: Container(
        width: 120,
        height: 120,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: image,
      ),
    );
  }
}

class DrugListTile extends StatelessWidget {
  final String drugName;
  final String quantity;
  final String measure;
  final String time;

  const DrugListTile({
    super.key,
    required this.drugName,
    required this.quantity,
    required this.measure,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      onChanged: (value) {},
      value: false,
      title: Text(
        drugName,
        style: AppTextStyle.titleLarge,
      ),
      subtitle: Text(
        "$quantity $measure, $time",
        style: AppTextStyle.labelMedium,
      ),
    );
  }
}

class WhiteCard extends StatelessWidget {
  final String title;
  final Widget child;

  const WhiteCard({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyle.bodyMedium.copyWith(
              fontFamily: 'Readex Pro',
              fontSize: 25,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 8.0),
            child: child,
          ),
        ],
      ),
    );
  }
}
