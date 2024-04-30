// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drug_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DrugInfo _$DrugInfoFromJson(Map<String, dynamic> json) => DrugInfo(
      drugEye: json['DrugEye'] as int,
      scName: json['ScName'] as String,
      scNameComponents: (json['ScNameComponents'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      dosage: (json['dosage'] as num).toDouble(),
      dosageUnit: json['dosage_unit'] as String,
      course: json['course'] as int,
      repetition: json['repetition'] as int,
      per: json['per'] as int,
      state: $enumDecode(_$DrugStateEnumMap, json['state']),
    );

Map<String, dynamic> _$DrugInfoToJson(DrugInfo instance) => <String, dynamic>{
      'DrugEye': instance.drugEye,
      'ScName': instance.scName,
      'ScNameComponents': instance.scNameComponents,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'dosage': instance.dosage,
      'dosage_unit': instance.dosageUnit,
      'course': instance.course,
      'repetition': instance.repetition,
      'per': instance.per,
      'state': _$DrugStateEnumMap[instance.state]!,
    };

const _$DrugStateEnumMap = {
  DrugState.NEW: 'new',
  DrugState.ACTIVE: 'active',
  DrugState.INACTIVE: 'inactive',
};
