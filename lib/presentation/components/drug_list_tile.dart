// Flutter Packages
import 'package:flutter/material.dart';
// Utilities Packages
import 'package:pharmalink/utilities/constants/styles.dart';

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
