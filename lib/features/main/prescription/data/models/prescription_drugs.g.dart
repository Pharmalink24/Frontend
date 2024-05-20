// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_drugs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionDrugs _$PrescriptionDrugsFromJson(Map<String, dynamic> json) =>
    PrescriptionDrugs(
      id: json['id'] as int,
      doctorId: json['doctor_id'] as int,
      userId: json['user_id'] as int,
      createdAt: json['created_at'] as String,
      drugs: (json['drugs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DrugInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PrescriptionDrugsToJson(PrescriptionDrugs instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'drugs': instance.drugs,
    };
