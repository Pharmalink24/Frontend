import 'package:flutter/material.dart';
import 'package:pharmalink/core/helpers/extensions.dart';
import 'package:pharmalink/core/theme/colors.dart';
import 'package:pharmalink/core/theme/styles.dart';

class DrugListTile extends StatefulWidget {
  final String drugName;
  final String quantity;
  final String measure;
  final TimeOfDay time;

  const DrugListTile({
    super.key,
    required this.drugName,
    required this.quantity,
    required this.measure,
    required this.time,
  });

  @override
  State<DrugListTile> createState() => _DrugListTileState();
}

class _DrugListTileState extends State<DrugListTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    String timeInString =
        "${widget.time.hourIn12hour()}:${widget.time.minutes()}\n${widget.time.getPeriod()}";

    return CheckboxListTile(
      value: isChecked,
      onChanged: (value) => setState(() {
        isChecked = value ?? false;
      }),
      checkboxShape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      checkColor: AppColors.alternate,
      activeColor: AppColors.secondary,
      secondary: Text(
        timeInString,
        textAlign: TextAlign.center,
        style: AppTextStyle.labelLarge.copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      title: Text(
        widget.drugName,
        style: AppTextStyle.titleLarge.copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        "${widget.quantity} ${widget.measure}",
        style: AppTextStyle.labelMedium.copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
