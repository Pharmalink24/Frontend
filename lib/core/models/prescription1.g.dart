// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prescription1.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Prescription1 _$Prescription1FromJson(Map<String, dynamic> json) =>
    Prescription1(
      id: json['id'] as int,
      doctorInfo:
          DoctorInfo.fromJson(json['doctorInfo'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$Prescription1ToJson(Prescription1 instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctorInfo': instance.doctorInfo,
      'created_at': instance.createdAt,
    };
