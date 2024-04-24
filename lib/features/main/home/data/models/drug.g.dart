// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drug _$DrugFromJson(Map<String, dynamic> json) => Drug(
      commercialName: json['commercial_name'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      course: json['course'] as int,
      repetition: json['repetition'] as int,
      per: json['per'] as String,
      dosage: (json['dosage'] as num).toDouble(),
      dosageUnit: json['dosage_unit'] as String,
    );

Map<String, dynamic> _$DrugToJson(Drug instance) => <String, dynamic>{
      'commercial_name': instance.commercialName,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'course': instance.course,
      'repetition': instance.repetition,
      'per': instance.per,
      'dosage': instance.dosage,
      'dosage_unit': instance.dosageUnit,
    };
