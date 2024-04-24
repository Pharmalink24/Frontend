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
  final int course;
  final int repetition;
  final String per;
  final double dosage;
  @JsonKey(name: "dosage_unit")
  final String dosageUnit;

  Drug({
    required this.commercialName,
    required this.startDate,
    required this.endDate,
    required this.course,
    required this.repetition,
    required this.per,
    required this.dosage,
    required this.dosageUnit,
  });

  // Todo: Complete Implementing the isToday method
  bool isToday() {
    return true;
  }

  // Todo: Complete Implementing the reminder time calculation
  TimeOfDay calcReminderTime() {
    return const TimeOfDay(hour: 2, minute: 10);
  }

  factory Drug.fromJson(Map<String, dynamic> json) => _$DrugFromJson(json);

  Map<String, dynamic> toJson() => _$DrugToJson(this);
}
