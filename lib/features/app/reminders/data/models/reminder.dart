import 'package:json_annotation/json_annotation.dart';
import 'package:pharmalink/shared/domain/entities/enums/drug_state.dart';

import '../../../../../shared/domain/entities/enums/eating_state.dart';

part 'reminder.g.dart';

@JsonSerializable()
class Reminder {
  final int id;
  @JsonKey(name: "drug_name")
  final String drugName;
  final double? dosage;
  @JsonKey(name: "dosage_unit")
  final String? dosageUnit;
  @JsonKey(name: "next_dose_time")
  final String? nextDoseTime;
  @JsonKey(name: "start_date_activate")
  final String? startDateActivate;
  @JsonKey(name: "is_checked")
  final bool isChecked;
  final DrugState state;
  @JsonKey(name: "eating_state")
  final EatingState? eatingState;
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
    required this.startDateActivate,
    required this.isChecked,
    required this.state,
    required this.eatingState,
    required this.userId,
    required this.prescriptionId,
  });

  bool isToday() {
    return getNextDoseTime()?.day == DateTime.now().day &&
        getNextDoseTime()?.month == DateTime.now().month &&
        getNextDoseTime()?.year == DateTime.now().year;
  }

  bool isBeforeToday() {
    return getNextDoseTime()
            ?.isBefore(DateTime.now().subtract(const Duration(days: 1))) ??
        false;
  }

  bool isAfterToday() {
    return getNextDoseTime()?.isAfter(DateTime.now()) ?? false;
  }

  DateTime? getNextDoseTime() {
    return nextDoseTime != null
        ? DateTime.parse(nextDoseTime!).toLocal()
        : null;
  }

  // ----------------- Drug Name ----------------- //

  get drugFirstName => drugName.split(' ').first;

  get drugRemainingName {
    final drugNameList = drugName.split(' ');
    drugNameList.removeAt(0);
    return drugNameList.join(' ');
  }

  // ----------------- Date ----------------- //

  get dayOfDate => getNextDoseTime()?.day;
  get monthOfDate => getNextDoseTime()?.month;

  get date {
    // Return the date in the format of 'dd MMM'
    return "${dayOfDate.toString().padLeft(2, '0')}"
        "/"
        "${monthOfDate.toString().padLeft(2, '0')}";
  }

  // ----------------- Time ----------------- //

  get hours => getNextDoseTime()?.hour.toString().padLeft(2, '0');

  get minute => getNextDoseTime()?.minute.toString().padLeft(2, '0');

  get period => nextDoseTime != null
      ? getNextDoseTime()!.hour >= 12
          ? 'PM'
          : 'AM'
      : null;

  factory Reminder.fromJson(Map<String, dynamic> json) =>
      _$ReminderFromJson(json);

  Map<String, dynamic> toJson() => _$ReminderToJson(this);
}