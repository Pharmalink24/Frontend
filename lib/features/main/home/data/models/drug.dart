// "commercial_name": "PROCTO-4 supp.",
// "start_date": "2024-04-10",
// "end_date": "2024-04-30",
// "quantity": 1,
// "quantity_unit": "ampoule",
// "rate": 25.5,
// "rate_unit": "I.U"

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
  final double rate;
  @JsonKey(name: "rate_unit")
  final String rateUnit;

  Drug({
    required this.commercialName,
    required this.startDate,
    required this.endDate,
    required this.quantity,
    required this.quantityUnit,
    required this.rate,
    required this.rateUnit,
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