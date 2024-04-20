// {
//   "commercial_name": "CALCIDOL 0.25mcg soft gelatin caps.",
//   "start_date": "2024-03-17",
//   "end_date": "2024-03-30",
//   "quantity": 10,
//   "quantity_unit": "capsule"
// },

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drug.g.dart';

@JsonSerializable()
class Drug {
  @JsonKey(name: "commercial_name")
  final String commercialName;
  @JsonKey(name: "start_date")
  final String startDate;
  @JsonKey(name: "end_date")
  final String endDate;
  final int quantity;
  @JsonKey(name: "quantity_unit")
  final String quantityUnit;

  Drug({
    required this.commercialName,
    required this.startDate,
    required this.endDate,
    required this.quantity,
    required this.quantityUnit,
  });

  // Todo: Complete Implementing the isToday method
  bool isToday() {
    return true;
  }

  // Todo: Complete Implementing the reminder time calculation
  TimeOfDay calcReminderTime() {
    return TimeOfDay(hour: 2, minute: 10);
  }

  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);

  Map<String, dynamic> toJson() => _$DrugToJson(this);
}