// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrescriptionInfo _$PrescriptionInfoFromJson(Map<String, dynamic> json) =>
    PrescriptionInfo(
      id: json['id'] as int,
      sessionId: json['session'] as int,
      doctorId: json['doctor_id'] as int,
      userId: json['user_id'] as int,
      createdAt: json['created_at'] as String,
      diagnosis: json['diagnosis'] as String,
      doctorNotes: json['doctor_notes'] as String,
      tests: json['tests'] as String,
      nextVisit: json['next_visit'] as String?,
      drugs: (json['drugs'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, DrugInfo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$PrescriptionInfoToJson(PrescriptionInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session': instance.sessionId,
      'doctor_id': instance.doctorId,
      'user_id': instance.userId,
      'created_at': instance.createdAt,
      'drugs': instance.drugs,
      'diagnosis': instance.diagnosis,
      'doctor_notes': instance.doctorNotes,
      'tests': instance.tests,
      'next_visit': instance.nextVisit,
    };
