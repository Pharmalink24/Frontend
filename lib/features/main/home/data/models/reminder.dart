// "id": 1,
// "drug_name": "UVAMINE RETARD 100mg caps.",
// "dosage": 10.0,
// "dosage_unit": "capsule",
// "next_dose_time": "2024-04-29T00:00:00",
// "is_checked": false,
// "state": "active",
// "user": 27,
// "prescription": 6

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  final int id;
  @JsonKey(name: "drug_name")
  final String drugName;
  final double dosage;
  @JsonKey(name: "dosage_unit")
  final String dosageUnit;
  @JsonKey(name: "next_dose_time")
  final String nextDoseTime;
  @JsonKey(name: "is_checked")
  final bool isChecked;
  final String state;
  @JsonKey(name: "user")
  final int userId;
  @JsonKey(name: "prescription")
  final int prescriptionId;

  Reminder({
    required this.id,
    required this.drugName,
    required this.dosage,
    required this.dosageUnit,
    required this.nextDoseTime,
    required this.isChecked,
    required this.state,
    required this.userId,
    required this.prescriptionId,
  });

  bool isToday() {
    return DateTime.now().isBefore(DateTime.parse(nextDoseTime));
  }

  DateTime getNextDoseTime() {
    return DateTime.parse(nextDoseTime).toLocal();
  }

  get hours => getNextDoseTime().hour.toString().padLeft(2, '0');

  get minute => getNextDoseTime().minute.toString().padLeft(2, '0');

  get period => getNextDoseTime().hour >= 12 ? 'PM' : 'AM';

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
}
