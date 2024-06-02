// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
      id: (json['id'] as num).toInt(),
      drugName: json['drug_name'] as String,
      dosage: (json['dosage'] as num?)?.toDouble(),
      dosageUnit: json['dosage_unit'] as String?,
      nextDoseTime: json['next_dose_time'] as String?,
      startDateActivate: json['start_date_activate'] as String?,
      isChecked: json['is_checked'] as bool,
      state: $enumDecode(_$DrugStateEnumMap, json['state']),
      eatingState:
          $enumDecodeNullable(_$EatingStateEnumMap, json['eating_state']),
      userId: (json['user'] as num).toInt(),
      prescriptionId: (json['prescription'] as num).toInt(),
    );

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'drug_name': instance.drugName,
      'dosage': instance.dosage,
      'dosage_unit': instance.dosageUnit,
      'next_dose_time': instance.nextDoseTime,
      'start_date_activate': instance.startDateActivate,
      'is_checked': instance.isChecked,
      'state': _$DrugStateEnumMap[instance.state]!,
      'eating_state': _$EatingStateEnumMap[instance.eatingState],
      'user': instance.userId,
      'prescription': instance.prescriptionId,
    };

const _$DrugStateEnumMap = {
  DrugState.NEW: 'new',
  DrugState.ACTIVE: 'active',
  DrugState.INACTIVE: 'inactive',
};

const _$EatingStateEnumMap = {
  EatingState.beforeMeal: 'Before meal',
  EatingState.afterMeal: 'After meal',
  EatingState.none: 'None',
};
