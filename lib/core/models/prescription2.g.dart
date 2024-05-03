// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prescription2 _$Prescription2FromJson(Map<String, dynamic> json) =>
    Prescription2(
      id: json['id'] as int,
      doctorId: json['doctor_id'] as int,
      userId: json['user_id'] as int,
      createdAt: json['created_at'] as String,
      drugs: (json['drugs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DrugInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$Prescription2ToJson(Prescription2 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor_id': instance.doctorId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'drugs': instance.drugs,
    };
