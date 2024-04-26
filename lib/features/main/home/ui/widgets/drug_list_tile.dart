import 'package:flutter/material.dart';
import 'package:pharmalink/features/main/home/data/models/drug.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class DrugListTile extends StatefulWidget {
  final Drug drug;

  const DrugListTile(
    this.drug, {
    super.key,
  });

  @override
  State<DrugListTile> createState() => _DrugListTileState();
}

class _DrugListTileState extends State<DrugListTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    String timeInString =
        "${widget.drug.calcReminderTime().hourIn12hour()}:${widget.drug.calcReminderTime().minutes()}\n${widget.drug.calcReminderTime().getPeriod()}";

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
        widget.drug.commercialName,
        style: AppTextStyle.titleMedium.copyWith(
          color: AppColors.primaryText,
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      subtitle: Text(
        "${widget.drug.quantity} ${widget.drug.quantityUnit}",
        style: AppTextStyle.labelMedium.copyWith(
          decoration:
              isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
    );
  }
}
