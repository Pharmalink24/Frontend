import 'package:json_annotation/json_annotation.dart';
import 'package:pharmalink/core/enums/drug_state.dart';

import '../../../../../core/enums/eating_state.dart';

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

  bool isNextDoseToday() {
    return getNextDoseTime()?.day == DateTime.now().day &&
        getNextDoseTime()?.month == DateTime.now().month &&
        getNextDoseTime()?.year == DateTime.now().year;
  }

  bool isNextDoseBeforeToday() {
    return getNextDoseTime()
            ?.isBefore(DateTime.now().subtract(const Duration(days: 1))) ??
        false;
  }

  bool isNextDoseAfterToday() {
    return getNextDoseTime()?.isAfter(DateTime.now()) ?? false;
  }

  bool isActivationReminder() {
    return startDateActivate != null;
  }

  DateTime? getNextDoseTime() {
    return nextDoseTime != null
        ? DateTime.parse(nextDoseTime!).toLocal()
        : null;
  }

  DateTime? getActivationTime() {
    return startDateActivate != null
        ? DateTime.parse(startDateActivate!).toLocal()
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

  get dayOfNextDoseTimeDate => getNextDoseTime()?.day;
  get monthOfNextDoseTimeDate => getNextDoseTime()?.month;

  get nextDoseDate {
    // Return the date in the format of 'dd MMM'
    return "${dayOfNextDoseTimeDate.toString().padLeft(2, '0')}"
        "/"
        "${monthOfNextDoseTimeDate.toString().padLeft(2, '0')}";
  }

  get dayOfActivationTimeDate => getActivationTime()?.day;
  get monthOfActivationTimeDate => getActivationTime()?.month;

  get activationDate {
    // Return the date in the format of 'dd MMM'
    return "${dayOfActivationTimeDate.toString().padLeft(2, '0')}"
        "/"
        "${monthOfActivationTimeDate.toString().padLeft(2, '0')}";
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
