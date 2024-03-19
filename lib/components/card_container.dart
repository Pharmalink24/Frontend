// Flutter Packages
import 'package:flutter/material.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants.dart';

class CardContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const CardContainer({
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
