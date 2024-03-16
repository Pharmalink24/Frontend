// Flutter Packages
import 'package:flutter/material.dart';
// Utilities
import 'package:pharmalink/utilities/constants.dart';

const kIconSize = 40.0;
const kContentMargin = 25.0;
const kLabelTextStyle = TextStyle(
  fontSize: 20.0,
  color: AppColors.alternate,
  fontWeight: FontWeight.normal,
);

class IconContent extends StatelessWidget {
  final IconData? icon;
  final String label;

  IconContent({@required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: AppColors.alternate,
          size: kIconSize,
        ),
        const SizedBox(
          width: kContentMargin,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
