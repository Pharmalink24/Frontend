// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Interaction _$InteractionFromJson(Map<String, dynamic> json) => Interaction(
      prescriptionId: json['prescription_id'] as int,
      prescriptionDrug: json['prescription_drug'] as String,
      drug: json['drug'] as String,
      prescriptionScname: json['prescription_scname'] as String,
      scname: json['scname'] as String,
      state: json['state'] as String,
      interactionType: (json['interaction_type'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$InteractionToJson(Interaction instance) =>
    <String, dynamic>{
      'prescription_id': instance.prescriptionId,
      'prescription_drug': instance.prescriptionDrug,
      'drug': instance.drug,
      'prescription_scname': instance.prescriptionScname,
      'scname': instance.scname,
      'state': instance.state,
      'interaction_type': instance.interactionType,
    };
