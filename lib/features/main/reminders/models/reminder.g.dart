// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reminder _$ReminderFromJson(Map<String, dynamic> json) => Reminder(
      id: json['id'] as int,
      drugName: json['drug_name'] as String,
      dosage: (json['dosage'] as num).toDouble(),
      dosageUnit: json['dosage_unit'] as String,
      nextDoseTime: json['next_dose_time'] as String,
      isChecked: json['is_checked'] as bool,
      state: json['state'] as String,
      userId: json['user'] as int,
      prescriptionId: json['prescription'] as int,
    );

Map<String, dynamic> _$ReminderToJson(Reminder instance) => <String, dynamic>{
      'id': instance.id,
      'drug_name': instance.drugName,
      'dosage': instance.dosage,
      'dosage_unit': instance.dosageUnit,
      'next_dose_time': instance.nextDoseTime,
      'is_checked': instance.isChecked,
      'state': instance.state,
      'user': instance.userId,
      'prescription': instance.prescriptionId,
    };
